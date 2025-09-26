<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Category;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = Category::all();
        return view('post.newPost', ['data' => $categories]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $category = Category::where('name', $request->category)->first();

        $request->validate([
            "title" => 'required',
            "content" => 'required',
            "category" => 'required',
            "image"=> 'required|image|mimes:jpeg,png,jpg,gif,svg|max:3072', // Validate image file
        ]);
        $imageName = null;
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '-' . $image->getClientOriginalName();
            $image->move(public_path('uploads'), $imageName);
        }
        Post::create([
            'title' => $request->title,
            'content' => $request->content,
            'user_id' => Auth::user()->id,
            'cat_id' => $category->id,
            'slug' => $this->generateUniqueSlug($request->title),
            'image' => $imageName ?? null, // Use null if no image is uploaded
        ]);
        return redirect('/dashboard')->with('success', 'Post successfully  added');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $slug)
    {
        $post = Post::with(['category', 'user'])->where('slug', $slug)->firstorFail();
        $relatedPosts = Post::where('cat_id', $post->cat_id)
            ->where('id', '!=', $post->id)
            ->where('status','published')
            ->orderBy('created_at', 'desc')
            ->take(12)
            ->get();
        $post->increment('views');
        
        return view('post.singlePost', ['data' => $post, 'relatedposts' => $relatedPosts]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, string $slug)
    {
        $post = Post::with('category')->where('slug', $slug)->firstOrFail();
        $category = Category::all();

        $currentPage = $request->input('page', 1);
        // dd($currentPage);

        return view('post.updatePost', ['data' => $post, 'categories' => $category, 'currentPage' => $currentPage]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $slug)
    {
        $post = Post::where('slug', $slug)->firstorFail();
        $request->validate([
            "title" => 'required',
            "content" => 'required',
            "category" => 'required',
            "image" => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:3072',

        ]);
        $imageName = $post->image;
        if ($request->hasFile('image')) {
            if ($post->image && file_exists(public_path('uploads/' . $post->image))) {
                unlink(public_path('uploads/' . $post->image));
            }
            $image = $request->file('image');
            $imageName = time() . '-' . $image->getClientOriginalName();
            $image->move(public_path('uploads'), $imageName);
        }
        $update = $post->update([
            'title' => $request->title,
            'content' => $request->content,
            'cat_id' => $request->category,
            'slug' => $this->generateUniqueSlug($request->title),
            'image' => $imageName,
        ]);

        $redirectPage = $request->input('page', 1);


        if ($update) {
            return redirect()->route('dashboard', ['page' => $redirectPage])->with('success', 'Post successfully updated');
        } else {
            return redirect()->route('dashboard', ['page' => $redirectPage])->with('error', 'Post not updated');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, string $slug)
    {
        $post = Post::where('slug', $slug)->firstorFail();
        $post->delete();

        $postsPerPage = 3;
        $paginator = Post::paginate($postsPerPage);
        $redirectToPage = ($request->page <= $paginator->lastPage()) ? $request->page : $paginator->lastPage();
        return redirect()->route('dashboard', ['page' => $redirectToPage])->with('success', 'Post successfully deleted');
    }


    public function generateUniqueSlug($title)
    {
        $slug = Str::slug($title);

        $originalslug = $slug;
        $count = 1;

        while (Post::where('slug', $slug)->exists()) {
            $slug = $originalslug . '-' . $count;
            $count++;
        }
        return $slug;
    }

    public function upload(Request $request)
    {
        if ($request->hasFile('upload')) {

            $originName = $request->file('upload')->getClientOriginalName();

            $fileName = pathinfo($originName, PATHINFO_FILENAME);

            $extension = $request->file('upload')->getClientOriginalExtension();

            $fileName = $fileName . '_' . time() . '.' . $extension;

            $request->file('upload')->move(public_path('uploads'), $fileName);

            $url = asset('uploads/' . $fileName);


            return response()->json(['fileName' => $fileName, 'uploaded' => 1, 'url' => $url]);
        }
    }

    public function updateStatus($id){

        $post=Post::findOrFail($id);

        if($post->status == 'pending'){
            $post->status = 'published';
        } elseif($post->status == 'published'){
            $post->status = 'blocked';
        } elseif($post->status == 'blocked'){
            $post->status = 'pending';
        }
        $post->save();
        return redirect()->back()->with('success', 'Post status updated successfully');
    }
}

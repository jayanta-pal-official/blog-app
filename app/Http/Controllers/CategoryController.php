<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use  App\Models\Category;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = Category::query();
        if ($request->has('search')) {
            $search = $request->search;
            $userIds = User::where('name', 'LIKE', "%{$search}%")->pluck('id');
            $query->where('name', 'LIKE', "%{$search}%")
                ->orWhereIn('added_by',  $userIds);
        }

        if (Auth::user()->role === 'admin') {
            $categries = $query->latest()->paginate(5)->appends(request()->all());
            return view('admin.category', ['data' => $categries, 'search' => $request->search]);
        } else {
            $categries = $query->latest()->paginate(5)->appends(request()->all());
            return view('user.category', ['data' => $categries, 'search' => $request->search]);
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:categories'
        ]);
        $category = Category::create([
            'name' => $request->name,
            'slug' => Str::slug($request->name),
            'added_by' => Auth::user()->id,
        ]);
        if ($category) {
            return redirect()->back()->with('success', 'Category Added Successfully');
        } else {
            return redirect()->back()->with('error', 'Something went wrong');
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required|unique:categories'
        ]);

        $category = Category::where('id', $id)->update([
            'name' => $request->name,
            'slug' => Str::slug($request->name),
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $slug)
    {
        $category = Category::where('slug', $slug)->firstOrFail();

        if ($category->posts()->exists()) {
            return redirect()->route('category.index')->with('warning', 'Category cannot be deleted because it has associated posts.');
        } else {
            $category->delete();
            return redirect()->route('category.index')->with('success', 'category deleted successfully.');
        }
    }
}

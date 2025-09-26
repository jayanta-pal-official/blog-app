<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Post;
use App\Models\Category;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index(Request $request)
    {
        
         $query=Post::query();
        if (request('search')) {
            $search = request('search');
            $query->where('title', 'like', '%' . $search . '%')
            ->orWhere('content', 'like', '%' . $search . '%');
        }
        $totalposts = $query->count();
        $totalusers = User::count();
        $totalcategories = Category::count();
        $totalviews = $query->sum('views');


        if (Auth::user()->role === 'admin') {
            $posts = $query->latest()->paginate(3)->appends(request()->all());


            return view('admin.dashboard', ['data' => $posts, 'totalposts' => $totalposts, 'totalusers' => $totalusers, 'totalcategories' => $totalcategories, 'totalviews' => $totalviews, 'search' => $request->search]);
        } else {
            $posts = $query->where('user_id', Auth::user()->id)->latest()->paginate(3);
            // $posts= Post::paginate(3);
            return view('user.dashboard', ['data' => $posts, 'totalposts' => $totalposts, 'totalusers' => $totalusers, 'totalcategories' => $totalcategories, 'search' => $request->search]);
        }
    }

    public function show(Request $request)
    {
        $query = User::query();
        if ($request->has('search')) {
            $search = $request->search;
            $query->where('name', 'LIKE', "%{$search}%")
                ->orWhere('email', 'LIKE', "%{$search}%");
        }

        if (Gate::allows('isAdmin')) {
            $users = $query->where('id', '!=', Auth::id())->latest()->paginate(5)->appends(request()->all());   //authenticated admin's ID is excluded from the results
            return view('admin.user', ['data' => $users, 'search' => $request->search]);
        } else {
            return view('index');
        }
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed',
            'role' => 'required',
        ]);
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => $request->role,
        ]);
        if ($user) {
            return redirect('/user')->with('success', 'User created successfully.');
        } else {
            return redirect('/user')->with('error', 'Failed to create user.');
        }
    }
    public function updatestatus(Request $request)

    {

        $user = User::find($request->id);

        if ($user) {
            $user->status = $request->status;
            $user->save();

            return response()->json(['success' => true, 'message' => 'Status updated successfully.']);
        } else {
            return response()->json(['success' => false, 'message' => 'User not found.'], 404);
        }
        $user->status = !$user->status;
        $user->save();
        return redirect('/user')->with('success', 'User status updated successfully.');
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email,' . $id,
            'role' => 'required|in:user,admin',
            'image' => 'nullable|image|max:2048',
        ]);

        $user = User::findOrFail($id);
        $user->name = $request->name;
        $user->email = $request->email;
        $user->role = $request->role;

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('uploads'), $imageName);
            $user->image = $imageName;
        }
        $user->save();
        return response()->json(['success' => true, 'message' => 'User updated successfully.']);
        // return redirect('user')->with('success', 'User updated successfully.');
    }

    public function destroy(string $id)
    {
        $user = User::find($id);
        $user->delete();
        return redirect('/user')->with('success', 'User deleted successfully');
    }
}

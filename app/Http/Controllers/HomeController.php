<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;

class HomeController extends Controller
{
    public function index()
    {
        $post = Post::with(['category','user'])->where('status','published')->latest()->paginate(8);
        $latestPost = $post->first();
        return view('index', ['data' => $post, 'latestPost' => $latestPost]);
    }


    public function show($slug)
    {

        $post = Post::where('slug', $slug)->firstOrFail();
        $relatedPosts = Post::where('cat_id', $post->cat_id)
            ->where('id', '!=', $post->id)
            ->where('status','published')
            ->orderBy('created_at', 'desc')
            ->take(12)
            ->get();

        return view('post.SinglePost', ['data' => $post, 'relatedposts' => $relatedPosts]);
    }
}

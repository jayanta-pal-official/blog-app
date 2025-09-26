<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SocialiteController;
use App\Http\Controllers\UserController;

use GuzzleHttp\Middleware;
use Illuminate\Support\Facades\Auth;

Route::get('/', [HomeController::class, 'index'])->name('home');
Route::get('/post-details/{slug}', [HomeController::class, 'show'])->name('post.singlepost');

require __DIR__ . '/auth.php';

Route::get('auth/google', [SocialiteController::class, 'googleLogin'])->name('auth.google');
Route::get('auth/google-callback', [SocialiteController::class, 'googleAuthentication'])->name('auth.google-callback');

Route::middleware('auth')->group(function () {
    Route::get('/user/profile', [ProfileController::class, 'index'])->name('user.profile');
    Route::put('/profile/update', [ProfileController::class, 'update'])->name('profile.update');
    Route::get('/dashboard', [UserController::class, 'index'])->name('dashboard');
    Route::get('/user', [UserController::class, 'show'])->middleware('can:isAdmin')->name('user');
    Route::post('/add-user', [UserController::class, 'store'])->middleware('can:isAdmin')->name('add.new.user');
    Route::put('/update-user/{id}', [UserController::class, 'update'])->middleware('can:isAdmin')->name('update.user');
    Route::post('/update-status', [UserController::class, 'updatestatus'])->middleware('can:isAdmin')->name('update.status');
    Route::get('/user-delete/{id}', [UserController::class, 'destroy'])->middleware('can:isAdmin')->name('user.delete');
    Route::resource('post', PostController::class)->names('post');
    Route::patch('post/{id}/update-status', [PostController::class, 'updateStatus'])->name('post.update.status');
    Route::resource('category', CategoryController::class)->names('category');
    Route::post('ckeditor/upload', [PostController::class, 'upload'])->name('ckeditor.upload');
});

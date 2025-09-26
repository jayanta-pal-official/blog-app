<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Laravel\Socialite\Facades\Socialite;
use App\Models\User;
use Exception;

class SocialiteController extends Controller
{
    public function googleLogin()
    {
        return Socialite::driver('google')->redirect();
    }
    public function googleAuthentication()
    {
        try {
            $google_user = Socialite::driver('google')->user();

            $userData = User::updateOrCreate(
                ['google_id' => $google_user->id],
                [
                    'name' => $google_user->name,
                    'email' => $google_user->email,
                    'password' => Hash::make(Str::random(8)),
                ]
            );
            if ($userData) {
                Auth::login($userData);
                session()->regenerate();
                return redirect()->intended('/dashboard');
            }
        } catch (Exception $e) {
            return redirect()->route('login')->with('error', 'Google login failed. Please try again.');
        }
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\View\View;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Redirect;
use App\Http\Requests\ProfileUpdateRequest;

class ProfileController extends Controller
{
    public function index()
    {
        return view('user-profile.profile', [
            'user' => Auth::user(),
        ]);
    }
    /**
     * Display the user's profile form.
     */
    public function edit(Request $request): View
    {
        return view('profile.edit', [
            'user' => $request->user(),
        ]);
    }

    /**
     * Update the user's profile information.
     */
    public function update(Request $request): RedirectResponse
    {
        try {
            $user = $request->user();
            $validated = $request->validate([
                'name' => 'required|string|max:255',
                'phone' => 'required|numeric|digits:10',
                'password' => 'nullable|min:8|confirmed',
                'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:4086',
            ]);

            $user->name = $validated['name'];

            $user->phone = $validated['phone'];


            if ($request->filled('password')) {
                $user->password = Hash::make($validated['password']);
            }

            if ($request->hasFile('profile')) {
                if ($user->image && file_exists(public_path('profile/' . $user->image))) {
                    unlink(public_path('profile/' . $user->image));
                }
                $file = $request->file('profile');

                $filename = time() . '_' . $file->getClientOriginalName();

                $file->move(public_path('profile/'), $filename);

                $user->image = $filename;
            }


            $user->save();
            return redirect()->back()->with('success', 'Profile updated successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }

    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current_password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }

  
}

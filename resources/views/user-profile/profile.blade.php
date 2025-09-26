@extends('custom_layouts.app')
@section('title')
Profile
@endsection
@section('content')
<!-- Dashboard Heading and Welcome Message -->
<section class="dashboard-header">
  <div class="text">
    @can('isAdmin')
    <h1>Admin Dashboard</h1>
    @else
    <h1>User Dashboard </h1>
    @endcan

    <p>Hi {{ Auth::user() ? explode(' ', Auth::user()->name)[0] :''}}, welcome back!</p></br>
  </div>
</section>

<div class="editProfile-container mt-1">
  <h2 class="text-center form-title">Edit Your Profile</h2>
  <div class="profile_img_box">
    <form action="{{ route('profile.update', $user->id)}}" method="POST" enctype="multipart/form-data">
      @csrf
      @method('PUT')
      @if(Auth::user()->image)
      <img class="profile_img" id="previewImg" src="{{ asset('profile/' . Auth::user()->image) }}" alt="Profile_image" />
      @else
      <img src="{{ asset('assets/images/user.png') }}" class="profile_img" id="previewImg" />
      @endif

      <div class="edit" onclick="document.getElementById('imageUpload').click();">
        <i class="fa-solid fa-pen-to-square"></i>
      </div>
      <input type="file" id="imageUpload" name="profile" style="display: none;" accept="image/*"
        onchange="previewImage(event)">
  </div>

  <div class="row">
    <div class="col-lg-6">
      <div class="form-group">
        <label for="name">Full Name</label>
        <div class="input-icon">
          <input type="text" class="form-control" value="{{ $user->name }}" id="name" name="name"
            placeholder="Enter your full name" />
          <i class="fas fa-user"></i>
        </div>
      </div>
    </div>
    <div class="col-lg-6">
      <div class="form-group">
        <label for="name">Role</label>
        <div class="input-icon">
          <input type="text" class="form-control" value="{{ $user->role ==  'admin' ? 'Admin' : 'User' }}""
                id=" name" disabled />
          <i class="fas fa-user"></i>
        </div>
      </div>
    </div>

    <div class="col-lg-6">
      <div class="form-group">
        <label for="email">Email Address</label>
        <div class="input-icon">
          <input type="email" class="form-control" value="{{ $user->email }}" id="email" placeholder="Enter your email"
            disabled />

          <i class="fas fa-envelope"></i>
        </div>
      </div>
    </div>

    <div class="col-lg-6">
      <div class="form-group">
        <label for="mobile">Mobile</label>
        <div class="input-icon">
          <input type="text" class="form-control" value="{{ $user->phone }}" name="phone" id="phone"
            placeholder="Enter your Mobile number" />
          <i class="fas fa-phone"></i>
        </div>
      </div>
    </div>

    <div class="col-lg-6">
      <div class="form-group">
        <label for="password">New password</label>
        <div class="input-icon">
          <input type="password" class="form-control" id="password" name="password" placeholder="Enter new password" />
          <i class="fas fa-lock"></i>
        </div>

      </div>
    </div>

    <div class="col-lg-6">
      <div class="form-group">
        <label for="confirmPassword">Confirm password</label>
        <div class="input-icon">
          <input type="password" class="form-control" name="password_confirmation" id="confirmPassword"
            placeholder="Confirm your password" />
          <i class="fas fa-lock"></i>
        </div>
      </div>
    </div>
    <div class="d-flex justify-content-end">
      <button type="submit" class="btn btn-primary edit-save">Save Changes</button>
    </div>
  </div>

</div>

</form>
</div>
<script>
    function previewImage(event) {
        const input = event.target;
        const reader = new FileReader();

        reader.onload = function () {
            const preview = document.getElementById('previewImg');
            preview.src = reader.result;
        };

        if (input.files && input.files[0]) {
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

@endsection
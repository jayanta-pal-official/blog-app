@include('custom_layouts.navbar')

  <div class="container">
      <div class="registration-container">
        <h2 class="text-center form-title">Create Account</h2>
        <form method="POST" action="{{ route('register') }}">
        @csrf
          <div class="form-group">
            <label for="name">Full Name</label><sup class="text-danger"> * </sup>
            <div class="input-icon">
              <input
                type="text"
                class="form-control"
                id="name"
                name="name"
                placeholder="Enter your full name"
                value="{{old('name')}}" 
              />
              <i class="fas fa-user"></i>
                   @error('name')
                    <small class="text-danger">{{ $message }}</small>
                    @enderror
            </div>
          </div>

          <div class="form-group">
            <label for="email">Email Address</label><sup class="text-danger"> * </sup>
            <div class="input-icon">
              <input
                type="email"
                class="form-control"
                name="email"
                id="email"
                placeholder="Enter your email"
                value="{{old('email')}}" 
              />
              <i class="fas fa-envelope"></i>
                  @error('email')
                    <small class="text-danger">{{ $message }}</small>
                    @enderror
            </div>
          </div>
          <div class="form-group">
            <label for="mobile">Mobile</label><sup class="text-danger"> * </sup>
            <div class="input-icon">
              <input
                type="text"
                class="form-control"
                name="phone"
                id="phone"
                placeholder="Enter your Mobile number"
                value="{{old('phone')}}" 
              />
              <i class="fas fa-phone"></i>
                  @error('phone')
                    <small class="text-danger">{{ $message }}</small>
                    @enderror
            </div>
          </div>

          <div class="form-group">
            <label for="password">Password</label><sup class="text-danger"> * </sup>
            <div class="input-icon">
              <input
                type="password"
                class="form-control"
                id="password"
                name="password"
                placeholder="Create a strong password"
              />
              <i class="fas fa-lock"></i>
                @error('password')
                    <small class="text-danger">{{ $message }}</small>
                    @enderror
            </div>
          </div>

          <div class="form-group">
            <label for="confirmPassword">Confirm Password</label><sup class="text-danger"> * </sup>
            <div class="input-icon">
              <input
                type="password"
                class="form-control"
                name="password_confirmation"
                id="confirmPassword"
                placeholder="Confirm your password"
              />
              <i class="fas fa-lock"></i>
            </div>
          </div>

          <button type="submit" class="btn btn-primary btn-block btn-register">
            Create Account
          </button>

          <div class="text-center mt-3">
            <small class="text-muted"
              >Already have an account? <a href="">Sign In</a></small
            >
          </div>
        </form>
      </div>
    </div>

    @include('custom_layouts.footer')

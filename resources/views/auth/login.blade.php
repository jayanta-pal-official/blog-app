@include('custom_layouts.navbar')

<div class="container">
    <div class="login-container">
        <h2 class="text-center form-title">Welcome Back</h2>
        <form method="POST" action="{{ route('login') }}">
            @csrf
            <div class="form-group">
                <label for="email">Email Address</label>
                <div class="input-icon">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email"
                        value="{{old('email')}}" />
                    <i class="fas fa-envelope"></i>
                    @error('email')
                    <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-icon">
                    <input type="password" class="form-control" name="password" id="password"
                        placeholder="Enter your password" />
                    <i class="fas fa-lock"></i>
                    @error('password')
                    <small class="text-danger">{{ $message }}</small>
                    @enderror
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-block btn-login">
                Sign In
            </button>
            <div class="text-center my-3">
                <span>OR</span>
            </div>

            <!-- Google Login Button -->
            <div class="text-center mb-3">
                <a href="{{route('auth.google')}}" class="google-btn">
                    <div class="google-icon-wrapper">
                        <img class="google-icon"
                            src="https://similarpng.com/_next/image?url=https%3A%2F%2Fimage.similarpng.com%2Ffile%2Fsimilarpng%2Fvery-thumbnail%2F2020%2F06%2FLogo-google-icon-PNG.png&w=3840&q=75"
                            alt="Google Logo">
                    </div>
                    <p class="btn-text"><b>Continue with Google</b></p>
                </a>
            </div>
            <div class="text-center mt-3">
                <small class="text-muted">Don't have an account? <a href="{{route('register')}}">Create
                        Account</a></small>
            </div>
        </form>
    </div>
</div>
@include('custom_layouts.footer')

<style>
    .google-btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        background-color: #ffffff;
        color: #5f6368;
        border: 1px solid #dadce0;
        border-radius: 4px;
        font-size: 14px;
        font-weight: 500;
        text-decoration: none;
        padding: 12px 12px;
        width: 100%;
        /* max-width: 300px; */
        margin: auto;
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s, box-shadow 0.3s;
    }

    .google-btn:hover {
        background-color: #f7f8f8;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
        text-decoration: none;
        color: #444;
    }

    .google-icon-wrapper {
        background-color: transparent;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-right: 10px;
    }

    .google-icon {
        width: 20px;
        height: 20px;
    }

    .btn-text {
        margin: 0;
        font-family: 'Roboto', sans-serif;
        white-space: nowrap;
    }
</style>
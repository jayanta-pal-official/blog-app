<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Blog Page</title>
  <!-- bootstrap link -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous" />
  <!-- css link -->
  <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}" />
  <link rel="stylesheet" href="{{ asset('assets/css/responsive.css')}}" />
  <!-- google fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
    rel="stylesheet" />

  <!-- Slick CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

  <!-- font awsome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
</head>

<body>
  <!-- navbar -->
  <header class="home sticky-top">
    <nav class="navbar custom_nav navbar-expand-lg">
      <div class="container">
        <!-- Logo -->
        <a class="navbar-brand" href="{{ route('home') }}">
          <img class="img-fluid logo" src="{{ asset('assets/images/logo.PNG') }}" alt="logo" />
        </a>

        <!-- Toggler for mobile -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
          aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Menu Items -->
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto">
            <!-- Home -->
            <li class="nav-item">
              <a class="nav-link active" href="{{ route('home') }}">Home</a>
            </li>

            @if (Route::has('login'))
            @auth
            <!-- Dropdown -->
            <li class="nav-item dropdown position-relative">
              <a class="nav-link dropdown-toggle  text-decoration-none" href="#" id="navbarDropdown" role="button"
                data-bs-toggle="dropdown" aria-expanded="false">

                <em class="m-0 p-0">
                  <img
                    src="{{ Auth::user()->image ? asset('profile/' . Auth::user()->image) : asset('assets/images/logo.PNG') }}"
                    alt=""
                    style="width: 40px; height: 40px; object-fit: cover; border-radius: 50%; text-decoration: none;">
                </em>&nbsp;
                <span>Hi, @if (Auth::check())
                  {{ucfirst(Auth::user()->name)}}
                  @endif</span>

              </a>
              <ul class="dropdown-menu custom-dropdown" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="{{ route('dashboard') }}">Dashboard</a></li>
                <li><a class="dropdown-item" href="{{ route('post.create') }}">Create Post</a></li>
                <li>
                  <hr class="dropdown-divider">
                </li>
                <li>
                  <a class="dropdown-item" href="{{ route('logout') }}"
                    onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    Logout
                  </a>
                </li>
              </ul>
              <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                @csrf
              </form>
            </li>
            @else
            <!-- Login -->
            <li class="nav-item">
              <a class="nav-link" href="{{ route('login') }}">Log in</a>
            </li>
            @if (Route::has('register'))
            <!-- Register -->
            <li class="nav-item">
              <a class="nav-link" href="{{ route('register') }}">Register</a>
            </li>
            @endif
            @endauth
            @endif
          </ul>
        </div>
      </div>
    </nav>
  </header>


  <style>
    /* Required for positioning dropdown menu */
    .nav-item.dropdown {
      position: relative;
    }

    /* Default (desktop) */
    .dropdown-menu.custom-dropdown {
      left: auto;
      right: 0;
      transform: none;
      text-align: center;
    }
  </style>
  <!-- navbar end -->
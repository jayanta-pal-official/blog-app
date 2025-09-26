<!-- Sidebar -->
<aside class="sidebar">
  <nav class="navbar navbar-expand-md navbar-light">
    <div class="container-fluid">
      <!-- Toggler Button -->
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarContent"
        aria-controls="sidebarContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <!-- Sidebar Content -->
      <div class="collapse navbar-collapse" id="sidebarContent">
        <div class="">
          <!-- User Info -->
          <div class="user-info">
            <img
              src="{{ Auth::user()->image ? asset('profile/' . Auth::user()->image): asset('assets/images/user.png') }}"
              alt="User Image" class="user-image" />
            <h5>{{ Auth::user() ? Auth::user()->name : ''}}</h5>
          </div>

          <!-- Navigation Links -->
          <nav class="sidebar-nav">
            @if(Auth::check())
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link {{ request()->routeIs('dashboard') ? 'active':''}}"
                  href="{{route('dashboard')}}">Dashboard</a>
              </li>
              <li class="nav-item">
                <a class="nav-link {{ request()->routeIs('home') ? 'active':''}}"
                  href="{{route('home')}}">Blogs</a>
              </li>

              <li class="nav-item">
                <a class="nav-link {{ request()->routeIs('category.*') ? 'active':''}}"
                  href="{{ route('category.index')}}">Category</a>
              </li>
              @can('isAdmin')
              <li class="nav-item">
                <a class="nav-link {{ request()->routeIs('user') ? 'active':''}}" href="{{route('user')}}">Users</a>
              </li>
              @endcan
              <li class="nav-item">
                <a class="nav-link  {{ request()->routeIs('user.profile') ? 'active':'' }}" href="{{ route('user.profile')}}">Profile</a>
              </li>
              <li class="nav-item">
                <form method="POST" action="{{ route('logout') }}">
                  @csrf
                  <button class="btn btn-outline-danger btn-new-post">
                    <i class="fa-solid fa-right-from-bracket"></i> Logout
                  </button>
                </form>
              </li>
            </ul>
            @endif
          </nav>

          <!-- New Post Button -->
        </div>
      </div>
    </div>
  </nav>
</aside>
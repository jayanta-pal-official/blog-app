@extends('custom_layouts.app')
@section('title', 'admin')

@section('content')
<!-- Dashboard Heading and Welcome Message -->
<section class="dashboard-header">
  <div class="text">
    <h1>Admin Dashboard</h1>
    <p> Hi {{ Auth::user() ? explode(' ', Auth::user()->name)[0] :''}}, welcome back!</p>
  </div>
</section>

<!-- Statistics Cards -->
<section class="cards">
  <div class="card">
    <p>{{$totalposts}}</p>
    <h3>Total Posts</h3>
  </div>
  <div class="card">
    <p>{{$totalusers}}</p>
    <h3>Total Users</h3>
  </div>
  <div class="card">
    <p>{{$totalviews}}</p>
    <h3>Total Views</h3>
  </div>
  <div class="card">
    <p>{{$totalcategories}}</p>
    <h3>Total Category</h3>
  </div>
</section>

<!-- Scrollable Table -->
<section class="table-section">
  <div class="table_top d-flex mb-3">
    <div>
      <h2>All Posts</h2>
      <div class="row g-2">
        <form method="" action="" class="row g-2">
          <div class="col-lg-10">
            <input type="text" name="search" class="form-control" placeholder="Search..." aria-label="First name"
              value="{{ isset($search) ? $search :'' }}" />
          </div>
          <div class="col-lg-2">
            <button type="submit" class="btn btn-success">Search</button>
          </div>
        </form>
      </div>
    </div>
    <div class="logout ms-auto mt-auto">
      <a href="{{route('post.create')}}"><button class="btn btn-primary">+ New Post</button></a>
    </div>
  </div>
  <div class="table-container">
    <table>

      <thead>
        <tr>
          <th>ID</th>
          <th>Title</th>
          <th>Description</th>
          <th>Image</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        @php $count=1 @endphp
        @forelse($data as $values)
        <tr>
          <td>{{$count}}</td>
          <td>{{ Str::limit($values->title, 30, '...') }}</td>
          <td>{{ Str::limit(strip_tags($values->content), 50, '...') }}</td>
          <td>
            <img src="{{ $values->image ? asset('uploads/'. $values->image): '' }}" alt="Post Image" class="post-image"
              width="100" height="90" />
          </td>
          <td class="
                @if($values->status == 'pending') text-warning
                @elseif($values->status == 'published') text-success
                @elseif($values->status == 'blocked') text-danger
                @endif
            ">
            {{ ucfirst($values->status) }}
          </td>
          <td>
            <div style="display: flex; flex-wrap: wrap; gap: 5px;">
              <a class="btn btn-sm btn-view" href="{{ route('post.show', $values->slug) }}">View</a>

              <a class="btn btn-sm btn-edit"
                href="{{ route('post.edit', ['post' => $values->slug, 'page' => request('page', 1)]) }}">Edit</a>

              <form class="post_delete" method="POST" action="{{ route('post.destroy', $values->slug) }}"
                onsubmit="return confirm('Are you sure you want to delete this post?');">
                @csrf
                @method('DELETE')
                <input type="hidden" name="page" value="{{ $data->currentPage() }}">
                <button type="submit" class="btn btn-sm btn-delete">Delete</button>
              </form>

              @if ($values->status === 'pending')
              <form action="{{ route('post.update.status', $values->id) }}" method="POST">
                @csrf
                @method('PATCH')
                <button type="submit" class="btn btn-sm btn-success"
                  onclick=" return confirm('Are you sure?')">Published</button>
              </form>

              @elseif ($values->status === 'published')
              <form action="{{ route('post.update.status', $values->id) }}" method="POST">
                @csrf
                @method('PATCH')
                <button type="submit" class="btn btn-sm btn-danger"
                  onclick=" return confirm('Are you sure to block this post?')">Blocked</button>
              </form>

              @elseif ($values->status === 'blocked')
              <form action="{{ route('post.update.status', $values->id) }}" method="POST">
                @csrf
                @method('PATCH')
                <button type="submit" class="btn btn-sm btn-warning"
                  onclick=" return confirm('Are you sure to pending this post?')">Pending</button>
              </form>
              @endif
            </div>
          </td>


        </tr>
        @php $count++ @endphp
        @empty
        <tr>
          <td colspan="5" class="text-center">No posts found.</td>
          @endforelse
          <!-- Additional rows as needed -->
      </tbody>
    </table>
    <div class="pagenation mt-4 p-3">{{$data->links()}}</div>
  </div>
</section>

@endsection
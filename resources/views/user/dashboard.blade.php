@extends('custom_layouts.app')
@section('title', 'user ')

@section('content')

<!-- Dashboard Heading and Welcome Message -->
<section class="dashboard-header">
  <div class="text">
    <h1> User Dashboard</h1>
    <p>Hi {{ Auth::user() ? explode(' ', Auth::user()->name)[0] :''}}, welcome back!</p>
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
        @php $count = 1; @endphp
        @foreach($data as $values)
        <tr>
          <td>{{$count}}</td>
          <td>{{ Str::limit($values->title, 50, '...') }}</td>
          <td>{{ Str::limit(strip_tags($values->content), 80, '...') }}</td>
          <td>
            <img src="{{ $values->image ? asset('uploads/'. $values->image): '' }}" alt="Post Image" class="post-image"
              width="90" height="90" />
          </td>
          <td>
            @if ($values->status == 'published')
            <h6 class="text-success" >{{ 'Published' }}</h6>
            @elseif ($values->status == 'pending')
             <h6 class="text-warning" >{{ 'Under Review' }}</h6>
            @elseif ($values->status == 'blocked')
             <h6 class="text-danger" >{{ 'Blocked' }}</h6>
            @else
            <h6></h6>
            @endif
          </td>
          <td>
            <a class="btn btn-view" href="{{ route('post.show', $values->slug) }}">View</a>

            <a class="btn btn-edit"
              href="{{route('post.edit',['post' => $values->slug, 'page' => request('page', 1)])}}">Edit</a>
        <tr>
          @php $count++ ; @endphp
          @endforeach



          <!-- Additional rows as needed -->
      </tbody>
    </table>
    <div class="pagenation mt-4 p-3">{{$data->links()}}</div>
  </div>
</section>
@endsection
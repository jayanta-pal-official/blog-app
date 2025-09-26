@extends('custom_layouts.app')
@section('title', 'Users List')
@section('content')
<!-- Dashboard Heading and Welcome Message -->
<section class="dashboard-header">
  <div class="text">

    <h1>Admin Dashboard </h1>

    <p>Hi {{ Auth::user() ? explode(' ', Auth::user()->name)[0] :''}}, welcome back!</p>
  </div>
</section>

<!-- Scrollable Table -->
<section class="table-section">
  <div class="table_top d-flex mb-3">
    <div>
      <h2>Users List</h2>
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
      <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUserModal">
        + Add Users
      </button>
    </div>
  </div>

  <div class="table-container">
    <table>
      <thead>
        <tr>
          <th>Sl No.</th>
          <th>Name</th>
          <th>Email</th>
          <th>Role</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        @php
        $count = 1;
        @endphp
        @foreach ($data as $value)
        <tr>
          <td>{{ $count}}</td>
          <td>{{ $value->name}}</td>
          <td>{{ $value->email}}</td>
          <td><button class="btn btn-outline-primary">{{ $value->role}}</button></td>
          <td class="switch">
            <div class="form-check form-switch">

              <input type="checkbox" class="form-check-input status-toggle" data-id="{{ $value->id }}" {{ $value->status
              == 'active' ? 'checked' : '' }}>

            </div>
          </td>
          <td>
            <a class="btn btn-edit" href="#" data-bs-toggle="modal" data-bs-target="#editUserModal"
              data-id="{{ $value->id }}" data-name="{{ $value->name }}" data-email="{{ $value->email }}"
              data-role="{{ $value->role }}"
              data-image="{{ $value->image? asset('uploads/' . $value->image) : asset('assets/images/profile.jpg') }}">
              Edit
            </a>
            <a href="{{route('user.delete', $value->id)}}"
              onclick="return confirm('Are you sure you want to delete ?');"><button
                class="btn btn-delete">Delete</button></a>
          </td>
        </tr>
        @php
        $count++;
        @endphp
        @endforeach

        <!-- Additional rows as needed -->
      </tbody>
    </table>
    <div class="pagenation mt-4 p-3">{{$data->links()}}</div>
  </div>
  <!-- add new user modal -->
  <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="addUserModalLabel">Add New User</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="addUserForm" action="{{ route('add.new.user')}}" method="post">
            @csrf
            <div class="mb-3">
              <label for="name" class="form-label">Name</label>
              <input type="text" class="form-control" id="name" name="name" />
              <span class="text-danger">
                @error('name')
                {{$message}}
                @enderror
              </span>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input type="email" class="form-control" id="email" name="email" />
              <span class="text-danger">
                @error('email')
                {{$message}}
                @enderror
              </span>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <input type="password" class="form-control" id="password" name="password" />
              <span class="text-danger">
                @error('password')
                {{$message}}
                @enderror
              </span>
            </div>
            <div class="mb-3">
              <label for="confirm_password" class="form-label">Confirm Password</label>
              <input type="password" class="form-control" id="confirm_password" name="password_confirmation" />
              <span class="text-danger">
                @error('password_confirmation')
                {{$message}}
                @enderror
              </span>
            </div>
            <div class="mb-3">
              <label for="role" class="form-label">Role</label>
              <select class="form-control" id="role" name="role" required>
                <option value="user">User</option>
                <option value="admin">Admin</option>
              </select>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-primary" id="submitUserForm">
                Add User
              </button>
            </div>
          </form>
        </div>

      </div>
    </div>
  </div>
  <!-- add new user modal end -->

  <!-- edit user model -->
  <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="editUserForm" method="post" action="" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <input type="hidden" name="id" id="editUserId">

            <div class="mb-3">
              <label for="editName" class="form-label">Name</label>
              <input type="text" class="form-control" id="editName" name="name" required>
            </div>
            <div class="mb-3">
              <label for="editEmail" class="form-label">Email</label>
              <input type="email" class="form-control" id="editEmail" name="email" required>
            </div>
            <div class="mb-3">
              <label for="editImage" class="form-label">Image</label>
              <input type="file" class="form-control" id="editImage" name="image" accept="image/*">
              <img class="mt-3" src="" alt="Current Image" id="currentImagePreview" style="max-width: 100px; ">

            </div>
            <div class="mb-3">
              <label for="editRole" class="form-label">Role</label>
              <select class="form-control" id="editRole" name="role" required>
                <option value="user">User</option>
                <option value="admin">Admin</option>
              </select>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Update Changes</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <!-- edit user model end -->
</section>

<script>
  $.ajaxSetup({
      headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });
//onchange function for status button code start
    $(document).ready(function() {
      $('.status-toggle').on('change', function() {
        var userId = $(this).data('id');
        var status = $(this).prop('checked') ? 'active' : 'inactive';

        $.ajax({
          url: "{{route('update.status')}}",
          type: 'POST',
          data: {
            _token: '{{ csrf_token() }}', // Add CSRF token for security
            id: userId,
            status: status,
          },
          success: function(response) {
            if (response.success) {

              toastr.success('Status updated successfully!');

            } else {
              toastr.error('Failed to update status.');

            }
          }

        });
      });
    });
//onchange function for status button code end

//update user using ajax code start
    $(document).ready(function() {
      // Set modal data on button click
      $('.btn-edit').on('click', function() {
        $('#editUserId').val($(this).data('id'));
        $('#editName').val($(this).data('name'));
        $('#editEmail').val($(this).data('email'));
        $('#editRole').val($(this).data('role'));
        $('#currentImagePreview').attr('src', $(this).data('image'));
      });

      // Handle AJAX submission
      $('#editUserForm').on('submit', function(e) {
        e.preventDefault();

        let formData = new FormData(this);
        let userId = $('#editUserId').val();

        let url = `/update-user/${userId}`;
        $.ajax({
          url: url,
          type: 'POST',
          data: formData,
          contentType: false,
          processData: false,
          success: function(response) {
            toastr.success(response.message);
            $('#editUserModal').modal('hide');
            location.reload();
          },
          error: function(xhr) {
            // console.log(xhr);
            // return false;
            alert('An error occurred while updating the user.');
            console.error(xhr.responseText);
          }
        });
      });
    });
    //update user using ajax code start
</script>
@endsection
@extends('custom_layouts.app')
@section('title', 'Category')
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
            <h2>All Category</h2>
            <div class="row g-2">
                <form method="" action="" class="row g-2">
                    <div class="col-lg-10">
                        <input type="text" name="search" class="form-control" placeholder="Search..."
                            aria-label="First name" value="{{ isset($search) ? $search :'' }}" />
                    </div>
                    <div class="col-lg-2">
                        <button type="submit" class="btn btn-success">Search</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="logout ms-auto mt-auto">
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#categoryModal">
                + Add Category
            </button>
        </div>
    </div>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Sl No.</th>
                    <th>Category Name</th>
                    <th>Date</th>
                    <th>Edit</th>
                    <th>Delete</th>
                    <th>Added By</th>
                </tr>
            </thead>
            <tbody>
                @php $count=1; @endphp
                @foreach ($data as $values)

                <tr>
                    <td>{{$count}}</td>
                    <td class="category_name">{{ $values->name}}</td>
                    <td>{{ $values->created_at ? $values->created_at->format('d M Y') : 'No Date Available'}}</td>
                    <td class="uniuqe_td">
                        <a class="btn btn-edit editbtn" data-bs-toggle="modal" data-bs-target="#editModal"
                            data-id="{{ $values->id }}" data-name="{{ $values->name }}"
                            href="{{ route('category.edit', $values->id)}} " id="{{ $values->id }}"><i
                                class="fa-solid fa-pen-to-square"></i></a>
                    </td>
                    <td>

                        <form class="post_delete " method="POST" action="{{route('category.destroy', $values->slug) }}"
                            onsubmit="return confirm('Are you sure you want to delete this post?');">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-delete"> <i class="fa-solid fa-trash"></i></button>
                        </form>

                    </td>
                    <td>
                        {{$values->user->name}}

                    </td>
                </tr>
                @php $count++ @endphp
                @endforeach

                <!-- Additional rows as needed -->
            </tbody>
        </table>
        <div class="pagenation mt-4 p-3">{{$data->links()}}</div>
    </div>
    <!-- Category Modal -->
    <div class="modal fade" id="categoryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('category.store')}}" method="post">
                        @csrf
                        <div class="mb-3">
                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="textHelp"
                                name="name" />
                            <div id="textHelp" class="form-text">
                                Choose a category name (max 30 characters)
                            </div>
                            <span class="text-danger">
                                @error('name')
                                {{$message}}
                                @enderror
                            </span>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Close
                            </button>
                            <button type="submit" class="btn btn-primary">
                                Save changes
                            </button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Edit</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form method="post" id="updateCategoryForm">
                        @csrf
                        <input type="hidden" name="id" id="id">
                        <div class="mb-3">
                            <input type="text" class="form-control" id="update_category" aria-describedby="textHelp"
                                name="cat_name" />
                            <div id="textHelp" class="form-text">
                                Choose a category name (max 30 characters)
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                Close
                            </button>
                            <button type="submit" class="btn btn-primary">
                                Save changes
                            </button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</section>


<script>
    $(document).ready(function() {

            $('.editbtn').on('click', function(event) {

                let cat_id = $(this).attr('id');
                let cat_name = $(this).attr('data-name');

                $('#id').val(cat_id);
                $('#update_category').val(cat_name);
                $('#updateCategoryForm').data('id', cat_id);

                $('#updateCategoryForm').on('submit', function(e) {
                    e.preventDefault();
                    let cat_id = $(this).data('id'); // Retrieve the ID from the form's data attribute
                    let cat_name = $('#update_category').val();
                    $.ajax({
                        type: 'PUT',
                        url: `/category/${cat_id}`,
                        data: {
                            _token: '{{ csrf_token() }}',
                            name: cat_name // Send the updated name
                        },
                        success: function(response) {
                            toastr.success('Category updated successfully!'); // Reload the page to reflect changes
                            location.reload();
                        },
                        error: function(error) {
                            toastr.error('Failed to update category!');
                        }
                    });

                });
            });
        });
</script>
@endsection
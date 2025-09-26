@extends('custom_layouts.app')
@section('title', 'category')
@section('content')

<!-- Dashboard Heading and Welcome Message -->
<section class="dashboard-header">
    <div class="text">

        <h1>User Dashboard </h1>


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

    </div>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Sl No.</th>
                    <th>Category Name</th>
                    <th>Date</th>

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

                    <td>
                        {{$values->user->name}}
                    </td>
                </tr>
                @php $count++ ; @endphp
                @endforeach

                <!-- Additional rows as needed -->
            </tbody>
        </table>
        <div class="pagenation mt-4 p-3">{{$data->links()}}</div>
    </div>


</section>

<script>
    document.addEventListener('DOMContentLoaded', function() {
            const editModal = document.getElementById('editModal');

            // When the modal is about to be shown
            editModal.addEventListener('show.bs.modal', function(event) {
                // Get the button that triggered the modal
                const button = event.relatedTarget;

                // Extract values from data-* attributes
                const categoryId = button.getAttribute('data-id');
                const categoryName = button.getAttribute('data-name');

                // Update the modal's form action
                const form = editModal.querySelector('form');
                form.action = `/categories/${categoryId}`;

                // Populate the input field with the category name
                const inputName = editModal.querySelector('input[name="cat_name"]');
                inputName.value = categoryName;
            });
        });
</script>


@endsection
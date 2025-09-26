<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>New post - Blog Page</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />


  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
    rel="stylesheet" />
  <!-- font awsome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />


  <link rel="stylesheet" href="{{ asset('assets/css/user_style.css') }}" />
  <link rel="stylesheet" href="{{ asset('assets/css/user_responsive.css') }}" />


</head>

<body>
  <div class="container">
  <h1 class="text-center mt-3 mb-3">Create a new post</h1>
  <form class="form-container" method="post" action="{{ route('post.store')}}" enctype="multipart/form-data">
    @csrf
    <div class="mb-3">
      <label for="exampleInputEmail1" class="form-label">Title</label>
      <input type="text" class="form-control" id="Food Blog" aria-describedby="title" name="title"
        value="{{old('title')}}" />

      <span class="text-danger">
        @error('title')
        {{$message}}
        @enderror
      </span>
      <div id="emailHelp" class="form-text">Add a title here</div>
    </div>
    <div class="mb-3">
      <label for="exampleFormControlTextarea1" class="form-label">Blog</label>

      <textarea name="content" id="editor" class="form-control" rows="18">{{old('content')}}</textarea>
      <span class="text-danger">
        @error('content')
        {{$message}}
        @enderror
      </span>

      <span class="text-danger">
        @error('content')
        {{$message}}
        @enderror
      </span>
    </div>
    <div class="mb-3">
      <label for="category" class="form-label">Category</label>
      <select id="category" name="category" class="form-select">
        <option disabled {{ old('category') ? '' : 'selected' }}>-- Select the category --</option>


        @forelse ($data as $values)
        <option value="{{ $values->name }}" {{ old('category')==$values->name ? 'selected' : '' }}>
          {{ $values->name }}
        </option>
        @empty
        <option><a></option>
        @endforelse
      </select>

      <span class="text-danger">
        @error('category')
        {{ $message }}
        @enderror
      </span>
    </div>
    <div id="imageUploadSection" class="mt-3 mb-3 ">
      <div class="row align-items-start">
        <div class="col-md-6">
          <label for="postImage" class="form-label">Upload Featured Image</label>
          <input type="file" class="form-control" name="image" id="postImage" accept="image/*" />

          <span class="text-danger">
            @error('image')
            {{$message}}
            @enderror
          </span>
        </div>
        <div class="col-md-6">
          <div id="imagePreview" class="mt-2" style="display: none">
            <img id="preview" src="#" alt="Preview" style="max-width: 310px" />
          </div>
        </div>
      </div>
    </div>

  
    <div class="buttons">
      <button type="submit" class="btn btn-success">Submit</button>
      <a href="{{route('dashboard')}}"><button type="button" class="btn btn-secondary" id="back">Back</button></a>

    </div>

  </form>
  </div>

  <!-- ck editor script -->
  <script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/ckeditor.js"></script>
  <script>
    ClassicEditor
      .create(document.querySelector('#editor'), {
        ckfinder: {
          uploadUrl: "{{route('ckeditor.upload') . '?_token=' . csrf_token()}}",
        }
      })
      .catch(error => {
        console.error(error);
      });
  </script>
  
  <script>
    document.getElementById('postImage').addEventListener('change', function (event) {
    const imagePreview = document.getElementById('imagePreview');
    const preview = document.getElementById('preview');
    const file = event.target.files[0];

    if (file) {
      const reader = new FileReader();
      reader.onload = function (e) {
        preview.src = e.target.result;
        imagePreview.style.display = 'block';
      };
      reader.readAsDataURL(file);
    } else {
      imagePreview.style.display = 'none';
      preview.src = '#';
    }
  });
  </script>

</body>

</html>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    toastr.options = {
      "closeButton": true,
      "debug": false,
      "newestOnTop": true,
      "progressBar": true,
      "positionClass": "toast-top-right", // Change to "toast-bottom-right", etc.
      "preventDuplicates": false,
      "onclick": null,
      "showDuration": "300",
      "hideDuration": "1000",
      "timeOut": "5000",
      "extendedTimeOut": "1000",
      "showEasing": "swing",
      "hideEasing": "linear",
      "showMethod": "fadeIn",
      "hideMethod": "fadeOut"
    };
  </script>
  @if(session('success'))
  <script>
    toastr.success("{{ session('success') }}");
  </script>
  @endif

  @if(session('error'))
  <script>
    toastr.error("{{ session('error') }}"); // Use toastr.error for error messages
  </script>
  @endif

  @if(session('warning'))
  <script>
    toastr.warning("{{ session('warning') }}"); // Use toastr.error for error messages
  </script>
  @endif


  <script>
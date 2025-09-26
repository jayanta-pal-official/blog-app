@include('custom_layouts.navbar')

<!-- landing -->
<section class="landing_inner">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        <div class="heading_back">
          <div class="head_image">
            <img class="img-fluid" src="{{asset('uploads/'.$data->image )}}" alt="" />
          </div>
          <div class="heading">
            <h1> {{ Str::limit($data->title, 60, '...') }}

            </h1>
            <p class="pt-3">{{ $data->created_at->format('M d') }} </p>
          </div>
        </div>
        <!-- scroll section -->
        <div class="scroll_sec">
          <div class="blog_scroll">
            <div class="only_text">
              <img class="img-fluid" src="#" alt="" />

              <h5> {{$data->title }}</h5>

              <div id="single_post_content">
                {!! html_entity_decode($data->content) !!}
              </div>

            </div>

            <div class="bottom_bar d-flex align-items-center">
              <h5>Like our blog page? Share with your friends.</h5>
              <div class="logos ms-auto">
                <a href=""><i class="fa-brands fa-facebook"></i></a>
                <a href=""><i class="fa-brands fa-x-twitter"></i></a>
                <a href=""><i class="fa-brands fa-instagram"></i></a>
                <a href=""><i class="fa-brands fa-linkedin-in"></i></a>
                <img class="filter" src="{{ asset('assets/images/Vector (2).png')}}" alt="" />
                <img class="filter2" src="{{ asset('assets/images/Vector (3).png')}}" alt="" />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-4">
        <div class="right_pannel">
          <div class="up_card">
            <div class="profile_img d-flex gap-3">
              <img class="img-fluid"
                src="{{ isset($data->user->image) ? asset('uploads/'. $data->user->image) : asset('assets/images/profile.jpg') }}"
                alt="" />
              <div class="logo">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                  <path
                    d="M3.96589 17.9996V5.85458H0.220751V17.9996H3.96628H3.96589ZM2.0941 4.19667C3.39984 4.19667 4.21274 3.26408 4.21274 2.0986C4.1883 0.906565 3.39984 0 2.11893 0C0.837152 0 0 0.906565 0 2.09849C0 3.26397 0.812613 4.19656 2.06956 4.19656H2.09381L2.0941 4.19667ZM6.03888 17.9996H9.78372V11.218C9.78372 10.8555 9.80816 10.492 9.9071 10.2331C10.1777 9.50761 10.7939 8.75658 11.8287 8.75658C13.1836 8.75658 13.7259 9.87021 13.7259 11.503V17.9996H17.4706V11.036C17.4706 7.30574 15.6233 5.56985 13.1593 5.56985C11.1392 5.56985 10.252 6.78686 9.75908 7.61576H9.78401V5.855H6.03907C6.08795 6.99434 6.03878 18 6.03878 18L6.03888 17.9996Z"
                    fill="white" />
                </svg>
              </div>
              <div class="logo">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="18" viewBox="0 0 20 18" fill="none">
                  <path
                    d="M20 3C20 1.9 19.1 1 18 1H2C0.9 1 0 1.9 0 3V15C0 16.1 0.9 17 2 17H18C19.1 17 20 16.1 20 15V3ZM18 3L10 8L2 3H18ZM18 15H2V5L10 10L18 5V15Z"
                    fill="white" />
                </svg>
              </div>
            </div>
            <div class="text_head">
              <h5>Written By <span>{{ $data->user->name ? $data->user->name : 'Unknown Author' }}</span></h5>


              <!-- <p>Founder and CEO</p> -->
            </div>
            <div class="text">
              <p>
                Lorem Ipsum is simply dummy text of the printing and
                typesetting industry. Lorem Ipsum has been the industry's
                standard dummy text ever since the 1500s, when an unknown
                printer took a galley of type and scrambled it to make a
                type specimen book
              </p>
            </div>
            <img class="filter" src="{{ asset('assets/images/Group 1.png')}}" alt="" />
            <img class="filter2" src="{{ asset('assets/images/Vector.png')}}" alt="" />
          </div>
          <div class="down_card">
            <p>Share with your community</p>
            <div class="all_logos d-flex gap-3">
              <div class="logo2">
                <a href=""><i class="fa-brands fa-facebook"></i></a>
              </div>
              <div class="logo2">
                <a href=""><i class="fa-brands fa-x-twitter"></i></a>
              </div>
              <div class="logo2">
                <a href=""><i class="fa-brands fa-instagram"></i></a>
              </div>
              <div class="logo2">
                <a href=""><i class="fa-brands fa-linkedin-in"></i></a>
              </div>
            </div>
            <img class="filter" src="{{ asset('images/Vector (2).png')}}" alt="" />
            <img class="filter2" src="{{ asset('images/Vector (3).png')}}" alt="" />
          </div>
          <div class="article_text">
            <h5>Author's Category</h5>
            <div class="article">
              <a href="">{{$data->category->name}}
              </a>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- landing end -->





<!-- card section -->
<section class="real_card">
  <div class="container">
    <div class="heading d-flex mb-3">
      <h3>Related Articles</h3>

      <!-- Arrows -->
      <div class="ms-auto d-flex gap-3 align-items-center">
        <div class="custom-prev-arrow" style="cursor:pointer;">
          <!-- Prev SVG -->
          <svg xmlns="http://www.w3.org/2000/svg" width="54" height="54" viewBox="0 0 54 54" fill="none">
            <circle cx="27" cy="27" r="25" stroke="#119080" stroke-width="2.5" />
            <path d="M31 35L23 27L31 19" stroke="#119080" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" />
          </svg>
        </div>

        <div class="custom-next-arrow" style="cursor:pointer;">
          <!-- Next SVG -->
          <svg xmlns="http://www.w3.org/2000/svg" width="54" height="54" viewBox="0 0 54 54" fill="none">
            <circle cx="27" cy="27" r="25" fill="#119080" />
            <path d="M19 35L27 27L19 19" stroke="white" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" />
          </svg>
        </div>
      </div>
    </div>

    <!-- Slick Carousel -->
    <div class="slick-carousel">
      @forelse ($relatedposts as $post)
      <div class="px-2">
        <div class="card h-100" style="border-style: none">
          <img src="{{ isset($post->image) ? asset('uploads/' . $post->image) : '' }}" class="card-img-top"
            alt="..." style="width:100%; height: 200px; object-fit: cover; " />
          <div class="card-body">
            <h5 class="card-text">  {{ Str::limit($post->title, 30, '...') }}
</h5>
            <div class="card_bottom d-flex justify-content-center">
              <div class="read_more_btn">
                <a href="{{ route('post.singlepost', $post->slug) }}">Read More</a>
                <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="17"
                      height="8"
                      viewBox="0 0 17 8"
                      fill="none"
                    >
                      <path
                        d="M1 3.5C0.723858 3.5 0.5 3.72386 0.5 4C0.5 4.27614 0.723858 4.5 1 4.5V3.5ZM16.3536 4.35355C16.5488 4.15829 16.5488 3.84171 16.3536 3.64645L13.1716 0.464466C12.9763 0.269204 12.6597 0.269204 12.4645 0.464466C12.2692 0.659728 12.2692 0.976311 12.4645 1.17157L15.2929 4L12.4645 6.82843C12.2692 7.02369 12.2692 7.34027 12.4645 7.53553C12.6597 7.7308 12.9763 7.7308 13.1716 7.53553L16.3536 4.35355ZM1 4.5L16 4.5V3.5L1 3.5V4.5Z"
                        fill="#2D2D2D"
                      />
                    </svg>
              </div>
              <div class="ms-auto">
                <p>{{ $post->created_at->format('d/m/ Y') }}</p>
              </div>
            </div>
          </div>
        </div>
      </div>
      @empty
      <div class="col-12">
        <div class="no-posts">
          <h5>No related posts found.</h5>
        </div>
      </div>
      @endforelse
    </div>
  </div>
</section>
<!-- card section -->


<!-- Slick Initialization -->
<script>
  $(document).ready(function () {
    $('.slick-carousel').slick({
      slidesToShow: 4,
      slidesToScroll: 4,
      arrows: true,
      dots: false,
      infinite: false,
      prevArrow: $('.custom-prev-arrow'),
      nextArrow: $('.custom-next-arrow'),
      responsive: [
        {
          breakpoint: 992,
          settings: {
            slidesToShow: 2,
            slidesToScroll: 2
          }
        },
        {
          breakpoint: 576,
          settings: {
            slidesToShow: 1,
            slidesToScroll: 1
          }
        }
      ]
    });
  });
</script>


@include('custom_layouts.footer')
@include('custom_layouts.navbar')
<!-- landing -->
<section class="landing_inner">

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading_back">
                    <div class="head_image">
                        <img class="img-fluid"
                            src="{{ isset($latestPost->image) ? asset('uploads/'. $latestPost->image ) : ''  }}"
                            alt="latest post Image" />
                    </div>
                    <div class="heading">
                        <h1>{{isset($latestPost->title)? Str::limit($latestPost->title, 60, '...' ): 'No title'}}</h1>
                        <p class="pt-3">{{isset($latestPost->created_at) ? $latestPost->created_at->format('d M y') :
                            'no date'}}</p>
                    </div>
                </div>
                <!-- scroll section -->
                <div class="scroll_sec">
                    <div class="blog_scroll">
                        <div class="row mt-5 mb-5 d-flex justify-content-center">
                         
                            @if($data)
                            @foreach ($data as $post)
                            <div class="col-auto">

                                <a href="{{ route('post.singlepost',$post->slug) }}">
                                    <!-- card -->
                                    <div class="card">
                                        <img src="{{ asset('uploads/'.$post->image) }}" class="card-img-top"
                                            height="164px" alt="..." />
                                        <span class="blog-tag">{{ Str::limit(ucfirst($post->category->name), 20, '...') }}</span>
                                        <div class="card-body">
                                            <p class="card-text">
                                                {{ Str::limit($post->title, 40, '...') }}
                                            </p>

                                        </div>
                                            <div class="bb-btm-inr">
                                                <em><img src="{{$post->user->image ? asset('assets/profile/'.$post->user->image) :  asset('assets/images/user-blog.png')}}" alt="hguygyu"></em>
                                                <text>
                                                    <h5>Posted by : {{ ucfirst($post->user->name)}}</h5>
                                                    <h6>{{$post->created_at->format('d M y')}} |
                                                        {{ceil(str_word_count($post->content) / 200)}} min read</h6>
                                                </text>
                                            </div>
                                    </div>
                                    <!-- card end -->
                                </a>

                            </div>

                            @endforeach
                            @else
                            <p class="card-text"> No post found </p>
                            @endif
                        </div>
                        <div class="pagenation mt-4 p-3">{{$data->links()}}</div>
                        <!-- bottom bar -->
                        <div class="bottom_bar d-flex align-items-center">
                            <h5>Like our blog page? Share with your friends.</h5>
                            <div class="logos ms-auto">
                                <a href=""><i class="fa-brands fa-facebook"></i></a>
                                <a href=""><i class="fa-brands fa-x-twitter"></i></a>
                                <a href=""><i class="fa-brands fa-instagram"></i></a>
                                <a href=""><i class="fa-brands fa-linkedin-in"></i></a>
                                <img class="filter" src="{{ asset('assets/images/Vector (2).png')}}" alt="" />
                                <img class="filter2" src="{{ asset('assets/images/Vector (3).png') }}" alt="" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- landing end -->
<style>
   .card-img-top{
        border-radius: 7px!important;
    }
    .blog-tag {
        font-family: 'Inter';
        font-style: normal;
        font-weight: 600;
        font-size: 11.5px;
        line-height: 13px;
        letter-spacing: 0.01em;
        color: #EEF5FF;
        background: #2875f1de;
        border-radius: 56px;
        padding: 6px 10px;
        margin: -12.5px 0 14px 9px;
        display: block;
        width: fit-content;
        position: relative;
        z-index: 9;
    }

    .blog-box-btm {
      
        background-color: white;
        border-radius: 0 0 10px 10px;
        transition: all 0.3s ease;
    }

    .bb-btm-inr {
        padding-left: 14px;
        padding-bottom: 14px;
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: center;
        gap: 9px;

    }

    .bb-btm-inr em {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 34px;
        height: 34px;
        border-radius: 50%;
        overflow: hidden;
    }

    .bb-btm-inr em img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
        object-position: center;
    }

    .bb-btm-inr text h5 {
        font-family: 'Inter';
        font-style: normal;
        font-weight: 600;
        font-size: 13px;
        line-height: 18px;
        color: #4D5665;
        margin-bottom: 3px;
    }

    .bb-btm-inr text h6 {
        font-family: 'Inter';
        font-style: normal;
        font-weight: 500;
        font-size: 12px;
        line-height: 16px;
        text-transform: capitalize;
        color: #7C8799;
    }
</style>
@include('custom_layouts.footer')
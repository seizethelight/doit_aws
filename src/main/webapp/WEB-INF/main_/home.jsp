<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Gutim Template">
<meta name="keywords" content="Gutim, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>DoIt Home</title>
<!-- Favicons -->
<link href="${path }/resources/assets/img/favicon.png" rel="icon">
<link href="${path }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
    rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${path }/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${path }/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${path }/resources/css/owl.carousel.min.css" htype="text/css">
<link rel="stylesheet" href="${path }/resources/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="${path }/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/style.css"/>

<style>
.header-section {
   background : transparent !important
}
.goods{
overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;/* 보여질 줄 갯수  */
    -webkit-box-orient: vertical;
}

#howtoex.card-body{
padding: 0px;
margin:auto;

}

</style>
</head>

<body>
    <!-- Page Preloder -->
    <!-- <div id="preloder">
        <div class="loader"></div>
    </div> -->



    <!-- Hero Section Begin -->
    <section class="hero-section set-bg" style="background-image:url(${path}/resources/img/hero-bg.jpg"  >
       <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="hero-text">
                        <span>FITNESS ELEMENTS</span>
                        <h1>BMI지수 계산</h1>
                        <p>체질량지수(BMI, Body Mass Index)로 키와 체중을 이용해서 간단하게 비만을 진단해보세요.<br /> </p>
                        <a href="../doex/bmi_cal.do" class="primary-btn">BMI지수 계산하기</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- About Section Begin -->
    <section class="about-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="about-pic">
                        <img src="${path}/resources/img/about-pic.jpg" alt="">
                        <a href="https://www.youtube.com/watch?v=3ui2JywNrRE" class="play-btn video-popup">
                            <img src="${path}/resources/img/play.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="about-text">
                        <h2>오늘의 추천운동</h2>
                        <div class="card-group">
                             <div class="card" style="width: 16rem;">
                        <!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text></svg>
                       -->
                        <img src="../doex/doex_images/WEIGHT_125_pic_2.jpg">
                        <div class="card-body" id="howtoex">
                          <h5 class="card-title">볼워킹 </h5>
                          <br>
                            <a href="../doex/howtoex_detail.do?ex_no=2" class="primary-btn">보러가기</a>
                        </div>
                      </div>
                      <div class="card" style="width: 16rem;">
                        <!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="180" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Image cap" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#868e96"></rect><text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image cap</text></svg>
                       -->
                        <img src="../doex/doex_images/WEIGHT_036_pic_1.jpg">
                        <div class="card-body" id="howtoex">
                          <h5 class="card-title">숄더프레스-머신</h5>
                           <br>
                            <a href="../doex/howtoex_detail.do?ex_no=33" class="primary-btn">보러가기</a>
                        </div>
                      </div>
                        
                      
                    </div>
                </div>
                
            </div>
        </div>
    </section>
    
    <!-- About Section End -->

    <!-- Services Section Begin -->
    <section class="services-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6">
                    <div class="services-pic">
                        <img src="${path}/resources/img/services/service-pic.jpg" alt="">
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="service-items">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="services-item bg-gray">
                                    <a href="../store/list.do"><img src="${path}/resources/img/services/service-icon-1.png" alt=""><a>
                                    <h4>스토어</h4>
                                    <p>아이콘 클릭시  스토어 페이지로 바로 이동가능합니다.</p>
                                </div>
                                <div class="services-item bg-gray pd-b">
                                    <a href="../post/news.do"><img src="${path}/resources/img/services/service-icon-3.png" alt=""><a>
                                    <h4>커뮤니티</h4>
                                    <p>아이콘 클릭시 커뮤니티 페이지로 바로 이동가능합니다.</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="services-item">
                                    <a href="../gym/gym_list.do"><img src="${path}/resources/img/services/service-icon-2.png" alt=""><a>
                                    <h4>헬스장</h4>
                                    <p>아이콘 클릭시 헬스장 페이지로 바로 이동가능합니다.</p>
                                </div>
                                <div class="services-item pd-b">
                                    <a href="../doex/howtoex_list.do"><img src="${path}/resources/img/services/service-icon-4.png" alt=""><a>
                                    <h4>운동법</h4>
                                    <p>아이콘 클릭시 운동법 페이지로 바로 이동가능합니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Services Section End -->

    <!-- Classes Section Begin -->
   
    <!-- Classes Section End -->

    <!-- Trainer Section Begin -->

       
        
    <!-- Trainer Section Begin -->
    <section class="trainer-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">  <h1 class='heading' style="margin-bottom: 10px;">Doit!&nbsp;<span style="color:orange"> STORE SHOP</h1>
                     <a href="../store/list.do"><h2>운동복 쇼핑하러 가기!</h2></a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                     <img src="http://www.xexymix.com/shopimages/xexymix/0050050002852.jpg?1642729753">
                        <div class="trainer-text">
                            <h5 class="goods">블랙라벨 시그니처 300N 컷오프탑 블랙 XT4337G + 추가혜택</h5>
                            <span>36,000원</span>
                           
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                        <img src="http://www.xexymix.com/shopimages/xexymix/0110030000252.jpg?1649987943" >
                        <div class="trainer-text">
                            <h5 class="goods">플렉스 집업 후디 더블네이비 XT2147F + 추가혜택</h5>
                            <span>62,000원</span>
                           
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                        <img src="http://www.xexymix.com/shopimages/xexymix/0060020007362.jpg?1618814766">
                        <div class="trainer-text">
                            <h5 class="goods">블랙라벨 시그니처 380N 레깅스 핑키퍼플 #하이서포트#2배 강력한 텐션 XP9167F + 추가혜택</h5>
                            <span>39,000원</span>
                        </div>
                    </div>
                </div>
            </div>
      
        
        <div class="row" style="margin-top: 95px;">
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                    <a href="http://localhost:8080/web/store/detail.do?s_no=40&c_no=2">
                    <img src="http://www.xexymix.com/shopimages/xexymix/0060020007342.jpg?1618817878"></a> 
                        <div class="trainer-text">
                            <h5 class="goods">블랙라벨 시그니처 380N 레깅스 오렌지무스 #하이서포트#2배 강력한 텐션 XP9167F + 추가혜택</h5>
                            <span>39,000원</span>
                           
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                        <img src="http://www.xexymix.com/shopimages/xexymix/0110010004022.jpg?1661393038" >
                        <div class="trainer-text">
                            <h5 class="goods">퓨어코튼 아치로고 숏슬리브 볼드멜란지그레이 #오버핏 #코튼100% XT2203G + 추가혜택</h5>
                            <span>62,000원</span>
                           
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                     <a href="http://localhost:8080/web/store/detail.do?s_no=40&c_no=2">
                        <img src="http://www.xexymix.com/shopimages/xexymix/0060020008612.jpg?1654824618"></a>
                        <div class="trainer-text">
                            <h5 class="goods">블랙라벨 시그니처 360N 레깅스 핑크크러쉬 놀라운 신세계를 경험해 보세요! 레깅스의 한계는없다! XP9157T + 추가혜택</h5>
                            <span>32,000원</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Trainer Section End -->
    <section class="trainer-section spad">
        
    </section>
    <!-- Trainer Section End -->

    <!-- Testimonial Section Begin -->
    <section class="testimonial-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">  <h1 class='heading' style="margin-bottom: 10px;">Doit!&nbsp;<span style="color:orange"> 헬스장</h1>
                     <a href="../gym/gym_list.do"><h2>헬스장 TOP 6</h2></a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                     <img src="http://newimg.soonwidot.co.kr/data/rank/26126/a95d8548e79232ede25de361715ab30d19701.jpg?t=1663086694">
                        <div class="trainer-text">
                            <h5 class="goods">휘트니스베이 24시 건대점 </h5>
                            <span>222,000원</span>
                           
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                        <img src="http://newimg.soonwidot.co.kr/data/rank/26126/f637e9d0c7b8d7ae6599790daf7321ae62708.jpg?t=1663086695" >
                        <div class="trainer-text">
                            <h5 class="goods">종로휘트니스 </h5>
                            <span>193,000원</span>
                           
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                        <img src="http://newimg.soonwidot.co.kr/data/rank/26126/a0afe008ba17344f90bc7aa3c94806cb39008.jpg?t=1663086695">
                        <div class="trainer-text">
                            <h5 class="goods">위너짐 상계본점 </h5>
                            <span>157,000원</span>
                        </div>
                    </div>
                </div>
            </div>
      
        
        <div class="row" style="margin-top: 95px;">
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                    <a href="http://localhost:8080/web/store/detail.do?s_no=40&c_no=2">
                    <img src="http://newimg.soonwidot.co.kr/data/rank/26126/916a6674fdf482efa35ab0f962f32ff737921.png?t=1663086696"></a> 
                        <div class="trainer-text">
                            <h5 class="goods">비엠스포츠센터 </h5>
                            <span>277,000원</span>
                           
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                        <img src="http://newimg.soonwidot.co.kr/data/rank/26126/3593888259686981680ec5faff6c1dcb37047.jpg?t=1663086696" >
                        <div class="trainer-text">
                            <h5 class="goods">슬림한바디PT 독산점 </h5>
                            <span>261,000원</span>
                           
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-trainer-item">
                     <a href="http://localhost:8080/web/store/detail.do?s_no=40&c_no=2">
                        <img src="http://newimg.soonwidot.co.kr/data/rank/26126/52e424a35dcdc32c73746b153533102397352.jpg?t=1663086697"></a>
                        <div class="trainer-text">
                            <h5 class="goods">스포짐 사당점 </h5>
                            <span>292,000원</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial Section End -->

    <!-- Banner Section Begin -->
   
    <!-- Banner Section End -->

    <!-- Membership Section Begin -->
    <section class="membership-section spad" style="display: flex">
       
    </section>
    <!-- Membership Section End -->

    <!-- Register Section Begin -->
    <section class="register-section spad">
      
    </section>
    <!-- Register Section End -->

    <!-- Latest Blog Section Begin -->
    <section class="latest-blog-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>최근 커뮤니티 글</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img src="${path}/resources/img/blog/blog-1.jpg" alt="" >
                        <div class="blog-widget">
                            <div class="bw-date">September 17, 2022</div>
                            <a href="http://localhost:8080/web/post/news_detail.do?n_no=4" class="tag">#Gym</a>
                        </div>
                        <h4><a href="#">MZ세대 과격한 운동</a></h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img src="${path}/resources/img/blog/blog-2.jpg" alt="">
                        <div class="blog-widget">
                            <div class="bw-date">April 12, 2021</div>
                            <a href="http://localhost:8080/web/post/news_detail.do?n_no=11" class="tag">#Sport</a>
                        </div>
                        <h4><a href="http://localhost:8080/web/post/news_detail.do?n_no=21">다크 초콜릿은 정말 건강에 좋을까?</a></h4>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-blog-item">
                        <img src="${path}/resources/img/blog/blog-3.jpg" alt="">
                        <div class="blog-widget">
                            <div class="bw-date">February 17, 2019</div>
                            <a href="http://localhost:8080/web/post/news_detail.do?n_no=23" class="tag">#Body</a>
                        </div>
                        <h4><a href="#">피부암을 막기 위해 자외선 차단제와 함께 챙겨야 할 것들</a></h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->

    <%-- <!-- Footer Banner Section Begin -->
    <section class="footer-banner">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6">
                    <div class="footer-banner-item set-bg" data-setbg="${path}/resources/img/footer-banner/footer-banner-1.jpg">
                        <span>New member</span>
                        <h2>7 days for free</h2>
                        <p>Complete the training sessions with us, surely you will be happy</p>
                        <a href="#" class="primary-btn">Get Started</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="footer-banner-item set-bg" data-setbg="${path}/resources/img/footer-banner/footer-banner-2.jpg">
                        <span>contact us</span>
                        <h2>09 746 204</h2>
                        <p>If you trust us on your journey they dark sex does not disappoint you!</p>
                        <a href="#" class="primary-btn">Get Started</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Footer Banner Section End --> --%>

    

</body>

</html>
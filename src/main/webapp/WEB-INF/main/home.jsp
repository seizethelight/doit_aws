<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>DoIt</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="icon" href="${path}/resources/img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="${path}/resources/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${path}/resources/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="${path}/resources/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="${path}/resources/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="${path}/resources/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="${path}/resources/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
</head>

<body>
  <main class="site-main">
    
    <!--================ Hero banner start =================-->
    <section class="hero-banner" style="height : 562px;">
      <div class="container">
        <div class="row no-gutters align-items-center pt-60px">
          <div class="col-5 d-none d-sm-block">
            <div class="hero-banner__img">
              <img class="img-fluid" src="${path}/resources/img/home/about-pic.jpg" style="height:500px;"alt="">
            </div>
          </div>
          <div class="col-sm-7 col-lg-6 offset-lg-1 pl-4 pl-md-5 pl-lg-0">
            <div class="hero-banner__content">
              <h4>Calculate BMI</h4>
              <h1>BMI지수 계산</h1>
              <p>체질량지수(BMI, Body Mass Index)로 키와 체중을 이용해서 간단하게 비만을 진단해보세요.</p>
              <a class="button button-hero" href="../doex/bmi_cal.do">BMI지수 계산하기</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================ Hero banner start =================-->

    <!--================ Hero Carousel start =================-->
    <section class="section-margin mt-0">
      <div class="owl-carousel owl-theme hero-carousel">
        <div class="hero-carousel__slide">
          <img src="img/home/hero-slide1.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Wireless Headphone</h3>
            <p>Accessories Item</p>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="img/home/hero-slide2.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Wireless Headphone</h3>
            <p>Accessories Item</p>
          </a>
        </div>
        <div class="hero-carousel__slide">
          <img src="img/home/hero-slide3.png" alt="" class="img-fluid">
          <a href="#" class="hero-carousel__slideOverlay">
            <h3>Wireless Headphone</h3>
            <p>Accessories Item</p>
          </a>
        </div>
      </div>
    </section>
    <!--================ Hero Carousel end =================-->

    <!-- ================ trending product section start ================= -->  
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>가장 핫한 헬스장을 만나보세요!</p>
          <h2>Trending <span class="section-intro__style">Product</span></h2>
        </div>
        <div class="row">
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
              <a href="../gym/gym_detail.do?g_no=132"> 
                <img class="card-img" src="http://newimg.soonwidot.co.kr/data/rank/26126/e5fa73b4142042c0748026a585c3fd2192998.jpg?t=1663086739" style="width: 220px">
              </div>
              <div class="card-body" style="width: 200px">
                <p>GYM</p>
                <h4 class="card-product__title">나비드짐 </h4></a>
                <p class="card-product__price">269,000원</p>
              </div>
            </div>
          </div>
           <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
              <a href="../gym/gym_detail.do?g_no=20">
                <img class="card-img" src="http://newimg.soonwidot.co.kr/data/rank/26126/cb5d5032c99c39021e41d4871f0d5c8838686.jpg?t=1663086688" style="width: 220px">
              </div>
              <div class="card-body" style="width: 200px">
                <p>GYM</p>
                <h4 class="card-product__title">더바른케어  </a></h4>
                <p class="card-product__price">206,000원</p>
              </div>
            </div>
          </div>
           <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
              <a href="../gym/gym_detail.do?g_no=187">
                <img class="card-img" src="http://newimg.soonwidot.co.kr/data/rank/26126/64c47d6ea145f553678ba82e095d794e58098.jpg?t=1663086765" style="width: 220px">
              </div>
              <div class="card-body" style="width: 200px">
                <p>GYM</p>
                <h4 class="card-product__title">휴메이크휘트니스 논현점  </a></h4>
                <p class="card-product__price">249,000원</p>
              </div>
            </div>
          </div>
           <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
              <a href="../gym/gym_detail.do?g_no=139">
                <img class="card-img" src="http://newimg.soonwidot.co.kr/data/rank/26126/94679e17f761e06f2596b75c83c75b9a93628.jpg?t=1663086742" style="width: 220px">
              </div>
              <div class="card-body" style="width: 200px">
                <p>GYM</p>
                <h4 class="card-product__title">스포애니 논현역점  </a></h4>
                <p class="card-product__price">244,000원</p>
              </div>
            </div>
          </div>
           <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
              <a href="../gym/gym_detail.do?g_no=169">
                <img class="card-img" src="http://newimg.soonwidot.co.kr/data/rank/26126/5556463c06288b3b69df54f357420ae753162.jpg?t=1663086757" style="width: 220px">
              </div>
              <div class="card-body" style="width: 200px">
                <p>GYM</p>
                <h4 class="card-product__title">퍼스트휘트니스   </a></h4>
                <p class="card-product__price">185,000원</p>
              </div>
            </div>
          </div>
           <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
              <a href="../gym/gym_detail.do?g_no=66">
                <img class="card-img" src="http://newimg.soonwidot.co.kr/data/rank/26126/ebcaeebf48e19e32d8661071c8abe56496062.jpg?t=1663086709" style="width: 220px">
              </div>
              <div class="card-body" style="width: 200px">
                <p>GYM</p>
                <h4 class="card-product__title">에이블짐 신방화역점  </a></h4>
                <p class="card-product__price">177,000원</p>
              </div>
            </div>
          </div>
           <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
              <a href="../gym/gym_detail.do?g_no=206">
                <img class="card-img" src="http://newimg.soonwidot.co.kr/data/rank/26126/bb160270ea2d990a1a9ab03c8472ea0f64454.jpg?t=1663086775" style="width: 220px">
              </div>
              <div class="card-body" style="width: 200px">
                <p>GYM</p>
                <h4 class="card-product__title">JY휘트니스 까치산점 </a></h4>
                <p class="card-product__price">196,000원</p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 col-xl-3">
            <div class="card text-center card-product">
              <div class="card-product__img">
              <a href="../gym/gym_detail.do?g_no=105">
                <img class="card-img" src="http://newimg.soonwidot.co.kr/data/rank/26126/7691013ee745973c227a09e13f72ecee42834.jpg?t=1663086727" style="width: 220px">
              </div>
              <div class="card-body" style="width: 200px">
                <p>GYM</p>
                <h4 class="card-product__title">제임스킬짐  </a></h4>
                <p class="card-product__price">226,000원</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ================ trending product section end ================= -->  



      <!-- ================ offer section start ================= --> 
    <section class="offer" id="parallax-1" data-anchor-target="#parallax-1" data-300-top="background-position: 20px 30px" data-top-bottom="background-position: 0 20px">
      <div class="container">
        <div class="row">
          <div class="col-xl-5">
            <div class="offer__content text-center">
              <h3>Up To 60% Off</h3>
              <h4>파격 겨울 할인!!!</h4>
              <p>다가오는 겨울 따뜻하게 맞이하자!</p>
              <a class="button button--active mt-3 mt-xl-4" href="../store/list.do">쇼핑하러 가기</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ================ offer section end ================= --> 

    <!-- ================ Best Selling item  carousel ================= --> 
    <section class="section-margin calc-60px">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>가장 인기많은 상품</p>
          <h2>Best <span class="section-intro__style">Sellers</span></h2>
        </div>
        <div class="owl-carousel owl-theme" id="bestSellerCarousel">
          <div class="card text-center card-product"style="width: 166px;">
            <div class="card-product__img">
              <a href="../store/detail.do?s_no=8&c_no=1"><img class="img-fluid" src="http://www.xexymix.com/shopimages/xexymix/0060020007522.jpg?1631238724" alt=""></a>
              
            </div>
            <div class="card-body">
              <h4 class="card-product__title">
              <a href="single-product.html">블랙라벨 시그니처 360N 더블플러피 기모 레깅스 1+1</a></h4>
              <p class="card-product__price">58,000원</p>
            </div>
          </div>

          <div class="card text-center card-product" style="width: 166px;">
            <div class="card-product__img">
              <a href="../store/detail.do?s_no=4&c_no=1"><img class="img-fluid" src="http://www.xexymix.com/shopimages/xexymix/0060030001492.jpg?1620027118" alt=""></a>
             
            </div>
            <div class="card-body">
              <h4 class="card-product__title"><a href="single-product.html">블랙라벨 시그니처 360N 8.5부 레깅스 1+1</a></h4>
              <p class="card-product__price">49,800원</p>
            </div>
          </div>

          <div class="card text-center card-product"style="width: 166px;">
            <div class="card-product__img">
                <a href="../store/detail.do?s_no=10&c_no=1"><img class="img-fluid" src="http://www.xexymix.com/shopimages/xexymix/0060020007522.jpg?1631238724" alt=""></a>
              
            </div>
            <div class="card-body">
              <h4 class="card-product__title"><a href="">블랙라벨 시그니처 360N 더블플러피 기모 레깅스 1+1 </a></h4>
              <p class="card-product__price">58,000원</p>
            </div>
          </div>

          <div class="card text-center card-product"style="width: 166px;">
            <div class="card-product__img">
               <a href="../store/detail.do?s_no=12&c_no=1"> <img class="img-fluid" src="http://www.xexymix.com/shopimages/xexymix/0060020007092.jpg?1653975647" alt=""></a>
              
            </div>
            <div class="card-body">
              <h4 class="card-product__title"><a href="">블랙라벨 시그니처 380N 레깅스 1+1 </a></h4>
              <p class="card-product__price">59,800원</p>
            </div>
          </div>

          <div class="card text-center card-product"style="width: 166px;">
            <div class="card-product__img">
               <a href="../store/detail.do?s_no=6&c_no=1"> <img class="img-fluid" src="http://www.xexymix.com/shopimages/xexymix/0060020008042.jpg?1643164367" alt=""></a>
              
            </div>
            <div class="card-body">
              <h4 class="card-product__title"><a href="single-product.html">블랙라벨 시그니처 330N 레깅스 1+1</a></h4>
              <p class="card-product__price">58,000원</p>
            </div>
          </div>

          <div class="card text-center card-product"style="width: 166px;">
            <div class="card-product__img">
                <a href="../store/detail.do?s_no=9&c_no=1"><img class="img-fluid" src="http://www.xexymix.com/shopimages/xexymix/0060020006442.jpg?1611821319" alt=""></a>
             
            </div>
            <div class="card-body">
              <h4 class="card-product__title"><a href="single-product.html">블랙라벨 시그니처 360N 레깅스 1+1[10/5(수) 2PM까지 데일리특가!]</a></h4>
              <p class="card-product__price">39,000원</p>
            </div>
          </div>

          <div class="card text-center card-product"style="width: 166px;">
            <div class="card-product__img">
               <a href="../store/detail.do?s_no=7&c_no=1"> <img class="img-fluid" src="http://www.xexymix.com/shopimages/xexymix/0050050002842.jpg?1653974528" alt=""></a>
              
            </div>
            <div class="card-body">
              <h4 class="card-product__title"><a href="single-product.html">블랙라벨 시그니처 380N 서포트탑 1+1 XT4205F </a></h4>
              <p class="card-product__price">58,800원</p>
            </div>
          </div>

          <div class="card text-center card-product"style="width: 166px;">
            <div class="card-product__img">
                <a href="../store/detail.do?s_no=11&c_no=1"><img class="img-fluid" src="http://www.xexymix.com/shopimages/xexymix/0050050002842.jpg?1653974528" alt=""></a>
              
            </div>
            <div class="card-body">
              <h4 class="card-product__title"><a href="single-product.html">블랙라벨 시그니처 380N 서포트탑 1+1 XT4205F</a></h4>
              <p class="card-product__price">58,800원</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ================ Best Selling item  carousel end ================= --> 

    <!-- ================ Blog section start ================= -->  
    <section class="blog">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>Popular Item in the market</p>
          <h2>Latest <span class="section-intro__style">News</span></h2>
        </div>

        <div class="row">
          <div class="col-md-6 col-lg-4 mb-4 mb-lg-0" v-for="fvo in news_top">
            <div class="card card-blog">
              <div class="card-blog__img">
                <img class="card-img rounded-0" src="img/blog/blog1.png" alt="">
              </div>
              <div class="card-body">
                <ul class="card-blog__info">
                  <li><a href="#">{{fvo.id}}</a></li>
                  <li><a href="#"><i class="ti-comments-smiley"></i> 2 Comments</a></li>
                </ul>
                <h4 class="card-blog__title"><a href="single-blog.html">{{fvo.title}}</a></h4>
                <p>{{fvo.content}}</p>
                <a class="card-blog__link" :href="'../post/news_detail.do?n_no='+fvo.n_no">Read More <i class="ti-arrow-right"></i></a>
              </div>
            </div>
          </div>

        </div>
      </div>
    </section>
    <!-- ================ Blog section end ================= -->  

    <!-- ================ Subscribe section start ================= --> 
    <section class="subscribe-position">
      <div class="container">
        <div class="subscribe text-center">
          <h3 class="subscribe__title">Get Update From Anywhere</h3>
          <p>Bearing Void gathering light light his eavening unto dont afraid</p>
          <div id="mc_embed_signup">
            <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe-form form-inline mt-5 pt-1">
              <div class="form-group ml-sm-auto">
                <input class="form-control mb-1" type="email" name="EMAIL" placeholder="Enter your email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '" >
                <div class="info"></div>
              </div>
              <button class="button button-subscribe mr-auto mb-1" type="submit">Subscribe Now</button>
              <div style="position: absolute; left: -5000px;">
                <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
              </div>

            </form>
          </div>
          
        </div>
      </div>
    </section>
    <!-- ================ Subscribe section end ================= --> 

    

<script>
	new Vue({
		el : '.blog',
		data : {
			news_top : []
		},
		mounted : function() {
			let _this = this;
			axios.get("http://15.165.108.114/post/news_top.do", {
				params : {

				}
			}).then(function(result) {
				console.log(result.data);
				_this.news_top = result.data;
			})
		}
	})
  
  
</script>

 </main>

  <script src="${path}/resources/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="${path}/resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="${path}/resources/vendors/skrollr.min.js"></script>
  <script src="${path}/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="${path}/resources/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="${path}/resources/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="${path}/resources/vendors/mail-script.js"></script>
  <script src="${path}/resources/js/main.js"></script>
</body>
</html>
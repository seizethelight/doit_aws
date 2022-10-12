<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

 <link rel="stylesheet" href="../resources/css/style.css" > 
  
<script type="text/javascript">

$(function(){
	$('#account').change(function(){
		let count=$(this).val();
		let price=$(this).attr("data-price");
		let total=price*count;
		$('#total').text(total)
		$('#goods_account').val(count);
	})
})
   $('#cartBtn').click(function(){
	 let id = '${sessionScope.id}';
	 console.log(id);
	 if(id.trim()==''){
		 alert('로그인 후 이용 가능합니다.');
	 }
 })  
</script>
<style>
app{
	font-family: 'Noto Sans KR', sans-serif !important;
}
</style>
</head>

<body>
	
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>GYM LIST</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Doit!</a></li>
              <li class="breadcrumb-item active" aria-current="page">GYM Category</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->

	<div class="container">
		<div class="app">
		<div class="product_image_area">
		<div class="container">
		  <div id="gym_detail">
				<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">
							<img :src="gym_detail.poster" class="img-fluid">
						</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3 style="display: contents;">{{gym_detail.store}}</h3>
						   
						 	   <c:if test="${sessionScope.id==null }">
								  <i class="fa fa-heart-o" style="font-size:30px"></i>
								 </c:if>
								 <c:if test="${sessionScope.id!=null && lcount==0 }">
										 <a :href="'../gym/LikeInsert.do?g_no='+gym_detail.g_no"><i class="fa fa-heart-o" style="font-size:30px; color: red;"></i></a>
								 </c:if>
								 <c:if test="${sessionScope.id!=null && lcount!=0 }">
									  <a :href="'../gym/DisLikeInsert.do?g_no='+gym_detail.g_no"><i class="fa fa-heart" style="font-size:30px; color: red;"></i></a>
						    	</c:if>
						  
						<h2 style="margin-top: 20px">{{gym_detail.price | currency }} 원/개월</h2>
						<ul class="list">
							<li><a class="active" ><span>주소 :</span> {{gym_detail.addr}}</a></li>
							<li><a href="#"><span>#태그 :</span>{{gym_detail.type}}</a></li>
							<li><a href="#"><span></span>{{gym_detail.type1}}</a></li>
							<li><a href="#"><span></span>{{gym_detail.type2}}</a></li>
							<li><a href="#"><span></span>{{gym_detail.type3}}</a></li>
						</ul>
						<p>운영시간, 전화번호:<br>{{gym_detail.time}}</p>
						
						
						<div class="product_count">
			               <form method="post" action="../cart/cart_insert.do">
					        <input type="hidden" name="no" :value="g_no">
					        <input type="hidden" name="cate" value="1">
							<input type ="hidden" name ="total" value="${cvo.total }">
							
					             <div style="text-align: left; font-size: 16px;"> 개월 수 :&nbsp;&nbsp; <input type=number id="account" name="account" :value="account" max="10" min="1"
					                 data-price="${vo.price }">&nbsp; 총 금액 :&nbsp;&nbsp;<span style="color:blue;" id="total"><fmt:formatNumber value="${vo.price}" pattern="#,###"/> </span> 원  </div><br><br>
					         <div style="margin-left: 50px;">     
					         <input type="button" onclick="location.href='../gym/gym_list.do'" value="목록" class="button primary-btn" style="width:42%;border: 1px solid #384aeb;
					         border-radius: 30px;font-weight: bold;padding: 12px 50px;">&nbsp;
					         <input type="submit"  value="장바구니" class="button primary-btn" style="width:50%;border: 1px solid #384aeb;
					         border-radius: 30px;font-weight: bold;padding: 12px 50px;" id="cartBtn">
					        <!--  <input type="submit" value="회원권 결제하기" class="btn btn-lg btn-success" style="margin-bottom: 20px"> -->
					           
					         </div>
					      </form>
										            
						</div>
						<div class="card_area d-flex align-items-center">
							  
						</div>
					</div>
				</div>
			</div>
			<!--================Map Area =================-->
			  <!-- <div class="col-sm-4">
			    <div class="none" style="margin-top: 30px;"></div>
			      <div id="map" style="width:700px;height:350px; margin-bottom: 30px; margin-left: 150px" :data="gym_detail.store"></div>
									
			    </div> -->
			<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">

			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">상세 위치 정보(지도)</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
					 aria-selected="false">댓글 남기기</a>
				</li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab"style="">
					 <div class="col-sm-4">
					    <div class="none" style="margin-top: 30px;"></div>
					      <div id="map" style="width:920px;height:370px; margin-bottom: 30px; margin-left: 20px" :data="gym_detail.store"></div>
											
					    </div> 
				</div>
			
				<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="row total_rate">
								<div class="col-6">
									<div class="box_total">
										<h5>Overall</h5>
										<h4>4.0</h4>
										<h6>(03 Reviews)</h6>
									</div>
								</div>
								<div class="col-6">
									<div class="rating_list">
										<h3>Based on 3 Reviews</h3>
										<ul class="list">
											<li><a href="#">5 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">4 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">3 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">2 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
											<li><a href="#">1 Star <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i
													 class="fa fa-star"></i><i class="fa fa-star"></i> 01</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="review_list">
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-1.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-2.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
								<div class="review_item">
									<div class="media">
										<div class="d-flex">
											<img src="img/product/review-3.png" alt="">
										</div>
										<div class="media-body">
											<h4>Blake Ruiz</h4>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
										</div>
									</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
										commodo</p>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>Add a Review</h4>
								<p>Your Rating:</p>
								<ul class="list">
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
									<li><a href="#"><i class="fa fa-star"></i></a></li>
								</ul>
								<p>Outstanding</p>
                <form action="#/" class="form-contact form-review mt-3">
                  <div class="form-group">
                    <input class="form-control" name="name" type="text" placeholder="Enter your name" required>
                  </div>
                  <div class="form-group">
                    <input class="form-control" name="email" type="email" placeholder="Enter email address" required>
                  </div>
                  <div class="form-group">
                    <input class="form-control" name="subject" type="text" placeholder="Enter Subject">
                  </div>
                  <div class="form-group">
                    <textarea class="form-control different-control w-100" name="textarea" id="textarea" cols="30" rows="5" placeholder="Enter Message"></textarea>
                  </div>
                  <div class="form-group text-center text-md-right mt-3">
                    <button type="submit" class="button button--active button-review">Submit Now</button>
                  </div>
                </form>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			</div>
		</div>
	</section>
	<!--================End Product Description Area =================-->
		</div>
	</div>
	<!-- =============================================================== -->
	
	</div>
  </div>
 
     	                  
    
      
     <!-- 따로... -->
        
  

 
  <script>
  
  new Vue({
	   el:'.app',
	   data:{
		   g_no:${g_no},
		   gym_detail:{}
	   },
	   mounted:function(){
		   // 카카오 등록 
		   let _this=this;
		   axios.get("http://15.165.108.114/gym/gym_detail_vue.do",{
			   params:{
				   g_no:_this.g_no
			   }
		   }).then(function(result){
			   console.log(result.data)
			   _this.gym_detail=result.data
			   
			   
			   if(window.kakao && window.kakao.maps)
			   {
				  _this.initMap(_this.gym_detail.store);   
				 // console.log(_this.gym_detail.store+"=>1")
				  
			   }
			   else
			   {
				   _this.addScript();
				   
			   }
		   })
		   
		   
	   },
	   filters:{
		   currency: function(value){ // 금액 3자리 수 마다 따옴표 필터
               let num = new Number(value);
               return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
           }
	   },
	   methods:{
		   addScript:function() {
			      const script = document.createElement('script');
			      
			      /* global kakao*/
			        script.onload = () => kakao.maps.load(this.initMap);
			        script.src = 'http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=f89d586e6dc50a9d7aef7d33a6324e3a&libraries=services';
			        document.head.appendChild(script);
			        console.log(this.gym_detail.store+"=>1") 
			    },
		   initMap:function(){
			   
			   //console.log(store+"=>2")
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				         center: new kakao.maps.LatLng(33.450701, 126.570667),  // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 주소-좌표 변환 객체를 생성합니다
				/* global kakao */
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(this.gym_detail.addr, function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.store}</div>'  //>'+$('#map').attr("data")+'
				        });
				        infowindow.open(map, marker);
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
				
		   }
	   }
	   
  })
  </script>
   
  <script src="../resources/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="../resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="../resources/vendors/skrollr.min.js"></script>
  <script src="../resources/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="../resources/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="../resources/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="../resources/vendors/mail-script.js"></script>
  <script src="../resources/js/main.js"></script>
</body>
</html>
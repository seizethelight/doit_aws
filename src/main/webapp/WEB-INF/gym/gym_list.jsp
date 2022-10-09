<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Category</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="../resources/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../resources/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../resources/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../resources/vendors/linericon/style.css">
<link rel="stylesheet" href="../resources/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="../resources/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="../resources/vendors/nouislider/nouislider.min.css">

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

 <link rel="stylesheet" href="../resources/css/style.css" > 

<style>
.images:hover{
  cursor: pointer;
}
.card {
    border: medium none;
    box-shadow: 0 0 11px #daebff;
    margin-bottom: 18px;
    background-color: #FFFFFF
}
.card-list .badge {
    left: 20px;
    padding: 7px 10px;
    position: absolute;
    top: 20px;
    z-index: 9;
}
.badge {
    border-radius: 2px;
    font-size: 12px;
    font-weight: 400;
}
img {
    transform-style: preserve-3d;
}
img {
    height: auto;
    max-width: 93%;
}
.card-list-view .card-body, .card-list-view .card-footer {
    padding: 11px 20px;
}
.card-list .card-body h2 small {
    font-size: 19px;
}
.card-list .card-footer span {
    margin: 0 15px 0 0;
} 


.search {
  width: 65%;
  position: relative;
  display: flex;
  margin-left: 200px;
}

.searchTerm {
  width: 100%;
  border: 3px solid #384aeb;
  border-right: none;
  padding: 5px;
  height: 20px;
  border-radius: 5px 0 0 5px;
  outline: none;
  color: #9DBFAF;
}

.searchTerm:focus{
  color: #00B4CC;
}

.searchButton {
  width: 40px;
  height: 36px;
  border: 1px solid #384aeb;
  background: #384aeb;
  text-align: center;
  color: #fff;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
  font-size: 20px;
}

/*Resize the wrap to see the search bar change!*/
.wrap{
  width: 30%;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
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

	<!-- ================ category section start ================= -->		  
  <section class="section-margin--small mb-5">
    <div class="container">
     <div class='bg-container' style="margin-top:50px;">
      <div  id="store_list">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">
          <div class="sidebar-categories">
            <div class="head">Doit!</div>
            <ul class="main-categories">
              <li class="common-filter">
               <form action="#">
                  <ul>
                   <li class="filter-list">
                   <input class="pixel-radio" type="radio" id="All" name="brand" value="All" @click="storeChange(1)"><label for="All">강남구<span> (3600)</span></label></li>
                   <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">강북구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">강동구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">강서구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="items" name="brand" value="Items" @click="storeChange(6)"><label for="bayItem">관악구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="items" name="brand" value="Items" @click="storeChange(6)"><label for="bayItem">광진구<span> (3600)</span></label></li>
                     <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">구로구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">금천구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="golf" name="brand" value="Golf" @click="storeChange(7)"><label for="electronics">노원구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">도봉구<span> (3600)</span></label></li>
                     <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">동대문구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="kids" name="brand" value="Kids" @click="storeChange(4)"><label for="accessories">동작구<span> (3600)</span></label></li>
                     <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="women" name="brand" value="Women" @click="storeChange(2)"><label for="women">마포구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">서대문구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="new" name="brand" value="New" @click="storeChange(5)"><label for="footwear">서초구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">성동구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="men" name="brand" value="Men" @click="storeChange(3)"><label for="men">성북구<span> (3600)</span></label></li>
                     <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">송파구<span> (3600)</span></label></li>
                     <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">양천구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">영등포구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">용산구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">은평구<span> (3600)</span></label></li>
                     <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">종로구<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">중구<span> (3600)</span></label></li>
                  	<li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">중랑구<span> (3600)</span></label></li>
                     </ul>
                </form>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
         
          <!-- Start Best Seller -->
          <section class="lattest-product-area pb-40 category-list">
           
           
               <div class="app" style="width: 100%; margin-top: -51px">
     <h3 style="margin-left: 180px;font-size: 30px!important">서울 헬스장 목록</h3> 
		
			<div class="flex" style="margin: 25px 190px 5px -200px;">
				<div class="search">
					<input type="text" class="searchTerm" placeholder="강남"
						:value="search" ref="search" v-model="search" style="height: auto">
					<button type="submit" class="searchButton" @click="FindBar()"
						style="height: auto">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>

			<div class="row" style="margin-top: 30px;">
			
			<div class="col-lg-8 col-md-8">
				<div class="row" >
					<div class="col-lg-12 col-md-12" v-for="vo in gym_data">
						<div class="card card-list card-list-view">
							
								<div class="row no-gutters">

									<div class="col-lg-5 col-md-5">
									<a :href="'../gym/gym_detail_before.do?g_no='+vo.g_no">
										<img class="card-img-top" :src="vo.poster"
											alt="Card image cap" googl="true" style="max-height: 85%;">
									</div>
									<div class="col-lg-7 col-md-7">
										<div class="card-body">
											<div class="card-title" style="font-size: 21px;font-weight: 600; color: #384aeb">{{vo.store}}</div></a>	
											
											<h5 class="card-subtitle mb-2 text-muted">
												<i class="mdi mdi-home-map-marker"></i> 
												{{vo.addr}}
											</h5>
											<h2 class="text-success mb-0 mt-3" style="font-size: 31px">
												{{vo.price | currency}}원 <small>/개월</small>
											</h2>
										</div>
										<div class="card-footer">
										  <div class="row" style="font-size: 15px">
											<span><i class="mdi mdi-sofa"></i>#<strong>{{vo.type}}</strong></span>
											<span><i class="mdi mdi-scale-bathroom"></i>#<strong>{{vo.type1}}</strong></span>
										
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="inline" id="EyeOpen">
											<path d="M21.257 10.962c.474.62.474 1.457 0 2.076C19.764 14.987 16.182 19 12 19c-4.182 0-7.764-4.013-9.257-5.962a1.692 1.692 0 0 1 0-2.076C4.236 9.013 7.818 5 12 5c4.182 0 7.764 4.013 9.257 5.962z" />
											<circle cx="12" cy="12" r="3" />
										</svg> 
										{{vo.hit}}&nbsp;&nbsp;
										</div>
										</div>
									</div>
									
								</div>
						</div>
					</div>
				</div>

				<div style="height: 20px"></div>
				<div class="text-center" style="font-size: 17px">

					<button class="btn btn-md btn-success" v-on:click="prev()">이전</button>
					{{curpage}} page / {{totalpage}} pages
					<button class="btn btn-md btn-info" v-on:click="next()">다음</button>

				</div>
			</div>
			<div class="row" id="cookie" style="display: grid;margin-left: 49px;align-content: center;margin-bottom: auto;">
				<div style="text-align: center; font-size: 20px; font-weight: 600;margin-bottom: 30px;">최근에 본 상품
					<a href="gym_cookie_delete.do"><input type="button" class="btn btn-sm btn-primary" value="쿠키삭제" style="margin-left: 20px;margin-bottom: 8px;"></a>
				</div>

				<span v-for="g in gym_cookie" style="margin-left: 10px;">
				<a :href="'gym_detail.do?g_no='+g.g_no">
				 <img :src="g.poster" style="width:120px;margin-bottom: 15px "></a>
				 </span>
			</div>
		</div>
		</div> 
          
		
          </section>
          <!-- End Best Seller -->
        </div>
      </div>
    </div>
   </div>
  </div> 
  </section>
	<!-- ================ category section end ================= -->		  
	
	
	<script>
	new Vue({
		 el:'.app',
		 data:{
			 curpage:1,
			 totalpage:0,
			 gym_data:[],
			 gym_cookie:[],
			 search:''
		 },
		 mounted:function(){
			 this.send() 
		 },
		 filters:{
			   currency: function(value){ // 금액 3자리 수 마다 따옴표 필터
	              let num = new Number(value);
	              return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
	          }
		   },
		 methods:{
			 send:function(){
				 let _this=this;
				  axios.get("http://localhost:8080/web/gym/gym_list_vue.do",{
					 params:{
						 search:_this.search,
						 page:_this.curpage
					 }
				 }).then(function(result){
					 _this.gym_data=result.data;
					 _this.curpage=result.data[0].curpage;
					 _this.totalpage=result.data[0].totalpage;
				 }) 
				 axios.get("http://localhost:8080/web/gym/gym_cookie.do",{
						params:{
							g_no:_this.g_no
						}
		     		}).then(function(result){
		     			//console.log(result.data)
		     			_this.gym_cookie=result.data;
		     		})
		     	 	     	 
			 },
			 FindBar:function(){
				if(this.search=="")
				{
					alert("검색어를 입력해주세요!!  ex) 강남,역삼,서초")
					this.$refs.search.focus();
					return;
				}
				this.send();
			 },
			 prev:function(){
				 this.curpage=this.curpage>1?this.curpage-1:this.curpage;
				 this.send()
			 },
			 next:function(){
				 this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
				 this.send()
			 }
			
		 }
	})
	  
	   </script>


  <script src="../resources/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="../resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="../resources/vendors/skrollr.min.js"></script>
  <script src="../resources/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="../resources/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="../resources/vendors/nouislider/nouislider.min.js"></script>
  <script src="../resources/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="../resources/vendors/mail-script.js"></script>
  <script src="../resources/js/main.js"></script>
</body>
</html>
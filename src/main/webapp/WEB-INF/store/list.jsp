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
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="../resources/css/style.css">

</head>
<body>
	
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
                   <input class="pixel-radio" type="radio" id="All" name="brand" value="All" @click="storeChange(1)"><label for="All">All<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="men" name="brand" value="Men" @click="storeChange(3)"><label for="men">Men<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="women" name="brand" value="Women" @click="storeChange(2)"><label for="women">Women<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="kids" name="brand" value="Kids" @click="storeChange(4)"><label for="accessories">Kids<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="new" name="brand" value="New" @click="storeChange(5)"><label for="footwear">New<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="items" name="brand" value="Items" @click="storeChange(6)"><label for="bayItem">Items<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="golf" name="brand" value="Golf" @click="storeChange(7)"><label for="electronics">Golf<span> (3600)</span></label></li>
                    <li class="filter-list">
                    <input class="pixel-radio" type="radio" id="food" name="brand" value="Food" @click="storeChange(8)"><label for="food">Food<span> (3600)</span></label></li>
                  </ul>
                </form>
              </li>
              <li class="filter-list">
               <div class="row" id="cookie" style="display: inline; margin-top: 60px">
				<div style="font-size: 25px; font-weight: 600">최근에 본 상품
				<span v-for="s in store_cookie" style="margin-left: 10px;">
				<a :href="'detail.do?s_no='+s.s_no">
				 <img :src="s.poster" style="width:120px; "></a>
				 </span>
					<a href="store_cookie_delete.do"><input type="button" class="btn btn-md btn-danger" value="쿠키삭제"
					 style="margin-left: 20px;margin-top:10px;margin-bottom: 8px;background-color: #f1f6f7;border-color: #384aeb;color: #384aeb;"></a>
				</div>

				
				</div></li>
            </ul>
          </div>
          
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
          <!-- Start Filter Bar -->
          <div class="filter-bar d-flex flex-wrap align-items-center">
            <div class="sorting">
              <select>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
              </select>
            </div>
            <div class="sorting mr-auto">
              <select>
                <option value="1">Show 12</option>
                <option value="1">Show 12</option>
                <option value="1">Show 12</option>
              </select>
            </div>
            <div>
              <div class="input-group filter-bar-search">
                <input type="text" placeholder="Search">
                <div class="input-group-append">
                  <button type="button"><i class="ti-search"></i></button>
                </div>
              </div>
            </div>
          </div>
          <!-- End Filter Bar -->
          <!-- Start Best Seller -->
          <section class="lattest-product-area pb-40 category-list">
             <div class="card text-center card-product" v-for="vo in store_list">
                  <div class="card-product__img">
                   <a :href="'../store/detail_before.do?s_no='+vo.s_no+'&c_no='+type">
                    <img class="card-img" :src="vo.poster" alt="Lights"></a>
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <h4 class="card-product__title"><a href="#">{{vo.name}}</a></h4>
                    <p class="card-product__price" style="text-decoration: line-through; color: gray;">{{vo.price}}</p>
                    <p class="card-product__price" style="color: black;">{{vo.first_price}}</p> 
                  </div>
            </div>
            
            <div style="height: 20px;margin-top: 40px;"></div>
			
				<div class="text-center" style="text-align: center;">
				    <input type="button" class="btn btn-lg btn-warning" value="이전"style="background-color: #f1f6f7;color: #384aeb;height: 40px;
    					border-color: #384aeb;" @click="prev()"/>
				    {{curpage}} page / {{totalpage}} pages
				    <input type="button" class="btn btn-lg btn-success" value="다음"style="background-color: #f1f6f7;color: #384aeb;height: 40px;
    					border-color: #384aeb;" @click="next()"/>
				</div>
			
          </section>
          <!-- End Best Seller -->
        </div>
      </div>
    </div>
     

	<div style="margin-top: 40px;"></div>
	<!--  <div class="row" id="cookie" style="display: inline; margin-top: 60px">
				<div style="font-size: 27px; font-weight: 600">최근에 본 상품
					<a href="store_cookie_delete.do"><input type="button" class="btn btn-md btn-danger" value="쿠키삭제"
					 style="margin-left: 20px;margin-bottom: 8px;background-color: #f1f6f7;border-color: #384aeb;color: #384aeb;"></a>
				</div>

				<span v-for="s in store_cookie" style="margin-left: 10px;">
				<a :href="'detail.do?s_no='+s.s_no">
				 <img :src="s.poster" style="width:120px; "></a>
				 </span>
	</div> -->
   </div>
  </div> 
  </section>
	<!-- ================ category section end ================= -->		  


<script>
    new Vue({
		 el:'.bg-container',
		 data:{
			 curpage:1,
			 totalpage:0,
			 store_list:[],
			 store_cookie:[],
	         s_no:0,
	         type:1
		 },
		 mounted:function(){
			 this.send()
		 },
		 methods:{
			 send:function(){
				 let _this=this;
				 axios.get("http://15.165.108.114/store/list.do",{
					 params:{
						 page:_this.curpage,
						 type:_this.type
					 }
				 }).then(function(result){
					 console.log(result);
					 _this.store_list=result.data;
					 _this.curpage=result.data[0].curpage;
					 _this.totalpage=result.data[0].totalpage;
				 })
				  axios.get("http://15.165.108.114/store/store_cookie.do",{
						params:{
							s_no:_this.s_no
						}
		     		}).then(function(result){
		     			console.log(result.data)
		     			_this.store_cookie=result.data;
		     		})
			 },
			 storeChange:function(c_no){
				 
	    			this.type=c_no;
	    			this.curpage=1;
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
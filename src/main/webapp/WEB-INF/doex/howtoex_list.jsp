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


.text-center{
	margin:auto;
	padding: 5px 0px 5px;
}
</style>
</head>

<body>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Exercise</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Doit!</a></li>
              <li class="breadcrumb-item active" aria-current="page">How to Exercise</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
 <div class="container" id=app>
 
    <div style="height: 20px"></div>
    <div class="row" >
       <div class="col-md-3" v-for="vo in howtoex_list">
		    <div class="thumbnail margin-space" >
		      <a :href="'../doex/howtoex_detail.do?ex_no='+vo.ex_no">
		        <img :src="vo.pic1" alt="Lights" style="width:350px;height:250px;">
		        <div class="caption">
		        	<h4><b>{{vo.ex_title }}</b></h4>
		        	<div style="float: left;">
		        		<h5 style="color: grey;"> <b>운동부위 : {{vo.ex_bodypart }}</b></h5>
		        	</div>
		      	
		           <div style="float: right;">
		           		<h5>
			           		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
	  						<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
	 					 	<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg> {{vo.ex_hit}}
						</h5>
					</div>	
				</div>
					
					<br>
					<div class="readmore">
	 					<div class="text-center">
	 		 				<!-- <div class="primary-btn">Read More</div> -->
	 		 				<input type=button class="btn btn-outline-secondary" value="Read More">
						</div>		
		       		</div>
					</a>	
			</div>
		</div>
				 
					<br>
	 				<!-- <div class="readmore">
	 					<div class="text-center">
	 		 				<div class="primary-btn">Read More</div>
						</div>		
		       		</div> -->
		       </div>
		      
    <div class="row">
       <div class="text-center">
         <input type=button class="btn btn-lg btn-dark" value="이전" @click="prev()">
          {{curpage}} page / {{totalpage}} pages
         <input type=button class="btn btn-lg btn-dark" value="다음" @click="next()">
       </div>
    </div>
  </div>
</div>

  <script>
   new Vue({
		 el:'#app',
		 data:{
			 curpage:1,
			 totalpage:0,
			 howtoex_list:[],
	         
		 },
		 mounted:function(){
			 let _this=this;
			 axios.get("http://localhost:8080/web/doex/howtoex_list.do",{
				 params:{
					 page:_this.curpage
				 }
			 }).then(function(result){
				 console.log(result);
				 _this.howtoex_list=result.data;
				 _this.curpage=result.data[0].curpage;
				 _this.totalpage=result.data[0].totalpage;
				 console.log(_this.howtoex_list);
				 console.log(_this.curpage);
				 console.log(_this.totalpage);
			 })
		 },
		 methods:{
			 send:function(){
				 let _this=this;
				 axios.get("http://localhost:8080/web/doex/howtoex_list.do",{
					 params:{
						 page:_this.curpage
					 }
				 }).then(function(result){
					 console.log(result);
					 _this.howtoex_list=result.data;
					 _this.curpage=result.data[0].curpage;
					 _this.totalpage=result.data[0].totalpage;
				 })
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

    
<br><br><br><br><br>

    </body>
</html>


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
	<!-- ================ end banner area ================= -->

  <div class="container" id=exfind >
     <div class="row row1"> 
        	<div class="row" style="width: 100%; margin-top: 51px">
        	<h3 style="font-size: 30px!important">운동부위로 운동방법을 검색하세요</h3> 
		
        	</div>
        	 <div style="height:25px"></div>
       <!--  <input type=text size=20 class="input-sm" :value="ss" ref="ss" v-model="ss"> &nbsp;
        <input type=button value=" 검색 " class="btn btn-sm btn-dark" v-on:click="howtoexFind()">
     	 -->
     	<div class="flex" style="margin: 25px 190px 5px -200px;">
				<div class="search">
					<input type="text" class="searchTerm" placeholder="어깨"
						:value="ss" ref="ss" v-model="ss" style="height: auto">
					<button type="submit" class="searchButton" @click="howtoexFind()"
						style="height: auto">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
     	
     
     
     </div>
     
     
     
     
     <div style="height: 15px"></div>
     
     
     
     
     <div class="row">
         <div class="col-md-3" v-for="vo in howtoex_list">
		    <div class="thumbnail">
		      <a :href="'../doex/howtoex_detail.do?ex_no='+vo.ex_no">
		        <img :src="vo.pic1" alt="Lights" style="width:100%">
		        <div class="caption">
		         <h5><b>{{vo.ex_title }}</b></h5>
		        
		           <p>{{vo.ex_bodypart}}</p>
		        </div>
		        <div class="readmore">
	 					<div class="text-center">
	 		 				
	 		 				<input type=button class="btn btn-outline-secondary" value="Read More">
						</div>		
		       		</div>
		      </a>
		    </div>
		  </div>
     </div>
     <div style="height: 20px"></div>
     <div class="row">
       <div class="text-center">
         <input type=button class="btn btn-sm btn-dark" v-on:click="prev()" value=이전>
         {{curpage}} page / {{totalpage}} pages
         <input type=button class="btn btn-sm btn-dark" v-on:click="next()" value=다음>
       </div>
     </div>
     
    <!--  <div class="row" id="cookie" style="display: grid;margin-left: 49px;align-content: center;margin-bottom: auto;">
		<div style="text-align: center; font-size: 20px; font-weight: 600;margin-bottom: 30px;">최근에 본 상품
					<a href="howtoex_cookie_delete.do"><input type="button" class="btn btn-sm btn-primary" value="쿠키삭제" style="margin-left: 20px;margin-bottom: 8px;"></a>
				</div>

				<span v-for="ex in howtoex_cookie" style="margin-left: 10px;">
				<a :href="'howtoex_detail.do?ex_no='+ex.ex_no">
				 <img :src="ex.pic1" style="width:120px;margin-bottom: 15px "></a>
				 </span>
			</div> -->
     
   </div>
   <br> <br>
   <script>
     new Vue({
    	 el:'#exfind',
    	 data:{
    		 curpages:1,
             totalpage:0,
             ss:'어깨',
             howtoex_list:[],
     		 howtoex_cookie:[]
    	 },
    	 // vue_find.do?ss=강남&page=1
         // data:{no:1,pwd:''},
         // success:function(result)
    	 mounted:function(){
    		 // window.onload => main
    		 // http://15.165.108.114/food/vue_find.do?ss=%EA%B0%95%EB%82%A8&page=1
    		 this.send();
    	 },
    	 methods:{
    		 send:function(){
    			 axios.get('http://15.165.108.114/doex/vue_find.do',{
        			 params:{
        				 ss:this.ss,
        				 page:this.curpage
        			 }
        		 }).then(result=>{
        			 // function(result){}
        			 console.log(result)
        			 this.howtoex_list=result.data;
        			 this.curpage=this.howtoex_list[0].curpage;
        			 this.totalpage=this.howtoex_list[0].totalpage;
        		 })
        		 
        		 axios.get("http://15.165.108.114/doex/howtoex_cookie.do",{
						params:{
							ex_no:_this.ex_no
						}
		     		}).then(function(result){
		     			//console.log(result.data)
		     			_this.howtoex_cookie=result.data;
		     		})
		     	 	    
        		 
    		 },
    		 howtoexFind:function(){
    			 if(this.ss==="")
    			 {
    				 alert("검색어를 입력하세요");
    				 this.$refs.ss.focus();
    				 return;
    			 }
    			 this.send();
    		 },
    		 prev:function(){
    			 //alert("1");
    			 this.curpage=this.curpage>1?this.curpage-1:this.curpage;
    			 this.send();
    		 },
    		 next:function(){
    			 //alert("2");
    			 this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
    			 //alert("page="+this.curpage)
    			 this.send();
    		 }
    	 }
     })
   </script>
</body>
</html>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/resources/css/store_style.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="${path }/resources/css/ss_style.css">

<style type="text/css">
#s_name{/* 말줄임... */
	overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;/* 보여질 줄 갯수  */
    -webkit-box-orient: vertical;
}
.btn-success{
color: white;
border-color: none;
background-color: #f67831;
}
.btn-warning{
color: white;
border-color: none;
background-color: #eb3c5a;
}
</style>
</head>
<body>
	 <div class='bg-container' style="margin-top:50px;">
	    <div  id="store_list">
	        <h1 class='heading'>Doit!&nbsp;<span style="color:orange"> STORE SHOP</h1>
	       	 <p class="description">It doesn’t matter if you’re designing a brand new app from scratch, working on a new feature or creating a landing page</p>

				<div class="centerer">
				   
				    <div class="row" style="disply:flex;flex-wrap: wrap;margin-right: -15px;margin-left: -15px;justify-content: space-evenly;">
				      <div class="text-left" style="margin-top: 20px;margin-bottom: -10px;">
				        <input type=button class="btn btn-lg btn-warning"style="background-color: black;color: white;" value="All" @click="storeChange(1)">
				        <input type=button class="btn btn-lg btn-success" style="background-color:#e45d43;;color:black;" value="Woman" @click="storeChange(2)">
				        <input type=button class="btn btn-lg btn-info"style="background-color: black;color: white ;" value="Man" v-on:click="storeChange(3)">
				      </div>
				    </div>
				</div>
				
				<div class="card-container">
				    <div class="shopping-card" v-for="vo in store_list">
				        <div class="air-max-react-shoe-container">
				            <a :href="'../store/detail_before.do?s_no='+vo.s_no+'&c_no='+type">
				            <!--   <a :href="'../store/w_detail_before.do?s_no='+vo.s_no+'&c_no='+c_no">   -->
				            <img :src="vo.poster" alt="Lights" style="width: 244px; height: 200px;"/>
				
				            <!-- <p class='trending-badge'>Trending</p> -->
				             		</a>
				        </div>
				        <!--  shoe-heading-->
				        <h4 id="s_name" style="font-size: 18px;
    margin-top: 15px;">{{vo.name}}</h4>
				        <div>
				            <div class="price-bag-container">
				                <p class="price" style="text-decoration: line-through; color: gray;">{{vo.price}}</p>
				                <p style="text-align: right;">{{vo.first_price}}</p>
				            </div>
				
				        </div>
				    </div>
				</div>
		 </div>
		<div style="height: 20px;"></div>
			
			<div class="text-center" style="text-align: center;">
			    <input type="button" class="btn btn-lg btn-warning" value="이전"style="    background-color: black;
    color: white;" @click="prev()" />
			    {{curpage}} page / {{totalpage}} pages
			    <input type="button" class="btn btn-lg btn-success" value="다음"style="    background-color: black;
    color: white;" @click="next()" />
			</div>
		<!--  <div class="row" id="store_cookie">		
	      <span v-for="i in cook_list">
	        <img :src="i.poster" style="width:100px;height:100px;margin-left: 5px">
	      </span>
	      
	    </div> -->
	    <div class="row" id="cookie" style="display: inline; margin-top: 60px">
				<div style="font-size: 27px; font-weight: 600">최근에 본 상품
					<a href="store_cookie_delete.do"><input type="button" class="btn btn-md btn-danger" value="쿠키삭제" style="margin-left: 20px;margin-bottom: 8px"></a>
				</div>

				<span v-for="s in store_cookie" style="margin-left: 10px;">
				<a :href="'detail.do?s_no='+s.s_no">
				 <img :src="s.poster" style="width:120px; "></a>
				 </span>
			</div>
	</div>
				
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
				 axios.get("http://localhost:8080/web/store/list.do",{
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
				  axios.get("http://localhost:8080/web/store/store_cookie.do",{
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
   <!-- partial -->
  <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://s.codepen.io/assets/libs/modernizr.js'></script><script  src="${path }/resources/script.js"></script>
   
</body>
</html>
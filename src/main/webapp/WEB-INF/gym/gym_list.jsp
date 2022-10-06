<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Gutim Template">
    <meta name="keywords" content="Gutim, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Gutim | Template</title>

<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${path }/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/style.css" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>


<style>
body{
   /*background-color: #eff8ff;*/
   background-color: #eee;
     font-family: 'Noto Sans KR', sans-serif !important;
     font-size: 17px;
}
.app{
   margin-top: 60px;
   margin-bottom: 60px;
}

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
    max-width: 100%;
}
.card-list-view .card-body, .card-list-view .card-footer {
    padding: 20px 30px;
}
.card-list-view .card-body, .card-list-view .card-footer {
    padding: 20px 30px;
}
.card-list .card-body h2 small {
    font-size: 19px;
}
.card-list .card-footer span {
    margin: 0 16px 0 0;
}

</style>
</head>

<body>


	<div class="container">
     <div class="app" style="width: 100%">
     <h2 style="text-align: center; margin-top: 100px">서울 헬스장 목록</h2>
		
		
		<div class="row" style="margin-top: 100px;">
			
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
											<div class="card-title" style="font-size: 21px;font-weight: 600; color: royalblue">{{vo.store}}</div></a>	
											
											<h5 class="card-subtitle mb-2 text-muted">
												<i class="mdi mdi-home-map-marker"></i> 
												{{vo.addr}}
											</h5>
											<h2 class="text-success mb-0 mt-3">
												{{vo.price | currency}}원 <small>/개월</small>
											</h2>
										</div>
										<div class="card-footer">
										  <div class="row" style="font-size: 17px">
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
				<div class="text-center" style="font-size: large">

					<button class="btn btn-md btn-success" v-on:click="prev()">이전</button>
					{{curpage}} page / {{totalpage}} pages
					<button class="btn btn-md btn-info" v-on:click="next()">다음</button>

				</div>
			</div>
			<div class="row" id="cookie" style="display: grid;margin-left: 60px;align-content: center;margin-bottom: auto;">
				<div style="text-align: center; font-size: 27px; font-weight: 600;margin-bottom: 30px;">최근에 본 상품
					<a href="gym_cookie_delete.do"><input type="button" class="btn btn-sm btn-danger" value="쿠키삭제" style="margin-left: 20px;margin-bottom: 8px"></a>
				</div>

				<span v-for="g in gym_cookie" style="margin-left: 10px;">
				<a :href="'gym_detail.do?g_no='+g.g_no">
				 <img :src="g.poster" style="width:120px;margin-bottom: 15px "></a>
				 </span>
			</div>
		</div>
		</div>
	</div>
	
   <script>
   new Vue({
		 el:'.app',
		 data:{
			 curpage:1,
			 totalpage:0,
			 gym_data:[],
			 gym_cookie:[]
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
    </body>
</html>
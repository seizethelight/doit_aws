<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/post/poststyle.css" type="text/css"/>
</head>
<body>

	<!-- ================ start banner area ================= -->
	<!-- 	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Blog Details</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Blog Details</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section> -->
	<!-- ================ end banner area ================= -->

	<!--================Blog Area =================-->
	<div class="single-post row">
		<div class="col-lg-12">
			<div class="feature-img">
				<img class="img-fluid" src="img/blog/feature-img1.jpg" alt="">
			</div>
		</div>
		<div class="col-lg-3  col-md-3">
			<div class="blog_info text-right">
				<div class="post_tag">
					<a href="#">{{vo.cate}}</a>
				</div>
				<ul class="blog_meta list">
					<li>
						<a href="#">{{vo.id}}<i class="lnr lnr-user"></i></a>
					</li>
					<li>
						<a href="#">{{vo.dbday}}<i class="lnr lnr-calendar-full"></i></a>
					</li>
					<li><a href="#">{{vo.hit}} Views <i class="lnr lnr-eye"></i>
					</a></li>
				</ul>
				<ul class="social-links">
					<li><a href="http://facebook.com"> <i class="fab fa-facebook-f"></i>
					</a></li>
					<li><a href="http://twitter.com"> <i class="fab fa-twitter"></i>
					</a></li>
					<li><a href="http://github.com"> <i class="fab fa-github"></i>
					</a></li>
					<li><a href="http://behance.net"> <i class="fab fa-behance"></i>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="col-lg-9 col-md-9 blog_details">
			<h2>{{vo.title}}</h2>
			<p class="excert">{{vo.content}}</p>
		</div>
	</div>
	<!--================ 뉴스 끝 =================-->
	
	
	<!--================ 포스트 네비게이션 시작 =================-->
	<div class="post_navigation_area">
		<div class="nav_container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
				<input type="button" class="nav-link active" value="Delete" v-on:click="newsDelete()">
				</li>
				<li class="nav-item">
					<a :href="'../post/news_edit.do?n_no='+n_no"><input type="button" value="Edit" ></a>
				</li>
				<li class="nav-item">
					<a :href="../post/news.do"><input type="button" class="nav-link active" value="Back"></a>
				</li>
			</ul>
		</div>
	</div>
	<!--================ 포스트 네비게이션 끝 =================-->
	
	
	<!--================ 삭제 확인 모달 =================-->
	

	<!--================ 페이지 이동 =================-->
	<div class="navigation-area">
		<div class="row">
			<div
				class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
				<div class="thumb">
					<a href="#"> 
					<img class="img-fluid" src="img/blog/prev.jpg" alt="">
					</a>
				</div>
				<div class="arrow">
					<a href="#"> 
						<span class="lnr text-white lnr-arrow-left"></span>
					</a>
				</div>
				<div class="detials">
					<p>Prev Post</p>
					<a href="#">
						<h4>Space The Final Frontier</h4>
					</a>
				</div>
			</div>
			<div
				class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
				<div class="detials">
					<p>Next Post</p>
					<a href="#">
						<h4>Telescopes 101</h4>
					</a>
				</div>
				<div class="arrow">
					<a href="#"> <span class="lnr text-white lnr-arrow-right"></span>
					</a>
				</div>
				<div class="thumb">
					<a href="#"> <img class="img-fluid" src="img/blog/next.jpg" alt="">
					</a>
				</div>
			</div>
		</div>
	</div>
	<!--================ 페이지 이동 끝 =================-->

<!-- partial -->
<script>
new Vue({
   	el:'.single-post',
   	data:{
   		vo:{},
   		n_no:${n_no}
   	},
   	mounted:function(){
   		let _this=this;
   		axios.get("http://localhost:8080/web/post/news_detail.do",{
   			params:{
   				n_no:_this.n_no
   			}
   		}).then(function(result){
   			_this.vo=result.data;
   		})
   	}
})
new Vue({
	el:'.post_navigation_area',
	data:{
		n_no:${n_no}
	},
	methods:{
		newsDelete:function(){
			let _this=this;
	   		axios.get("http://localhost:8080/web/post/news_delete.do",{
	   			params:{
	   				n_no:_this.n_no
	   			}
	   		}).then(function(result){
	   			console.log( "삭제 완료");
	   			alert("삭제 완료")
	   			location.href="../post/news.do"
	   		})
		}
	}
})
new Vue ({
	el: ".modalcard",
	data:{
			openModal : false
	},
	methods: {
		close:function(event){
			if(event.target.classList.contains('black-bg') || event.target.classList.contains('close')){
				this.openModal = false;
			} else if (event.target.classList.contains('white-bg')){
				this.openModal = true;
			}
		}
	},
})
</script>
</body>
</html>

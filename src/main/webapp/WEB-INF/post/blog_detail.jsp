<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
						<a href="#">{{vo.cate}}</a>
					</li>
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
					<a href="#"> <img class="img-fluid" src="img/blog/next.jpg"
						alt="">
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<!--================ 댓글보기 시작 =================-->
	<div class="comments-area">
		<h4>05 Comments</h4>
		<div class="comment-list">
			<div class="single-comment justify-content-between d-flex">
				<div class="user justify-content-between d-flex">
					<div class="thumb">
						<img src="img/blog/c1.jpg" alt="">
					</div>
					<div class="desc">
						<h5>
							<a href="#">Emilly Blunt</a>
						</h5>
						<p class="date">December 4, 2017 at 3:12 pm</p>
						<p class="comment">Never say goodbye till the end comes!</p>
					</div>
				</div>
				<div class="reply-btn">
					<a href="#" class="btn-reply text-uppercase">reply</a>
				</div>
			</div>
		</div>
		<!--================ 대댓글 =================-->
		<div class="comment-list left-padding">
			<div class="single-comment justify-content-between d-flex">
				<div class="user justify-content-between d-flex">
					<div class="thumb">
						<img src="img/blog/c3.jpg" alt="">
					</div>
					<div class="desc">
						<h5>
							<a href="#">Annie Stephens</a>
						</h5>
						<p class="date">December 4, 2017 at 3:12 pm</p>
						<p class="comment">Never say goodbye till the end comes!</p>
					</div>
				</div>
				<div class="reply-btn">
					<a href="#" class="btn-reply text-uppercase">reply</a>
				</div>
			</div>
		</div>
		
		
		<div class="comment-list">
			<div class="single-comment justify-content-between d-flex">
				<div class="user justify-content-between d-flex">
					<div class="thumb">
						<img src="img/blog/c5.jpg" alt="">
					</div>
					<div class="desc">
						<h5>
							<a href="#">Ina Hayes</a>
						</h5>
						<p class="date">December 4, 2017 at 3:12 pm</p>
						<p class="comment">Never say goodbye till the end comes!</p>
					</div>
				</div>
				<div class="reply-btn">
					<a href="#" class="btn-reply text-uppercase">reply</a>
				</div>
			</div>
		</div>
	</div>
	<!--================ 댓글보기 끝 =================-->
	
	<!--================ 댓글달기 시작 =================-->
	<div class="comment-form">
		<h4>Leave a Reply</h4>
		<form>
			<div class="form-group form-inline">
				<div class="form-group col-lg-6 col-md-6 name">
					<input type="text" class="form-control" id="name"
						placeholder="Name" onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Name'">
				</div>
				<div class="form-group col-lg-6 col-md-6 password">
					<input type="password" class="form-control" id="password"
						placeholder="Account Password" onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Account Password'">
				</div>
			</div>
			<div class="form-group">
				<textarea class="form-control mb-10" rows="5" name="message"
					placeholder="Messege" onfocus="this.placeholder = ''"
					onblur="this.placeholder = 'Messege'" required=""></textarea>
			</div>
			<a href="#" class="button button-postComment button--active">Post
				Comment</a>
		</form>
	</div>
	<!--================ 댓글달기 끝 =================-->
	<script>
	new Vue({
   	el:'.single-post',
   	data:{
   		vo:{},
   		b_no:${b_no}
   	},
   	mounted:function(){
   		let _this=this;
   		// 요청 
   		axios.get("http://localhost:8080/web/post/blog_detail.do",{
   			params:{
   				b_no:_this.b_no
   			}
   		// 요청 처리 결과값 읽기 => 데이터값 변경 (상태변경) 상태 관리 프로그램 
   		}).then(function(result){
   			console.log(result.data);
   			_this.vo=result.data;
   		})
   	}
})
new Vue({
	el:'.insert-button',
	data:{
		b_no:${b_no}
	},
	methods:{
		blogDelete:function(){
			let _this=this;
	   		axios.get("http://localhost:8080/web/post/blog_delete.do",{
	   			params:{
	   				b_no:_this.b_no
	   			}
	   		}).then(function(result){
	   			console.log( "삭제 완료");
	   			alert("삭제 완료")
	   			location.href="../post/blog.do"
	   		})
		}
	}
})
	
	</script>
</body>
</html>
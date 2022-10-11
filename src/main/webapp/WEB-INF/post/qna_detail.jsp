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
</head>
<body>
	<div class="qna_container">
	<!--================Blog Area =================-->
	<div class="single-post row">
		<div class="col-lg-12">
<!-- 			<div class="feature-img">
				<img class="img-fluid" src="img/blog/feature-img1.jpg" alt="">
			</div> -->
		</div>
		<div class="col-lg-3  col-md-3">
			<div class="blog_info text-right">
				<div class="post_tag">
					<a href="#">-</a>
				</div>
				<ul class="blog_meta list">
					<li>
						<a href="#">QnA<i class="lnr lnr-heart-pulse"></i></a>
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
	
	<!--================ 포스트 네비게이션 시작 =================-->
	<div class="post_navigation_area">
		<div class="nav_container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
				<input type="button" class="nav-link active" value="Delete" id='vdelete' v-on:click="qnaDelete()" v-if="vo.id===sid">
				</li>
				<li class="nav-item">
					<a :href="'../post/qna_edit.do?q_no='+q_no"><input type="button" value="Edit" v-if="vo.id===sid"></a>
				</li>
				<li class="nav-item">
					<input type="button" class="nav-link active" value="Back" onclick="javascript:history.back()">
				</li>
			</ul>
		</div>
	</div>
<!--================ 포스트 네비게이션 끝 =================-->
	
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
</div>
<!-- partial -->
<script>
new Vue({
 	el:'.qna_container',
 	data:{
 		vo:{},
 		q_no:${q_no},
 		sid:'<%=(String) session.getAttribute("id")%>',
 	},
 	mounted:function(){
 		let _this=this;
 		// 요청 
 		axios.get("http://localhost:8080/web/post/qna_detail.do",{
 			params:{
 				q_no:_this.q_no
 			}
 		// 요청 처리 결과값 읽기 => 데이터값 변경 (상태변경) 상태 관리 프로그램 
 		}).then(function(result){
 			_this.vo=result.data;
 		})
 	},
	methods:{
		qnaDelete:function(){
			let _this=this;
	   		axios.get("http://localhost:8080/web/post/qna_delete.do",{
	   			params:{
	   				q_no:_this.q_no
	   			}
	   		}).then(function(result){
	   			console.log( "삭제 완료");
	   			alert("삭제 완료");
	   			location.href="../post/qna.do"
	   		})
		}
	}
})
</script>
</body>
</html>

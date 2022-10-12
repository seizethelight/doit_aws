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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<div  class="news_container">
<!--================ 뉴스 Area =================-->
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
	
	<div class="post-controller">
	<!--================ 좋아요 =================-->

	<!-- <a style="cursor:pointer;" :href="'../post/news_like.do?n_no='+vo.n_no"><i class="fa fa-heart-o" style="font-size:30px; color: red;"></i></a>
 	<a style="cursor:pointer;" :href="../main/main.do"><i class="fa fa-heart-o" style="font-size:30px; color: red;"></i></a> -->
 
  <div class='lhbutton'>
  	<c:if test="${sessionScope.id!=null && lCheck==0 }">
  		<button id="like" class="selected" @click="newsLike()">Like</button>
  		<button id="dislike">Dislike</button>
  	</c:if>
		<c:if test="${sessionScope.id!=null && lCheck!=0 }">
			<button id="liked" class="selected" @click="newsLikeCancel()">Liked</button>
			<button id="dislike">Dislike</button>
		</c:if>
	</div>
	
<!--================ 싫어요 =================-->
	
<!--================ 포스트 네비게이션 시작 =================-->
	<div class="post_navigation_area">
		<div class="nav_container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
					<input type="button" class="nav-link active" value="Delete" v-on:click="newsDelete()" v-if="vo.id===sid">
				</li>
				<li class="nav-item">
					<a :href="'../post/news_edit.do?n_no='+n_no"><input type="button" value="Edit" v-if="vo.id===sid"></a>
				</li>
				<li class="nav-item">
					<input type="button" class="nav-link active" value="Back" onclick="javascript:history.back()">
				</li>
			</ul>
		</div>
	</div>
<!--================ 포스트 네비게이션 끝 =================-->
	</div>
	
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
</div>
<!-- partial -->
<script>
new Vue({
   	el:'.news_container',
   	data:{
   		vo:{},
   		n_no:${n_no},
   		title:'',
   		sid:'<%=(String) session.getAttribute("id")%>',
   	},
   	mounted:function(){
   		let _this=this;
   		axios.get("http://15.165.108.114/post/news_detail.do",{
   			params:{
   				n_no:_this.n_no,
   				lCheck : _this.lCheck
   			}
   		}).then(function(result){
   			_this.writtenid=(String)(result.data.id);
   			_this.vo=result.data;
   		})
   	},
		methods:{
			newsDelete:function(){
				let _this=this;
		   		axios.get("http://15.165.108.114/post/news_delete.do",{
		   			params:{
		   				n_no:_this.n_no
		   			}
		   		}).then(function(result){
		   			console.log( "삭제 완료");
		   			alert("삭제 완료");
		   			location.href="../post/news.do"
		   		})
			},
			newsLike : function(){
				let _this=this;
				axios.get("http://15.165.108.114/post/news_like_insert.do",{
					params : {
						n_no: _this.n_no,
						id:_this.id
					}
				}).then(function(result){
					console.log(this.n_no);
					this.vo=result.data;
					console.log(this.n_no)
					console.log(result.data);
				})
			},
			newsLikeCancel : function(){
				let _this=this;
				axios.get("http://15.165.108.114/post/news_like_cancel.do",{
					params : {
						n_no : _this.n_no,
						id : _this.id
					}
				}).then(function(result){
					console.log(this.id)
					alert("취소 완료");
				})
			}
		}
})
</script>
</body>
</html>

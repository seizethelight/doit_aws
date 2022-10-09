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
	<!--================Blog Area =================-->
	<div class="single-post row">
		<div class="col-lg-12">
			<div class="feature-img">
				<img class="img-fluid" src="${path}/resources/img/blog/feature-img1.jpg" alt="">
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
			<input type="button" class="nav-link active" value="Delete" v-on:click="forumDelete()">
			</li>
			<li class="nav-item">
				<a :href="'../post/forum_edit.do?f_no='+f_no"><input type="button" value="Edit" ></a>
			</li>
			<li class="nav-item">
				<input type="button" class="nav-link active" value="Back" onclick="javascript:history.back()">
			</li>
		</ul>
	</div>
</div>
<!--================ 포스트 네비게이션 끝 =================-->

	
<!---------- 댓글 + 답글 영역 ---------->
	<div class='comment'>
		<!-- Contenedor Principal -->
		<div class="comments-container">
			<ul id="comments-list" class="comments-list" v-for="rvo in reply">
				<li>
					<div class="comment-main-level">
						<!-- Avatar -->
						<div class="comment-avatar">
							<img src="https://img.icons8.com/external-happy-man-bomsymbols-/91/000000/external-human-happy-man-human-resource-and-life-style-set-1-happy-man-bomsymbols-.png" alt=""/>
						</div>
						<!-- Contenedor del Comentario -->
						<div class="comment-box">
							<div class="comment-head">
								<h6 class="comment-name by-author">
									<a href="http://creaticode.com/blog">{{rvo.id}}</a>
								</h6>
								
								<div>
									<span>{{rvo.dbday}}</span> <i class="fa fa-reply"></i>
									<i class="fa fa-heart"></i>
								</div>
								
							</div>
							<div class="comment-content">{{rvo.content}}</div>
						</div>
					</div> 
					<!-- Respuestas de los comentarios -->
					<!-- 답답글 -->
					<!-- <ul class="comments-list reply-list">
						<li>
							Avatar
							<div class="comment-avatar">
								<img
									src="http://i9.photobucket.com/albums/a88/creaticode/avatar_2_zps7de12f8b.jpg"
									alt="">
							</div> Contenedor del Comentario
							<div class="comment-box">
								<div class="comment-head">
									<h6 class="comment-name">
										<a href="http://creaticode.com/blog">Lorena Rojero</a>
									</h6>
									<span>hace 10 minutos</span> <i class="fa fa-reply"></i>
									<i class="fa fa-heart"></i>
								</div>
								<div class="comment-content">Lorem ipsum dolor sit
									amet, consectetur adipisicing elit. Velit omnis animi et
									iure laudantium vitae, praesentium optio, sapiente
									distinctio illo?</div>
							</div>
						</li>
	
						<li>
							Avatar
							<div class="comment-avatar">
								<img
									src="http://i9.photobucket.com/albums/a88/creaticode/avatar_1_zps8e1c80cd.jpg"
									alt="">
							</div> Contenedor del Comentario
							<div class="comment-box">
								<div class="comment-head">
									<h6 class="comment-name by-author">
										<a href="http://creaticode.com/blog">Agustin Ortiz</a>
									</h6>
									<span>hace 10 minutos</span> <i class="fa fa-reply"></i>
									<i class="fa fa-heart"></i>
								</div>
								<div class="comment-content">Lorem ipsum dolor sit
									amet, consectetur adipisicing elit. Velit omnis animi et
									iure laudantium vitae, praesentium optio, sapiente
									distinctio illo?</div>
							</div>
						</li>
					</ul> -->
				</li>
			</ul>
			<c:if test="${sessionScope.id!=null }">
			<table class="table">
				<tr>
					<td>
						<textarea rows="4" cols="78" ref="content" style="float: left" v-model="content"></textarea> 
						<input type=button value="댓글쓰기" class="btn btn-sm btn-primary" style="height: 105px; margin-left:30px; background-color:#D75A43; border:solid 0px; border-radius:15px;" @click="replyWrite()">
					</td>
				</tr>
			</table>
		</c:if>
		</div>
	</div>
	

<!--================ 페이지 이동 =================-->
	<div class="navigation-area">
		<div class="row">
			<div
				class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
				<div class="thumb">
					<a href="#"> 
					<img class="img-fluid" src="${path}/resources/img/blog/prev.jpg" alt="">
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
					<a href="#"> <img class="img-fluid" src="${path}/resources/img/blog/next.jpg" alt="">
					</a>
				</div>
			</div>
		</div>
	</div>
<!--================ 페이지 이동 끝 =================-->
	
	
	
<!-- partial -->
<script>
new Vue({
	el:'.post_navigation_area',
	data:{
		f_no:${f_no},
		sessionId:''
	},
	methods:{
		forumDelete:function(){
			let _this=this;
	   		axios.get("http://localhost:8080/web/post/forum_delete.do",{
	   			params:{
	   				f_no:_this.f_no
	   			}
	   		}).then(function(result){
	   			console.log( "삭제 완료");
	   			alert("삭제 완료");
	   			location.href="../post/forum.do"
	   		})
		}
	}
})

const detail=new Vue({
   	el:'.single-post',
   	data:{
   		vo:{},
   		f_no:${f_no}
   	},
   	mounted:function(){
   		let _this=this;
   		// 요청 
   		axios.get("http://localhost:8080/web/post/forum_detail.do",{
   			params:{
   				f_no:_this.f_no
   			}
   		// 요청 처리 결과값 읽기 => 데이터값 변경 (상태변경) 상태 관리 프로그램 
   		}).then(function(result){
   			console.log(result.data)
   			_this.vo=result.data;
   		})
   	}
})
	
/* 답변 리스트 */
new Vue({
   	el:'.comment',
   	data:{
    	f_no:${f_no},
    	sid:'',
	 		reply : [],
	 		content:''
   	},
   	mounted:function(){
   		let _this=this;
   		axios.get("http://localhost:8080/web/post/reply_list.do",{
   			params:{
   				f_no:_this.f_no,
   			}
   		}).then(function(result){
   			console.log(result.data)
   			_this.reply=result.data;
   			_this.sid=result.data[0].sid
   			console.log(result.data[0].sid)
   		})
   	},
   	methods:{
			replyWrite:function(){
				if(this.content==="")
				{
					this.$refs.content.focus();
					return;
				}
				let _this=this;
				axios.get("http://localhost:8080/web/seoul/reply_insert.do",{
	    			params:{
	    				cno:_this.cno,
	    				type:_this.type,
	    				msg:_this.msg
	    			}
	    		}).then(function(result){
	    			_this.msg="";
	    			console.log(result.data)
	    			_this.reply_list=result.data;
	    			_this.sessionId=result.data[0].sessionId
	    		})
			}
   	}
   	
})
</script>
</body>
</html>

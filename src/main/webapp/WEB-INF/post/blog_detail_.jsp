<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Blog Detail</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'>
<link rel="stylesheet" href='${path}/resources/css/poststyle.css'>
<link rel="stylesheet" href='${path}/resources/css/reply.css'>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

</head>
<body>
	<div class='app'>
		<div class='body'>
			<div class='main'>
				<div class='container'>
					<div class='main__content'>
						<h1 class='h1 title'>
							<i class='fas fa-home'></i> 
							<span>Blog</span>
						</h1>
						<div class='table-card'>
							<div class="qnadetail_container">
								<h3>블로그 상세보기</h3>
								<table class='table'>
									<thead class="container">
										<tr>
											<td width=20% class="tablehead">Title</td>
											<td colspan="3" class="tabletitle">{{vo.title}}</td>
										</tr>
										<tr>
											<td width=20% class="tablehead">Writer</td>
											<td width=30% class="tablesub">{{vo.id}}</td>
											<td width=20% class="tablehead">Hit</td>
											<td width=30% class="tablesub">{{vo.hit}}</td>
										</tr>
										<tr>
											<td width=20% class="tablehead">RegDate</td>
											<td width=30% class="tablesub">{{vo.dbday}}</td>
											<td width=20% class="tablehead">Recent Edit</td>
											<td width=30% class="tablesub">{{vo.etdate}}</td>
										</tr>
										<tr>
											<td width="20%" class="tablehead">Content</td>
											<td colspan="3" class="tablecontent">{{vo.content}}</td>
										</tr>
									</thead>
								</table>
								<div class='insert-button'>
									<input type="button" value="삭제" v-on:click="blogDelete()"> 
									<a :href="'../post/blog_edit.do?b_no='+b_no"><input type="button" value="수정" ></a>
									<input type="button" value="돌아가기" onclick="javascript:history.back()">
								</div>
							</div>

							<div id="article-neighbor-list">
								<div>
									<span class="indicator"><strong>▲윗글</strong></span> 
									<a href="blog_detail.do?b_no=" class="subject">{{vo.title}}</a>
								</div>
								<div>
									<span class="indicator"><strong>▼아랫글</strong></span> <a
										href="../pboard/detail.do?p_no=${(vo.p_no)-1}" class="subject">${vo.subject }</a>
								</div>
							</div>
							
							
							<!---------- 댓글 + 답글 영역 ---------->
							<div class='comment'>
								<!-- Contenedor Principal -->
								<div class="comments-container">
									<ul id="comments-list" class="comments-list">
										<li>
											<div class="comment-main-level">
												<!-- Avatar -->
												<div class="comment-avatar">
													<img
														src="http://i9.photobucket.com/albums/a88/creaticode/avatar_1_zps8e1c80cd.jpg"
														alt="">
												</div>
												<!-- Contenedor del Comentario -->
												<div class="comment-box">
													<div class="comment-head">
														<h6 class="comment-name by-author">
															<a href="http://creaticode.com/blog">Agustin Ortiz</a>
														</h6>
														<span>hace 20 minutos</span> 
														<i class="fa fa-reply"></i> 
														<i class="fa fa-heart"></i>
													</div>
													<div class="comment-content">Lorem ipsum dolor sit
														amet, consectetur adipisicing elit. Velit omnis animi et
														iure laudantium vitae, praesentium optio, sapiente
														distinctio illo?</div>
												</div>
											</div> <!-- Respuestas de los comentarios -->
											
									    <!-- ================ 대댓글 ================= -->  
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
														<img src="http://i9.photobucket.com/albums/a88/creaticode/avatar_1_zps8e1c80cd.jpg" alt="">
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
									    <!-- ================ 대댓글 ================= -->  
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- partial -->
<script>
new Vue({
   	el:'.main__content',
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
   			_this.vo=result.data;
   		})
   	}
}),
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

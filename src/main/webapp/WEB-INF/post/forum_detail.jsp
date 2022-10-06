<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>QnA Insert</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'>
<link rel="stylesheet" href='${path}/resources/css/poststyle.css'>
<link rel="stylesheet" href='${path}/resources/css/postreply.css'>
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
							<i class='fas fa-home'></i> <span>Forum Detail</span>
						</h1>
						<div class='table-card'>
							<div class="forumdetail_container">
								<div class="forumdetail_content">
									<table class='table'>
										<thead class="container">
											<tr>
												<td class="tablehead">TITLE</td>
												<td colspan="3" class="tabletitle">{{vo.title}}</td>
											</tr>
											<tr>
												<td class="tablehead">ID</td>
												<td class="tablesub">{{vo.id}}</td>
												<td class="tablehead">Hit</td>
												<td class="tablesub">{{vo.hit}}</td>
											</tr>
											<tr>
												<td class="tablehead">RegDate</td>
												<td class="tablesub">{{vo.dbday}}</td>
												<td class="tablehead">EditeDate</td>
												<td class="tablesub">{{vo.etdate}}</td>
											</tr>
											<tr>
												<td class="tablehead">Content</td>
												<td colspan="3" class="tablecontent">{{vo.content}}</td>
											</tr>
										</thead>
									</table>
								</div>

								<%-- <div class="forumdetail_reply">
									<div class="row" id="forum_reply">
										<table class="table" id="forum_reply_table">
											<tr v-for="rvo in reply">
												<td>
													<table>
														<tr>
															<td class="text-left">◑&nbsp;{{rvo.id}}&nbsp;({{rvo.dbday}})</td>
															<td class="text-right">
																<c:if test="${sessionScope.id==rvo.id}">
																	<input type=button class="btn btn-xs btn-info ups" v-if="rvo.id===sessionId" value="수정" @click="replyUpdate_temp(rvo.no)" :id="'up'+rvo.no">
																	<input type=button class="btn btn-xs btn-warning" v-if="rvo.id===sessionId" value="삭제" v-on:click="replyDelete(rvo.no)">
																</c:if>
															</td>
														</tr>

														<tr>
															<td colspan="2" valign="top" class="text-left"><pre
																	style="white-space: pre-wrap; border: none; background-color: white">{{rvo.content}}</pre></td>
														</tr>


														<!-- <tr :id="'u'+rvo.f_no" class="updates"
															style="display: none">
															<td colspan="2">
																<table class="table">
																	<tr>
																		<td>
																			<input type=hidden name="f_no" :value="rvo.no"> 
																			<textarea rows="5" cols="70" ref="content" style="float: left" id="content">{{reply.content}}</textarea>
																			<input type=submit value="댓글수정" class="btn btn-sm btn-primary" style="height: 105px">
																		</td>
																	</tr>
																</table>
															</td>
														</tr> -->


													</table>
												</td>
											</tr>
										</table>
										<c:if test="${sessionScope.id!=null }">
											<table class="table">
												<tr>
													<td><textarea rows="5" cols="78" ref="msg"
															style="float: left" v-model="msg"></textarea> <input
														type=button value="댓글쓰기" class="btn btn-sm btn-primary"
														style="height: 105px" @click="replyWrite()"></td>
												</tr>
											</table>
										</c:if>
									</div>
								</div> --%>

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
															<span>{{rvo.dbday}}</span> <i class="fa fa-reply"></i>
															<i class="fa fa-heart"></i>
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


								<div class='insert-button'>
									<input type="button" value="삭제" v-on:click="forumDelete()">
									<a :href="'../post/forum_edit.do?f_no='+f_no"><input
										type="button" value="수정"></a> <input type="button"
										value="돌아가기" onclick="javascript:history.back()">
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
		el:'.insert-button',
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
	   	el:'.forumdetail_content',
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

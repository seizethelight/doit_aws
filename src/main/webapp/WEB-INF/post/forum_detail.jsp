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
<div class="forum_container">
	<!--================Blog Area =================-->
	<div class="single-post row">
		<div class="col-lg-12">
			<div class="feature-img">
				<img class="img-fluid" :src="vo.img" alt="">
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
			<input type="button" class="nav-link active" value="Delete" v-on:click="forumDelete()" v-if="vo.id===sid">
			</li>
			<li class="nav-item">
				<a :href="'../post/forum_edit.do?f_no='+f_no"><input type="button" value="Edit" v-if="vo.id===sid"></a>
			</li>
			<li class="nav-item">
				<input type="button" class="nav-link active" value="Back" onclick="javascript:history.back()">
			</li>
		</ul>
	</div>
</div>
<!--================ 포스트 네비게이션 끝 =================-->
</div>
	
<div class="comment_container">
	<!--================ 댓글보기 시작 =================-->
	<div class="comments-area">
		<h4> Comments</h4>
		<div class="comment-list" v-for="rvo in reply">
			<div class="single-comment justify-content-between d-flex">
				<div class="user justify-content-between d-flex">
					<div class="thumb">
						<img src="img/blog/c1.jpg" alt="">
					</div>
					<div class="desc">
						<h5>
							<a href="#">{{rvo.id}}</a>
						</h5>
						<p class="date">{{rvo.dbday}} at {{rvo.dbtime}}</p>
						<p class="comment">{{rvo.content}}</p>
					</div>
				</div>
				<div class="reply-btn">
					<input type="button" value="Delete" class="btn-reply text-uppercase" v-on:click="replyDelete(rvo.f_r_no)" v-if="rvo.id===sid">
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
					<input type="text" class="form-control" ref='<%=(String) session.getAttribute("id")%>' 
					placeholder='<%=(String) session.getAttribute("id")%>' readonly>
				</div>
				<div class="form-group col-lg-6 col-md-6 password">
					<input type="text" class="form-control"
					placeholder="댓글안에 당신의 성숙함도 함께 담아주세요." readonly>
				</div>
			</div>
			<div class="form-group">
				<textarea class="form-control mb-10" rows="5" ref="content" placeholder="Messege" onfocus="this.placeholder = ''" 
				onblur="this.placeholder = 'Messege'" required="" v-model="content"></textarea>
			</div>
			<input type=button @click="replyInsert()" class="button button-postComment button--active" value="Post Comment">
		</form>
	</div>
	<!--================ 댓글달기 끝 =================-->
</div>
	
	
<!-- partial -->
<script>
new Vue({
	el:'.forum_container',
	data:{
		f_no:${f_no},
		sid:'<%=(String) session.getAttribute("id")%>',
		vo:{},
		
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
   	el:'.comment_container',
   	data:{
    	f_no:${f_no},
    	sid:'<%=(String) session.getAttribute("id")%>',
	 		reply : [],
	 		content:'',
	 		f_r_no:''
   	},
   	mounted:function(){
   		let _this=this;
   		axios.get("http://localhost:8080/web/post/reply_list.do",{
   			params:{
   				f_no:_this.f_no
   			}
   		}).then(function(result){
   			_this.reply=result.data;
   			console.log(_this.reply);
   		})
   	},
   	methods:{
			replyInsert:function(){
	   		let _this=this;
				if(this.content==="")
				{
					this.$refs.content.focus();
					return;
				}
				axios.get("http://localhost:8080/web/post/reply_insert.do",{
	    			params:{
	    				f_no : this.f_no,
	    				content : this.content,
	    				id : this.sid
	    			}
	    		}).then(function(result){
	    			content : "",
	    			console.log( "댓글 등록 완료");
		   			alert("댓글이 등록되었습니다. 새로고침을 해주세요");
	    			_this.reply=result.data;
    		})
			},
			replyDelete:function(f_r_no){
	   		let _this=this;
				axios.get("http://localhost:8080/web/post/reply_delete.do",{
					params : {
						f_r_no : _this.f_r_no,
						f_no : _this.f_no
					}
				}).then(function(result){
					console.log(this.f_r_no)
					alert("댓글이 삭제되었습니다. 정상적인 동작을 위하여 새로고침이 필요합니다.")
					_this.reply=result.data;
				})
			}
   	}
})
</script>
</body>
</html>

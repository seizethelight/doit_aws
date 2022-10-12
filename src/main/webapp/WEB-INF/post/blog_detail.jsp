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
<div class="blog_container">
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
					<a href="#">-</a>
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
	
<!--================ 포스트 네비게이션 시작 =================-->
	<div class="post_navigation_area">
		<div class="nav_container">
		<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item">
				<input type="button" class="nav-link active" value="Delete" v-on:click="blogDelete()" v-if="vo.id===sid">
				</li>
				<li class="nav-item">
					<a :href="'../post/blog_edit.do?b_no='+b_no"><input type="button" value="Edit" v-if="vo.id===sid"></a>
				</li>
				<li class="nav-item">
					<input type="button" class="nav-link active" value="Back" onclick="javascript:history.back()">
				</li>
			</ul>
		</div>
	</div>
<!--================ 포스트 네비게이션 끝 =================-->	
	
<!--================ 페이지 이동 =================-->
	<!-- <div class="navigation-area">
		<div class="row">
			<div
				class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
				<div class="thumb">
					<a href="#"> 
					<img class="img-fluid" src="img/blog/prev.jpg" alt="">
					</a>
				</div>
				<div class="arrow">
					<a href="'../post/blog_detail.do?b_no='+vo.b_no-1"> 
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
	</div> -->
</div>
	<!--================ blog_container 끝 =================-->
	
<div class="comment_container">
	<!--================ 댓글보기 시작 =================-->
	<div class="comments-area">
		<h4> Comments</h4>
		<div class="comment-list" v-for="cvo in reply">
			<div class="single-comment justify-content-between d-flex">
				<div class="user justify-content-between d-flex">
					<div class="thumb">
						<img src="img/blog/c1.jpg" alt="">
					</div>
					<div class="desc">
						<h5>
							<a href="#">{{cvo.id}}</a>
						</h5>
						<p class="date">{{cvo.dbday}} at {{cvo.dbtime}}</p>
						<p class="comment">{{cvo.content}}</p>
					</div>
				</div>
				<div class="reply-btn">
					<input type="button" value="Delete" class="btn-reply text-uppercase" v-on:click="breplyDelete(cvo.b_r_no)" v-if="cvo.id===sid">
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
					<input type="password" class="form-control" v-model="pwd" placeholder="Account Password" 
					onfocus="this.placeholder = ''" onblur="this.placeholder = 'Account Password'">
				</div>
			</div>
			<div class="form-group">
				<textarea class="form-control mb-10" rows="5" ref="content" placeholder="Messege" onfocus="this.placeholder = ''" 
				onblur="this.placeholder = 'Messege'" required="" v-model="content"></textarea>
			</div>
			<input type=button @click="breplyInsert()" class="button button-postComment button--active" value="Post Comment">
		</form>
	</div>
</div>
<!--================ 댓글달기 끝 =================-->
<script>
new Vue({
 	el:'.blog_container',
 	data:{
 		vo:{},
 		b_no:${b_no},
 		sid:'<%=(String) session.getAttribute("id")%>'
 	},
 	mounted:function(){
 		let _this=this;
 		// 요청 
 		axios.get("http://15.165.108.114/post/blog_detail.do",{
 			params:{
 				b_no:_this.b_no
 			}
 		// 요청 처리 결과값 읽기 => 데이터값 변경 (상태변경) 상태 관리 프로그램 
 		}).then(function(result){
 			console.log(result.data);
 			_this.vo=result.data;
 		})
 	},
	methods:{
		blogDelete:function(){
			let _this=this;
	   		axios.get("http://15.165.108.114/post/blog_delete.do",{
	   			params:{
	   				b_no:_this.b_no
	   			}
	   		}).then(function(result){
	   			console.log( "삭제 완료");
	   			alert("삭제 완료");
	   			location.href="../post/blog.do"
	   		})
		}
	}
}),
new Vue({
	el:'.comment_container',
	data : {
		b_no:${b_no},
		reply:[],
 		sid:'<%=(String) session.getAttribute("id")%>',
		content:'',
		b_r_no:'',
		pwd:'',
	},
	mounted:function(){
		let _this=this;
		axios.get("http://15.165.108.114/post/blog_reply_list.do",{
			params:{
				b_no:_this.b_no
			}
		}).then(function(result){
			_this.comment_count=result.data.length;
			_this.reply=result.data;
			console.log(_this.reply);
		})
	},
	methods : {
		breplyInsert:function(){
			let _this=this;
			if(this.content==="")
			{
				this.$refs.content.focus();
				return;
			}
			axios.get("http://15.165.108.114/post/blog_reply_insert.do",{
				params:{
					b_no : this.b_no,
					content : this.content,
					id : _this.sid,
					pwd : this.pwd
				}
			}).then(function(result){
				content:"",
				console.log(_this.sid)
				console.log("댓글등록 완료")
				alert("댓글이 성공적으로 등록 되었습니다. 새로운 댓글을 위해서 새로고침을 해주세요 :)");
				_this.reply = result.data;
				console.log(result.data)
			})
		},
		breplyDelete:function(b_r_no){
   		let _this=this;
			axios.get("http://15.165.108.114/post/blog_reply_delete.do",{
				params : {
					b_r_no : b_r_no,
					b_no : _this.b_no
				}
			}).then(function(result){
				console.log(this.data)
				alert("댓글이 삭제되었습니다. 정상적인 동작을 위하여 새로고침이 필요합니다.")
				_this.reply=result.data;

			})
		}
	}
})
</script>
</body>
</html>
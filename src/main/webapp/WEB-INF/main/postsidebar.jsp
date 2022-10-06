<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="blog_right_sidebar">
			<aside class="single_sidebar_widget search_widget">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search Posts">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">
							<i class="lnr lnr-magnifier"></i>
						</button>
					</span>
				</div>
				<!-- /input-group -->
				<div class="br"></div>
			</aside>
			<aside class="single_sidebar_widget author_widget">
				<img class="author_img rounded-circle" src="img/blog/author.png"
					alt="">
				<h4>Charlie Barber</h4>
				<p>Senior blog writer</p>
				<div class="social_icon">
					<a href="#"> <i class="fab fa-facebook-f"></i>
					</a> <a href="#"> <i class="fab fa-twitter"></i>
					</a> <a href="#"> <i class="fab fa-github"></i>
					</a> <a href="#"> <i class="fab fa-behance"></i>
					</a>
				</div>
				<p>Boot camps have its supporters andit sdetractors. Some people
					do not understand why you should have to spend money on boot camp
					when you can get. Boot camps have itssuppor ters andits detractors.
				</p>
				<div class="br"></div>
			</aside>
			
			
			<aside class="single_sidebar_widget popular_post_widget">
				<h3 class="widget_title">Popular Posts</h3>
				<div class="media post_item" v-for="fvo in news_top">
					<div class="media-body">
						<a href="blog-details.html">
							<h3>{{fvo.title}}</h3>
						</a>
						<p>{{fvo.hit}} Clicks</p>
					</div>
				</div>
				<div class="br"></div>
			</aside>
			
			
			<aside class="single_sidebar_widget frequently_ask_question_widget">
				<h3 class="widget_title">Frequently Ask Question</h3>
				
				<div class="media post_item">
					<div class="media-body">
						<a href="http://localhost:8080/web/post/qna_detail.do?q_no=8">
							<h3>개인 아이디 회원가입 방법</h3>
						</a>
						<p>Click for more information</p>
					</div>
				</div>
				<div class="media post_item">
					<div class="media-body">
						<a href="http://localhost:8080/web/post/qna_detail.do?q_no=9">
							<h3>간편 로그인 설정 및 해제 방법</h3>
						</a>
						<p>Click for more information</p>
					</div>
				</div>
				<div class="media post_item">
					<div class="media-body">
						<a href="http://localhost:8080/web/post/qna_detail.do?q_no=7">
							<h3>직접 처리 불가능한 멤버십 취소·환불의 경우</h3>
						</a>
						<p>Click for more information</p>
					</div>
				</div>
				<div class="br"></div>
			</aside>
			
			
			<aside class="single_sidebar_widget ads_widget">
				<a href="#"> 
				<img class="img-fluid" src="img/blog/add.jpg" alt="">
				</a>
				<div class="br"></div>
			</aside>
			<aside class="single_sidebar_widget post_category_widget">
				<h4 class="widget_title">Post Catgories</h4>
				<ul class="list cat-list">
					<li><a href="#" class="d-flex justify-content-between">
							<p>Technology</p>
							<p>37</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>Lifestyle</p>
							<p>24</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>Fashion</p>
							<p>59</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>Art</p>
							<p>29</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>Food</p>
							<p>15</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>Architecture</p>
							<p>09</p>
					</a></li>
					<li><a href="#" class="d-flex justify-content-between">
							<p>Adventure</p>
							<p>44</p>
					</a></li>
				</ul>
				<div class="br"></div>
			</aside>
			<aside class="single-sidebar-widget newsletter_widget">
				<h4 class="widget_title">Newsletter</h4>
				<p>Here, I focus on a range of items and features that we use in
					life without giving them a second thought.</p>
				<div class="form-group d-flex flex-row">
					<div class="input-group">
						<div class="input-group-prepend">
							<div class="input-group-text">
								<i class="fa fa-envelope" aria-hidden="true"></i>
							</div>
						</div>
						<input type="text" class="form-control" id="inlineFormInputGroup"
							placeholder="Enter email address" onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Enter email'">
					</div>
					<a href="#" class="bbtns">Subcribe</a>
				</div>
				<p class="text-bottom">You can unsubscribe at any time</p>
				<div class="br"></div>
			</aside>
			<aside class="single-sidebar-widget tag_cloud_widget">
				<h4 class="widget_title">Tag Clouds</h4>
				<ul class="list">
					<li><a href="#">Technology</a></li>
					<li><a href="#">Fashion</a></li>
					<li><a href="#">Architecture</a></li>
					<li><a href="#">Fashion</a></li>
					<li><a href="#">Food</a></li>
					<li><a href="#">Technology</a></li>
					<li><a href="#">Lifestyle</a></li>
					<li><a href="#">Art</a></li>
					<li><a href="#">Adventure</a></li>
					<li><a href="#">Food</a></li>
					<li><a href="#">Lifestyle</a></li>
					<li><a href="#">Adventure</a></li>
				</ul>
			</aside>
		</div>
		<script>
		new Vue({
			el : '.popular_post_widget',
			data : {
				news_top : []
			},
			mounted : function() {
				let _this = this;
				axios.get("http://localhost:8080/web/post/news_top.do",
						{
							params : {

							}
						}).then(function(result) {
					console.log(result.data);
					_this.news_top = result.data;
				})
			}
		})
		</script>
</body>
</html>
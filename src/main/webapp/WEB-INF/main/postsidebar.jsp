<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
			<img class="author_img rounded-circle"
				src="https://cdn.pixabay.com/photo/2014/02/13/07/28/wordpress-265132_960_720.jpg"
				alt="">
			<h3>글쓰기</h3>
			<p>Share your experience</p>

			<c:if test="${sessionScope.id != null }">
				<div class="insert-all-button">
					<a class="button-blog" href="../post/forum_insert.do">포럼</a> <a
						class="button-blog" href="../post/qna_insert.do">문의</a> <a
						class="button-blog" href="../post/news_insert.do">뉴스</a> <a
						class="button-blog" href="../post/blog_insert.do">블로그</a>
				</div>
			</c:if>
			<c:if test="${sessionScope.id == null }">
				<div class='insert-button'>
					<input type=button value="Login to Write"
						onclick="location.href='../member/login.do'">
				</div>
			</c:if>
			<p>"Words do not express thoughts very well. They always become a
				little different immediately after they are expressed, a little
				distorted, a little foolish." <br>
				― Hermann Hesse</p>
			<div class="br"></div>
		</aside>



		<aside class="single_sidebar_widget popular_post_widget">
			<h3 class="widget_title">Popular Posts</h3>
			<div class="media post_item" v-for="fvo in news_top">
				<div class="media-body">
					<a :href="'../post/news_detail.do?n_no='+fvo.n_no">
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
					<a href="http://localhost:8080/web/post/qna_detail.do?q_no=13">
						<h3>개인 아이디 회원가입 방법</h3>
					</a>
					<p>Click for more information</p>
				</div>
			</div>
			<div class="media post_item">
				<div class="media-body">
					<a href="http://localhost:8080/web/post/qna_detail.do?q_no=7">
						<h3>간편 로그인 설정 및 해제 방법</h3>
					</a>
					<p>Click for more information</p>
				</div>
			</div>
			<div class="media post_item">
				<div class="media-body">
					<a href="http://localhost:8080/web/post/qna_detail.do?q_no=15">
						<h3>도용 발생 시 대처 방법</h3>
					</a>
					<p>Click for more information</p>
				</div>
			</div>
			<div class="br"></div>
		</aside>


		<aside class="single_sidebar_widget ads_widget">
			<a href="../doex/bmi_cal.do"> <img class="img-fluid"
				src="${path}/resources/img/home/about-pic.jpg" alt="">
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
				<li><a href="#">Food</a></li>
				<li><a href="#">Diet</a></li>
				<li><a href="#">Workout</a></li>
				<li><a href="#">Health</a></li>
				<li><a href="#">Lifestyle</a></li>
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
				axios.get("http://localhost:8080/web/post/news_top.do", {
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
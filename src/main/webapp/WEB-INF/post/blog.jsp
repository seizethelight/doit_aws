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
<!--================Blog Area =================-->
<div class="blog_left_sidebar">
    <article class="row blog_item" v-for="vo in blog_list">
        <div class="col-md-3">
            <div class="blog_info text-right">
                <div class="post_tag">
                    <a href="#">Food,</a>
                    <a class="active" href="#">Technology</a>
                </div>
                <ul class="blog_meta list">
                    <li>
                        <a href="#">{{vo.id}}
                            <i class="lnr lnr-user"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">12 Dec, 2017
                            <i class="lnr lnr-calendar-full"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">1.2M Views
                            <i class="lnr lnr-eye"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-9">
            <div class="blog_post">
                <img src="img/blog/main-blog/m-blog-1.jpg" alt="">
                <div class="blog_details">
                    <a href="single-blog.html">
                        <h2>{{vo.title}}</h2>
                    </a>
                    <p>{{vo.content}}</p>
                    <a class="button button-blog" href="single-blog.html">View More</a>
                </div>
            </div>
        </div>
    </article>

    <nav class="blog-pagination justify-content-center d-flex">
        <ul class="pagination">
            <li class="page-item">
                <a href="#" class="page-link" aria-label="Previous">
                    <span aria-hidden="true">
                        <span class="lnr lnr-chevron-left"></span>
                    </span>
                </a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">01</a>
            </li>
            <li class="page-item active">
                <a href="#" class="page-link">02</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">03</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">04</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link">09</a>
            </li>
            <li class="page-item">
                <a href="#" class="page-link" aria-label="Next">
                    <span aria-hidden="true">
                        <span class="lnr lnr-chevron-right"></span>
                    </span>
                </a>
            </li>
        </ul>
    </nav>
</div>
<!--================Blog Area =================-->
<script>
new Vue(
	{
		el : '.blog_left_sidebar',
		data : {
			blog_list : [],
			curpage : 1,
			totalpage : 0
		},
		mounted : function() {
			let _this = this;
			axios.get(
					"http://localhost:8080/web/post/blog_list.do",
					{
						params : {
							page : _this.curpage
						}
					}).then(function(result) {
				console.log(result.data);
				_this.blog_list = result.data;
				_this.curpage = result.data[0].curpage;
				_this.totalpage = result.data[0].totalpage;
			})
		},
		methods : {
			send : function() {
				let _this = this;
				axios
						.get(
								"http://localhost:8080/web/post/blog_list.do",
								{
									params : {
										page : _this.curpage
									}
								})
						.then(
								function(result) {
									console.log(result);
									_this.blog_list = result.data;
									_this.curpage = result.data[0].curpage;
									_this.totalpage = result.data[0].totalpage;
								})
			},
			prev : function() {
				this.curpage = this.curpage > 1 ? this.curpage - 1
						: this.curpage;
				this.send()
			},
			next : function() {
				this.curpage = this.curpage < this.totalpage ? this.curpage + 1
						: this.curpage;
				this.send()
			}
		}
	})
</script>
</body>
</html>
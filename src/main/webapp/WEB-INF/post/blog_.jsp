<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CodePen - Tour Bus</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'>
<link rel="stylesheet" href='${path}/resources/css/poststyle.css'>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<!-- partial:index.partial.html -->
	<div class='app'>
		<div class='body'>

			<div class='main'>
				<div class='main__content'>
					<h1 class='h1 title'>
						<i class='fas fa-home'></i> <span>Blog</span>
					</h1>
					<div class='table-card'>
						<table class='table'>
							<thead>
								<tr v-for>
									<td id='tour-table'>No.</td>
									<td>Title</td>
									<td>Writer</td>
									<td>RegDate</td>
								</tr>
							</thead>
							<tbody>
								<tr v-for="vo in blog_list">
									<td width=10% class="text-center">{{vo.b_no}}</td>
									<td width=45%><a
										:href="'../post/blog_detail.do?b_no='+vo.b_no">{{vo.title}}</a></td>
									<td width=15% class="text-center">{{vo.id}}</td>
									<td width=20% class="text-center">{{vo.dbday}}</td>
								</tr>
							</tbody>
						</table>
						<table class="table">
							<tr>
								<td class="pagination">
									<button class="btn btn-sm btn-info" v-on:click="prev()">이전</button>
									<div class="pagenumber">{{curpage}} / {{totalpage}}</div>
									<button class="btn btn-sm btn-info" v-on:click="next()">다음</button>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- partial -->

	<script>
		new Vue(
				{
					el : '.table-card',
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
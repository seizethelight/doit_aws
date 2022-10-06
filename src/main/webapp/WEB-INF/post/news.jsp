<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>News List</title>
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
						<i class='fas fa-home'></i> 
						<span>News</span>
					</h1>
					<div class="topcontainer">
						<div class='dashcards'>
							<div class='col' v-for="fvo in news_top">
								<div class='card'>
									<div>
										<i class='fas fa-star-half'>FAQ</i>
										<h5 class='card__subtitle'>조회수 : {{fvo.hit}}</h5>
										<h2 class='card__title'>{{fvo.title}}</h2>
										<p class='card__extra'>
											<a :href="'../post/news_detail.do?n_no='+fvo.n_no">More Information</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class='table-card'>
						<table class='table'>
							<thead>
								<tr>
									<td>No.</td>
									<td class='tableheader-title'>Title</td>
									<td>Writer</td>
									<td>Regdate</td>
									<td>Hit</td>
								</tr>
							</thead>
							<tbody class="container">
								<tr v-for="vo in news_list">
									<td width=10% class="text-center">{{vo.n_no}}</td>
									<td width=45%><a :href="'../post/news_detail.do?n_no='+vo.n_no">{{vo.title}}</a></td>
									<td width=15% class="text-center">{{vo.id}}</td>
									<td width=20% class="text-center">{{vo.dbday}}</td>
									<td width=10% class="text-center">{{vo.hit}}</td>
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
								news_list : [],
								curpage : 1,
								totalpage : 0
							},
							mounted : function() {
								let _this = this;
								axios
										.get(
												"http://localhost:8080/web/post/news_list.do",
												{
													params : {
														page : _this.curpage
													}
												})
										.then(
												function(result) {
													console.log(result.data);
													_this.news_list = result.data;
													_this.curpage = result.data[0].curpage;
													_this.totalpage = result.data[0].totalpage;
												})
							},
							methods : {
								send : function() {
									let _this = this;
									axios
											.get(
													"http://localhost:8080/web/post/news_list.do",
													{
														params : {
															page : _this.curpage
														}
													})
											.then(
													function(result) {
														console.log(result);
														_this.news_list = result.data;
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
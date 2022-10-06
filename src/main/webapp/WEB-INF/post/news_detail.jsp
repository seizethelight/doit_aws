<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>QnA Insert</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'>
<link rel="stylesheet" href='${path}/resources/css/poststyle.css'>
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
							<span>News</span>
						</h1>
						<div class='table-card'>
								<table class='table'>
									<thead class="container">
										<tr>
											<td width=20% class="tablehead">TITLE</td>
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
											<td width=20% class="tablehead">Content</td>
											<td colspan="3" class="tablecontent">{{vo.content}}</td>
										</tr>
									</thead>
								</table>
								<div class='insert-button'>
									<input type="button" value="삭제" v-on:click="newsDelete()"> 
									<a :href="'../post/news_edit.do?n_no='+n_no"><input type="button" value="수정" ></a>
									<input type="button" value="돌아가기" onclick="javascript:history.back()">
								</div>
								
							<!-- 좋아요 / 싫어요 -->
							<!-- <div class='likehate'>
								<button class="like__btn">
									<span id="icon"><i class="fa-regular fa-thumbs-up" v-on:click="newsLikeData()"></i></span> 
									<span id="count">1</span> Like
								</button>
								<button class="hate__btn">
									<span id="icon"><i class="fa-regular fa-thumbs-down"></i></span> 
									<span id="count">1</span> Hate
								</button>
							</div> -->
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- partial -->
<script>
new Vue({
   	el:'.table',
   	data:{
   		vo:{},
   		n_no:${n_no}
   	},
   	mounted:function(){
   		let _this=this;
   		axios.get("http://localhost:8080/web/post/news_detail.do",{
   			params:{
   				n_no:_this.n_no
   			}
   		}).then(function(result){
   			_this.vo=result.data;
   		})
   	}
}),
new Vue({
	el:'.insert-button',
	data:{
		n_no:${n_no}
	},
	methods:{
		newsDelete:function(){
			let _this=this;
	   		axios.get("http://localhost:8080/web/post/news_delete.do",{
	   			params:{
	   				n_no:_this.n_no
	   			}
	   		}).then(function(result){
	   			console.log( "삭제 완료");
	   			alert("삭제 완료")
	   			location.href="../post/news.do"
	   		})
		}
	}
})
</script>
</body>
</html>

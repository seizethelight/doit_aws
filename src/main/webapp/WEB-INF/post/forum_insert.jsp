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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<div class='app'>
		<div class='body'>
			<div class='main'>
				<div class='main__content'>
					<h1 class='h1 title'>
						<i class='fas fa-home'></i> <span>Forum</span>
					</h1>
					<div class='table-card'>
						<div class="qnainsert_container">
							<h2>새로운 포럼 열기</h2>
							<table class='table'>
								<thead>
									<tr>
										<td id='tour-table'>TITLE</td>
										<td class='tableinsert'><input type="text"
											v-model="title" ref="title" placeholder="제목을 입력하세요">
										</td>
									</tr>
									<tr>
										<td class="tableid">ID</td>
										<td class="tableinsert"><input type="text" v-model="id"
											ref="<%=(String) session.getAttribute("id")%>"
											placeholder='<%=(String) session.getAttribute("id")%>'
											readonly> <%-- <div><%= session.getId() %></div> --%>
											<!-- 위의 방식대로하면 다운캐스팅 되지 않고 2ax834csdf 이런 식으로 구성된 세션의 주소가 뜬다 -->
										</td>
									</tr>
									<tr>
										<td id='tour-table'>Content</td>
										<td class='tableinsert'><textarea rows="10" cols="70"
												v-model="content" ref="content" placeholder="포럼 내용을 작성하세요"></textarea>
										</td>
									</tr>
								</thead>
							</table>
							<div class='insert-button'>
								<input type="button" value="글쓰기" v-on:click="qnaInsert()">
								<input type="button" value="취소"
									onclick="javascript:history.back()">
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
	el:'.main',
	data:{
		id:'<%=(String) session.getAttribute("id")%>',
		title:'',
		content:'',
	},
	methods:{
		qnaInsert:function(){
			// 유효성 검사 
			if(this.title.trim()=="")
			{
				this.$refs.title.focus();
				return;
			}
			if(this.content.trim()=="")
			{
				this.$refs.content.focus();
				return;
			}
			
			// 전송  => ?name=
			axios.get("http://localhost:8080/web/post/forum_insert.do",{
				params:{
					id:this.id,
					title:this.title,
					content:this.content
				}
			}).then(function(result){
				location.href="../post/forum.do";
			})
		}
	}
})
new Vue({
	el : '.tableid',
	data : {
		id:${id}
	},
	mounted : function(){
		let _this=this;
		axios.get("http://localhost:8080/web/post/forum_insert.do", {
			params : {
				id : _this.id
			}
		}).then(function(result){
			_this.vo=result.data;
		})
	}
})
</script>
</body>
</html>

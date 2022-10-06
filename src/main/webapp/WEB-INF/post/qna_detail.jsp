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
							<span>QnA Detail</span>
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
											<td width=20% class="tablehead">RegDate</td>
											<td width=30% class="tablesub">{{vo.dbday}}</td>
										</tr>
										<tr>
											<td width=20% class="tablehead">Content</td>
											<td colspan="3" class="tablecontent">{{vo.content}}</td>
										</tr>
									</thead>
								</table>
								<div class='insert-button'>
									<input type="button" value="삭제" v-on:click="qnaDelete()"> 
									<a :href="'../post/qna_edit.do?q_no='+q_no"><input type="button" value="수정" ></a>
									<input type="button" value="돌아가기" onclick="javascript:history.back()">
								</div>	
							<!--  다음/이전 게시글 넘어가기. rownum 이용해야 삭제한 게시글 뛰어넘을 수 있다. -->
							<%-- 
							<div id="article-neighbor-list">
								<div>
									<span class="indicator"><strong>▲윗글</strong></span> 
									<a :href="'news_detail.do?n_no='+vo.n_no" class="subject">{{vo.title}}</a>
								</div>
								<div>
									<span class="indicator"><strong>▼아랫글</strong></span>
									<a href="../post/news_detail.do?n_no="${(vo.n_no)-1} class="subject">${vo.title }</a>
								</div>
							</div> 
							--%>
							
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
   		q_no:${q_no}
   	},
   	mounted:function(){
   		let _this=this;
   		// 요청 
   		axios.get("http://localhost:8080/web/post/qna_detail.do",{
   			params:{
   				q_no:_this.q_no
   			}
   		// 요청 처리 결과값 읽기 => 데이터값 변경 (상태변경) 상태 관리 프로그램 
   		}).then(function(result){
   			_this.vo=result.data;
   		})
   	}
}),
new Vue({
	el:'.insert-button',
	data:{
		q_no:${q_no}
	},
	methods:{
		qnaDelete:function(){
			let _this=this;
	   		axios.get("http://localhost:8080/web/post/qna_delete.do",{
	   			params:{
	   				q_no:_this.q_no
	   			}
	   		}).then(function(result){
	   			console.log( "삭제 완료");
	   			alert("삭제 완료")
	   			location.href="../post/qna.do"
	   		})
		}
	}
})
</script>
</body>
</html>

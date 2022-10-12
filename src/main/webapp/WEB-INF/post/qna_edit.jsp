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
							<span>QnA</span>
						</h1>
						<div class='table-card'>
							<div>
								<table class='table'>
									<thead class='container'>
										<tr>
											<td width=20% class="tablehead">Writer</td>
											<td width=30% class="tablesub">{{vo.id}}</td>
											<td width=20% class="tablehead">Hit</td>
											<td width=30% class="tablesub">{{vo.hit}}</td>
										</tr>
										<tr>
											<td width=20% class="tablehead">RegDate</td>
											<td width=30% class="tablesub">{{vo.dbday}}</td>
											<td width=20% class="tablehead">No.</td>
											<td width=30% class="tablesub">{{vo.q_no}}</td>
										</tr>
										<tr>
											<td id='tour-table'>Title</td>
											<td colspan="3" class="edittitle">
												<input type="text" v-model="title" ref="title" placeholder="문의 제목을 입력하세요">
												<p class="beforeedit-data" colspan="3">{{vo.title}}</p>
											</td>
										</tr>
										<tr>
											<td id='tour-table'>Content</td>
											<td colspan="3" class="editcontent">
												<textarea rows="10" cols="70" v-model="content" ref="content" placeholder="수정할 문의 내용을 작성하세요"></textarea>
												<p class="beforeedit-data" colspan="4">{{vo.content}}</p>
											</td>
										</tr>
									</thead>
								</table>
								<!--================ 수정 네비게이션 시작 =================-->
									<div class="post_navigation_area">
										<div class="nav_container">
											<ul class="nav nav-tabs" id="myTab" role="tablist">
												<li class="nav-item">
													<input type="button" value="수정" v-on:click="qnaEdit()">
												</li>
												<li class="nav-item">
													<input type="button" value="돌아가기" onclick="javascript:history.back()">
												</li>
											</ul>
										</div>
									</div>
								<!--================ 수정 네비게이션 끝 =================-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- partial -->
<script>
/* new Vue({
   	el:'.edittable',
   	data:{
   		vo:{},
   	},
   	mounted:function(){
   		let _this=this;
   		
   		axios.get("http://15.165.108.114/post/news_detail.do",{
   			params:{
   				n_no:_this.n_no,
   			}
   		}).then(function(result){
   			console.log(result.data)
   			_this.vo=result.data;
   			
   		})
   	}
}), */
new Vue({
   	el:'.app',
   	data:{
   		title:'',
   		content:'',
   		vo:{},
   		q_no:${q_no},
   		res:''
   	},
   	mounted:function(){
   		let _this=this;
   		axios.get("http://15.165.108.114/post/qna_edit.do",{
   			params:{
   				q_no:_this.q_no
   			}
   		}).then(function(result){
   			console.log(result.data);
   			_this.vo=result.data;
   		})
   	},
   	methods:{
   		qnaEdit:function(){
   			if(this.content.trim()=="")
   			{
   				this.$refs.content.focus();
   				return;
   			}
   			if(this.title.trim()=="")
   			{
   				this.$refs.title.focus();
   				return;
   			}
   			let _this=this;
   			axios.get("http://15.165.108.114/post/qna_edit_vue.do",{
   				params:{
   					q_no:_this.q_no,
   					title:_this.title,
   					content:_this.content
   				}
   			}).then(function(result){
   				alert("수정 완료");
   				_this.res=result.data;
   				location.href="../post/qna_detail.do?q_no="+_this.q_no;
   			})
	   }
   	}
})
</script>
</body>
</html>

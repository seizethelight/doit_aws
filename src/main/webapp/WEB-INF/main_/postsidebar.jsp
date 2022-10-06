<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class='sidebar'>
		<ul class='sidebar-nav'>
			<!-- <li>
				<button>
					<span><a href="../post/post.do">Dashboard</a></span> <i
						class='fas fa-home'></i>
				</button>
			</li> -->
			<li>
				<button id='tour-elements'>
					<span><a href="../post/news.do">News</a></span> <i
						class='fas fa-cloud'></i>
				</button>
			</li>
			<!-- <li>
				<button>
					<span><a href="../post/blog.do">Blog</a></span> <i
						class='fas fa-book'></i>
				</button>
			</li> -->
			<li>
				<button>
					<span><a href="../post/forum.do">Forum</a></span> <i
						class='fas fa-car'></i>
				</button>
			</li>
			<li>
				<button>
					<span><a href="../post/qna.do">QnA</a></span> <i
						class='fas fa-cloud'></i>
				</button>
			</li>
			<c:if test="${sessionScope.id!=null }">
				<!-- <li class='cta'>
					<button class='primary' id='tour-action'>My Post</button>
				</li> -->
				<li class='cta'>
					<button class='primary' id='start-tour'
						onclick="location.href='../post/forum_insert.do'">Start New Forum</button>
				</li>
				<li class='cta'>
					<button class='primary' id='start-tour' onclick="location.href='../post/news_insert.do'">
						Start New News
					</button>
				</li>			
				<li class='cta'>
					<button class='primary' id='start-tour' onclick="location.href='../post/qna_insert.do'">
						Start New QnA
					</button>
				</li>			
			</c:if>
		</ul>
	</div>
</body>
</html>
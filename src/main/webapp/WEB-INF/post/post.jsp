<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CodePen - Tour Bus</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'>
<link rel="stylesheet" href='${path}/resources/css/poststyle.css'>
<style>
</style>
</head>
<body>
	<!-- partial:index.partial.html -->
	<div class='app'>
		<div class='body'>
			<div class='main'>
				<div class='main__content'>
					<h1 class='h1 title'>
						<i class='fas fa-home'></i> <span>Dashboard</span>
					</h1>
					<div class='dashcards'>
						<div class='col'>
							<div class='dashboard-card'>
								<i class='fas fa-home'></i>
								<h5 class='card__subtitle'>Subtitle</h5>
								<h2 class='card__title'>Title</h2>
								<p class='card__extra'>Simple Information</p>
							</div>
						</div>
						<div class='col'>
							<div class='dashboard-card'>
								<i class='fas fa-home'></i>
								<h5 class='card__subtitle'>Subtitle</h5>
								<h2 class='card__title'>Title</h2>
								<p class='card__extra'>Simple Information</p>
							</div>
						</div>
						<div class='col'>
							<div class='dashboard-card' id='tour-card'>
								<i class='fas fa-home'></i>
								<h5 class='card__subtitle'>Subtitle</h5>
								<h2 class='card__title'>Title</h2>
								<p class='card__extra'>Simple Information</p>
							</div>
						</div>
					</div>
					<div class='table-card'>
						<h2>뉴스 인기순</h2>
						<table class='table'>
							<thead>
								<tr>
									<td id='tour-table'>Name</td>
									<td>Email</td>
									<td>Username</td>
									<td>Status</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Test</td>
									<td>Test</td>
									<td>Test</td>
									<td>Test</td>
								</tr>
								<tr>
									<td>Test</td>
									<td>Test</td>
									<td>Test</td>
									<td>Test</td>
								</tr>
								<tr>
									<td>Test</td>
									<td>Test</td>
									<td>Test</td>
									<td>Test</td>
								</tr>
								<tr>
									<td>Test</td>
									<td>Test</td>
									<td>Test</td>
									<td>Test</td>
								</tr>
								<tr>
									<td>Test</td>
									<td>Test</td>
									<td>Test</td>
									<td>Test</td>
								</tr>
								<tr>
									<td>Test</td>
									<td>Test</td>
									<td>Test</td>
									<td>Test</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- partial -->
	<script>
		
	</script>
</body>
</html>

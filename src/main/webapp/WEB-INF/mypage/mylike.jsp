<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href='${path}/resources/css/mylike_style.css'>

<style>
h1,h2,h3,h4,h5,h6 {
	font-family: 'Noto Sans KR', sans-serif !important;
}
</style>
</head>

<body>
<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>MY LIKE</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Doit!</a></li>
              <li class="breadcrumb-item active" aria-current="page">LIKE LIST</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>

	<section>
  <h3>GYM</h3><br>
     <div class="row">
       <c:forEach var="vo" items="${list }">
        
         <div class="thumbnail">
         
	        <a class="card" href="../gym/gym_detail.do?g_no=${vo.g_no }" style="width:300px;height:300px;margin: 0px 60px 45px 40px;">
	            <p class="card-category" style="font-size: 17px;color: black;font-weight: bold;">${vo.store }</p>
	            <h3 class="card-title" style="font-size: 29px;"><fmt:formatNumber value="${vo.price}" pattern="#,###"/>원</h3>
	            
	            <div class="card-img-cont">
	            <img src="${vo.poster }"
	                alt="" class="card-img">
	            </div>  
	     
	         </a>
	   </div>
	  
	 </c:forEach> 
	</div>
</section>
</body>
</html>
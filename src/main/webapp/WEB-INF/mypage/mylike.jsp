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
	<section>
  <h2 class="section-title" style="margin-top: 20px">나의 좋아요 내역</h2>
  <h3>GYM</h3><br>
     <div class="row">
       <c:forEach var="vo" items="${list }">
        
         <div class="thumbnail">
         
	        <a class="card" href="../gym/gym_detail.do?g_no=${vo.g_no }" style="width:300px;height:300px;margin: 0px 40px 40px 0px;">
	            <p class="card-category" style="font-size: 17px;color: black;font-weight: bold;">${vo.store }</p>
	            <h3 class="card-title"><fmt:formatNumber value="${vo.price}" pattern="#,###"/>원</h3>
	            
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
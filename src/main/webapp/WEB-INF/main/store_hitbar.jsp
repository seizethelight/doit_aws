<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- ================ top product area start ================= -->
<section class="related-product-area">
	<div style="margin-top: 50px;"></div>		
	  <c:forEach var="vo" items="${list }">   
		<div class="container">
			<div class="section-intro pb-60px">
		        <p>가장 많은 사랑을 받은 잇! 아이템</p>
		        <h2>Top <span class="section-intro__style">Product</span></h2>
		     </div>
				<div class="row mt-30">
		       		 <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
		          		<div class="single-search-product-wrapper">
		           			 <div class="single-search-product d-flex">
		              			<a href="#">
		              				<img src="${vo.poster }" ></a>
		              				<div class="desc">
		                 				 <a href="#" class="title">${vo.name }</a>
		                  				<div class="price">${vo.first_price }</div>
		            				 </div>
		         			  </div>
          				</div>
       				 </div>
    		  </div>
		</div>
	</c:forEach>
</section>
	<!-- ================ top product area end ================= -->	
</body>
</html>
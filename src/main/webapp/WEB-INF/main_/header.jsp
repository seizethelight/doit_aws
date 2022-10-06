<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Gutim Template">
    <meta name="keywords" content="Gutim, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>DoIt Header</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">
 
    <!-- Css Styles -->
    <link rel="stylesheet" href="${path }/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/ss/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/style.css"/>
    <link rel="stylesheet" href="${path}/resources/css/dropdown/style.css"/>
</head>
<body>
    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="container">
            <div class="logo">
                <a href="../main/main.do">
                    <img src="${path}/resources/img/logo.png" alt="" style="width:82px; height:24px">
                </a>
            </div>
            <div class="nav-menu">
                <nav class="mainmenu mobile-menu">
					<ul>
						<li class="active"><a href="../main/main.do">Home</a></li>
						<li><a href="../gym/gym_list.do">Gym</a></li>
						<li class="dropdown">
							 <a href="../doex/howtoex_list.do">Exercise</a>
							 <ul class="dropdown-menu">
							 	<li><a href="../doex/howtoex_list.do">운동정보</a></li>
							 	<li><a href="../doex/foodkcal_list.do">음식칼로리</a></li>
							 	<li><a href="../doex/exkcal_list.do">운동칼로리</a></li>
							 	<li><a href="../doex/howtoex_find.do">검색</a></li>
							 	<li><a href="../doex/bmi_cal.do">BMI지수</a></li>
							 								 
							 </ul>
							</li>
						
						<li><a href="../post/news.do">Post</a></li>
						<li><a href="../store/list.do">Store</a><li>
						<c:if test="${sessionScope.id!=null }">
							<li class="dropdown">
							 <a href="#">MyPage</a>
							 <ul class="dropdown-menu">
							 	<li><a href="../mypage/myinfo.do">내 정보</a></li>
							 	<li><a href="../mypage/payment.do">구매내역</a></li>
							 	<li><a href="../cart/cart_list.do">장바구니내역</a></li>
							 	<li><a href="../mypage/mylike.do">좋아요내역</a></li>
							 </ul>
							</li>
						    <c:if test="${sessionScope.admin=='admin' }">
								<li class="dropdown">
						    	 <a href="#">Admin</a>
						    	 <ul class="dropdown-menu">
						    	  <li><a href="../admin/userinfo.do">회원정보 관리</a></li>
						    	 </ul>
						    	</li>
							</c:if>
						</c:if>
				   </ul>
				</nav>
                <c:if test="${sessionScope.id!=null }">
					<a href="../member/logout.do" class="primary-btn signup-btn">logout</a>
				</c:if>
				<c:if test="${sessionScope.id==null }">
					<a href="../member/login.do" class="primary-btn signup-btn">login</a>
				</c:if>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->
    
</body>
</html>
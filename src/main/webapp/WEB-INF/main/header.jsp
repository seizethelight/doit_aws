<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>DoIt</title>
<link rel="icon" href="${path}/resources/img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="${path}/resources/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${path}/resources/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="${path}/resources/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="${path}/resources/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="${path}/resources/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="${path}/resources/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="${path}/resources/css/style.css">
<link rel="stylesheet" href="${path}/resources/css/post/poststyle.css" type="text/css"/>
</head>
<body>
<!--================ Start Header Menu Area =================-->
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="../main/main.do"><img style="width : 100px;" src="${path}/resources/img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item active"><a class="nav-link" href="../gym/gym_list.do">Gym</a></li>
              
              <li class="nav-item submenu dropdown">
                <a href="../store/list.do" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Shop</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="../store/list.do">Shop Category</a></li>
                  <li class="nav-item"><a class="nav-link" href="../cart/cart_list.do">Shopping Cart</a></li>
                </ul>
							</li>
              
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Post</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="../post/forum.do">Forum</a></li>
                  <li class="nav-item"><a class="nav-link" href="../post/blog.do">Blog</a></li>
                  <li class="nav-item"><a class="nav-link" href="../post/news.do">News</a></li>
                  <li class="nav-item"><a class="nav-link" href="../post/qna.do">QnA</a></li>
                  
                </ul>
							</li>
			
			<li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Exercise</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="../doex/howtoex_list.do">운동정보</a></li>
                  <li class="nav-item"><a class="nav-link" href="../doex/foodkcal_list.do">음식칼로리</a></li>
                  <li class="nav-item"><a class="nav-link" href="../doex/exkcal_list.do">운동칼로리</a></li>
                  <li class="nav-item"><a class="nav-link" href="../doex/howtoex_find.do">검색</a></li>
                  <li class="nav-item"><a class="nav-link" href="../doex/exkcal_list.do">운동칼로리</a></li>
                  <li class="nav-item"><a class="nav-link" href="../doex/bmi_cal.do">BMI지수</a></li>
                  
                </ul>
              </li>
			 
							
				<c:if test="${sessionScope.id!=null }">	
				<li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">MyPage</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="../mypage/myinfo.do">내 정보</a></li>
                  <li class="nav-item"><a class="nav-link" href="../mypage/payment.do">구매내역</a></li>
                  <li class="nav-item"><a class="nav-link" href="../cart/cart_list.do">장바구니내역</a></li>
                  <li class="nav-item"><a class="nav-link" href="../mypage/mylike.do">좋아요내역</a></li>
                </ul>
              </li>
			  <c:if test="${sessionScope.admin=='admin'}">	
			   <li class="nav-item submenu dropdown">
               <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Admin</a>
               <ul class="dropdown-menu">
                <li class="nav-item"><a class="nav-link" href="../admin/userinfo.do">회원정보 관리</a></li>
               </ul>
              </li>
              </c:if>
              </c:if>
              
               <li class="nav-item"><a class="nav-link" href="../chat/chat.do">Chat</a></li>
            </ul>

           <ul class="nav-shop">
           	<!-- <li class="nav-item"><button><i class="ti-search"></i></button></li> -->
              <c:if test="${sessionScope.id!=null }">
              <li class="nav-item">
              	<button><a href="../cart/cart_list.do">
              		<i class="ti-shopping-cart"></i><span class="nav-shop__circle">3</span>
              		</a>
              	</button> 
              </li>
              	<li class="nav-item"><a class="button button-header" href="../member/logout.do">Logout</a></li>
						  </c:if>
						  
						  <c:if test="${sessionScope.id==null }">
								<li class="nav-item"><a class="button button-header" href="../member/login.do">Login</a></li>
						  </c:if>            
					  </ul>

          </div>
        </div>
      </nav>
    </div>
  </header>
	<!--================ End Header Menu Area =================-->
</body>
</html>
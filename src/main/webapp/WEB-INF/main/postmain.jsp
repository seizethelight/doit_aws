<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoIt Post Main</title>
    <meta charset="UTF-8">
    <meta name="description" content="Gutim Template">
    <meta name="keywords" content="Gutim, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>postmain</title>

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap">
      
		<!-- Css Styles -->
    <link rel="stylesheet" href="${path}/resources/css/post/poststyle.css" type="text/css"/>
    <link rel="stylesheet" href="${path }/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/style.css" type="text/css"/> 
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
   	
   

</head>
<body>
	<tiles:insertAttribute name="header" />
	<!-- ================ start banner area ================= -->	
  <section class="blog-banner-area" id="blog">
    <div class="container h-100">
      <div class="blog-banner">
        <div class="text-center">
          <h1>Our Journal</h1>
          <nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Blog/QnA/News</li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </section>
  <!-- ================ end banner area ================= -->
		<section class="blog_area single-post-area py-80px section-margin--small" style="margin-top:0px;">
			<div class="container">
					<div class="row">
						<div class="col-lg-8 posts-list">
							<tiles:insertAttribute name="content" />
						</div>
						<div class="col-lg-4">
							<tiles:insertAttribute name="postsidebar" />
						</div>
					</div>
				</div>
			</section>
	<tiles:insertAttribute name="footer" />
	
</body>
</html>
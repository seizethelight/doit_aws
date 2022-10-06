<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DoIt Main</title>

    <meta charset="UTF-8">
    <meta name="description" content="Gutim Template">
    <meta name="keywords" content="Gutim, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>main</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">
 
    <!-- Css Styles -->
    <link rel="stylesheet" href="${path }/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${path }/resources/css/slicknav.min.css" type="text/css">
    <link href="${path}/resources/css/style.css" rel="stylesheet"/>
</head>
<body>
	<tiles:insertAttribute name="header" ignore="true"/>
	<tiles:insertAttribute name="content" ignore="true"/>
	<tiles:insertAttribute name="footer" ignore="true"/>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path }/resources/css/admin/userinfo.css" type="text/css">
<link rel="stylesheet" href="css/admin_community.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(function(){
	$(".admin").change(function(){
		let myadmin = $(this).val();
		let myid = $(this).attr("data-id");
		$.ajax({
			type:'post',
			url:'../admin/userinfo_ok.do',
			data:{"id":myid, "admin":myadmin},
			success:function(result){
				alert("회원수정 완료")
				location.href="../admin/userinfo.do"								
			}
		})
	})
})
</script>
<style>
body{
	padding:0px;
}
main {
    font-size: 0.5em;
    margin-bottom: 15px;
}
#wrapper{
	margin-top: 100px;
	width: 100%;
	margin-left:auto;
	margin-right:auto;
}
#keywords thead tr th {
    background-color: black;
}
.pagination li a {
    transition: all 100ms ease-in-out 0s;
    background-color: #FFFFFF;
    border-radius: 5px 5px 5px 5px;
    color: #69696E;
    display: block;
    height: 30px;
    margin: 0 3px;
    overflow: hidden;
    position: relative;
    text-align: center;
    text-decoration: none;
    width: 30px;
}
.pagination li a:hover {
    background-color: #F34100;
    color: #FFFFFF;
}
.pagination li.active a {
    background-color: #F34100;
    color: #FFFFFF;
}
.pagination li.active a:hover {
    color: #F34100;
}
input[type="button"],input[type="submit"] {
	box-sizing: border-box;
	width: 120px;
	height: 32px;
}
input[type="button"]{
	background-color: #f67831;
	border: 2px solid transparent;
}
input[type="button"]:hover{
	background-color: #ffffff;
	border: 2px solid #f67831;
	color: black;
}
input[type="submit"] {
	background-color: #eb3c5a;
	border: 2px solid transparent;
}
input[type="submit"]:hover {
 	background-color: #ffffff;
	border: 2px solid #eb3c5a;
	color: black;
}
</style>
</head>
<body>
	<main class="main">
	  <form method="post" action="../admin/userinfo_ok.do">
		<div id="wrapper">
			<table id="keywords" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th><span>id</span></th>
						<th><span>admin</span></th>
						<th><span>name</span></th>
						<th><span>sex</span></th>
						<th><span>birth</span></th>
						<th><span>phone</span></th>
						<th><span>email</span></th>
						<th><span>zipcode</span></th>
						<th><span>addr1</span></th>
						<th><span>addr2</span></th>
						<th><span>joindate</span></th>
					</tr>
				</thead>
				<c:forEach var="vo" items="${list }">
					<tbody>
						<tr>
							<td>${vo.id }</td>
							<td>
							<select id="admin" name="admin" class="admin" data-id="${vo.id }">
							 <option ${vo.admin=='admin'?'selected':'' }>admin</option>
							 <option ${vo.admin=='user'?'selected':'' }>user</option>
							</select>
							</td>
							<td>${vo.name }</td>
							<td>${vo.sex }</td>
							<td>${vo.birth }</td>
							<td>${vo.phone }</td>
							<td>${vo.email }</td>
							<td>${vo.zipcode }</td>
							<td>${vo.addr1 }</td>
							<td>${vo.addr2 }</td>
							<td>${vo.joindate }</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<p class="text-center">
            <a href="../main/main.do"><input type=button value="메인 이동" class="btn btn-sm btn-primary"></a>
            </p>
		</div>
	  </form>
	</main>
</body>
</html>
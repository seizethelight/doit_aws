<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodePen - Login Form</title>
<script src="https://unpkg.com/vue"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/member/login.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#logBtn').click(function(){
		let id=$('#id').val();
		if(id.trim()==="")
		{
			$('#id').focus();
			return;
		}
		let pwd=$('#pw').val();
		if(pwd.trim()==="")
		{
			$('#pw').focus();
			return;
		}
		let ck=$("#ck").is(":checked");
		$.ajax({
			type:'post',
			url:'../member/login_ok.do',
			data:{"id":id,"pw":pwd,"ck":ck},
			success:function(result)
			{
				let res=result.trim();
				if(res==='NOID')
			    {
					alert("ID가 존재하지 않습니다");
					$('#id').val("");
					$('#pw').val("");
					$('#id').focus();
			    }
				else if(res==='NOPW')
			    {
					alert("비밀번호가 틀립니다")
					$('#pw').val("");
					$('#pw').focus();
			    }
				else
			    {
					alert("로그인성공. 환영합니다")
					location.href="../main/main.do"; 			    
			    }
			}
		})
	})
})
</script>
</head>
<body>
<!-- partial:index.partial.html -->
<body>
	<div class="login">
		<div class="login-screen">
			<div class="app-title"><h3>Login</h3></div>

			<div class="login-form">
				<div class="control-group">
				<input type="text" class="login-field" name="id" placeholder="ID" id="id" value="${id }">
				</div>

				<div class="control-group">
				<input type="password" class="login-field" name="pw" placeholder="Password" id="pw">
				</div>
				
				<label><input type=checkbox id="ck" value="아이디저장" style="width:15px;">아이디저장</label>

				<input type="button" class="logBtn" value="login" id="logBtn">
				<a class="login-link" href="../member/join.do">Not a member? <span>sign up</span></a>
			</div>
		</div>
	</div>
</body>
<!-- partial -->
  
</body>
</html>
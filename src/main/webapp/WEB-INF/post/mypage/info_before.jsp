<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.infore_before{
	margin-top: 50px;
}
.button{
	display: flex;
}
input[type="button"]{
  	background-color: #f67831;
  	border: 2px solid transparent;
  	color: white;
  	width: 40%;
  }
input[type="button"]:hover{
  	background-color: #ffffff;
  	border: 2px solid #f67831;
  	color: black;
  }
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="${path }/resources/css/member/login.css" type="text/css">
</head>
<body>
  <div class="login">
   <div id="info_before">
   <div class="login-screen">
			<div class="app-title"><h3>Password입력</h3></div>
			<div class="login-form">
				<div class="control-group">
				<input type="password" class="login-field" name="pw" ref=pw placeholder="Password" id="pw" v-model="pw">
				</div>
				<div class="button">
				<input type=button value="확인" class="logBtn" v-on:click="ok()">
            	<input type=button value="취소" class="logBtn" onclick="javascript:history.back()">
				</div>
			</div>
		</div>
    </div>
  </div>
  <script>
    new Vue({
    	el:'#info_before',
    	data:{
    		pw:''
    	},
    	methods:{
    		ok:function(){
    			if(this.pw==="")
    			{
    				this.$refs.pw.focus();//$('#id명').focus()
    				return;
    			}
    			
    			// 비밀번호 입력
    			let _this=this;
    			//axios.post() axios.get()
    			axios.get('http://localhost:8080/web/mypage/info_before_ok.do',{
    				params:{
    					pw:this.pw
    				}
    			}).then(function(result){
    				let res=result.data;
    				if(res==='yes')
    				{
    					location.href="../mypage/info_update.do";
    				}
    				else
    				{
    					alert("비밀번호가 틀립니다");
    					_this.pw="";
    					_this.$refs.pw.focus();
    				}
    			})
    		}
    	}
    })
  </script>
</body>
</html>








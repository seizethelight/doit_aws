<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <style type="text/css">
  .myinfo {
  	margin-top: 100px;
  	margin-bottom: 50px;
  }
  .row{
  	margin-top: 20px;
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
  #dialog{
  	width: auto;
  	height: auto;
  }
  </style>
</head>
<body>
  <div class="container">
   <div class="myinfo">
    <h3 class="text-center">My information</h3>
    <div class="row">
      <table class="table">
        <tr>
          <th width=10% class="warning text-right">ID</th>
          <td width=90%>{{vo.id}}</td>
        </tr>
        <tr>
          <th width=10% class="warning text-right">이름</th>
          <td width=90%>{{vo.name}}</td>
        </tr>
        <tr>
          <th width=10% class="warning text-right">성별</th>
          <td width=90%>{{vo.sex}}</td>
        </tr>
        <tr>
          <th width=20% class="warning text-right">생년월일</th>
          <td width=90%>{{vo.birth}}</td>
        </tr>
        <tr>
          <th width=10% class="warning text-right">이메일</th>
          <td width=90%>{{vo.email}}</td>
        </tr>
        <tr>
          <th width=10% class="warning text-right">우편번호</th>
          <td width=90%>{{vo.zipcode}}</td>
        </tr>
        <tr>
          <th width=10% class="warning text-right">주소</th>
          <td width=90%>{{vo.addr1}}</td>
        </tr>
        <tr>
          <th width=10% class="warning text-right">상세주소</th>
          <td width=90%>{{vo.addr2}}</td>
        </tr>
        <tr>
          <th width=10% class="warning text-right">전화번호</th>
          <td width=90%>{{vo.phone}}</td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
            <a href="../mypage/info_before.do"><input type=button value="회원수정" class="btn btn-sm btn-primary"></a>
            <input type=button value="취소" class="btn btn-sm btn-primary"
              onclick="javascript:history.back()">
          </td>
        </tr>
      </table>
    </div>
    </div>
  </div>
  <script>
  new Vue({
  	el: '.myinfo',
  	data:{
  		vo:{}
  	},
  	mounted:function(){
  		let _this=this;
  		axios.get("http://localhost:8080/web/mypage/myinfo_vue.do"
  		).then(function(result){
  			console.log(result);
  			_this.vo=result.data;
  		})
  	}
  	
  })
  </script>
</body>
</html>

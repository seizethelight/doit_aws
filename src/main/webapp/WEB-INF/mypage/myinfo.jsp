<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Register</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="../resources/css/style.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
  .button-ck{
  	margin-top: 7px;
  	padding: 0px;
  	border-radius: 15px;
  	font-size: 10px;
  	height: 2rem;
  	width: 100px;
  }
  .button-ck:hover{
  	border: 1px solid #384aeb;
  }
  .red{
  	background-color: #c5322d;
  	color: white;
  	border: 1px solid #c5322d;
  }
  .red:hover{
  	border: 1px solid #c5322d;
  }
  .login_form_inner h3 {
  	margin-bottom: 40px;
  }
  </style>
  <script type="text/javascript">
  $(function(){
	  $('#DelBtn').click(function(){
		  alert("회원탈퇴 완료")
	  })
  })
  </script>
</head>
<body>
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Mypage</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Mypage</a></li>
							<li class="breadcrumb-item active" aria-current="page">MyInfo</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->

	<!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
		<div class="myinfo">
			<div class="row">
				<div class="col-lg-12" style="text-align: center;">
					<div class="login_form_inner register_form_inner">
						<h3>Your Information</h3>
						<form class="row login_form" id="register_form">
							<table class="table">
								<tr>
									<th width=30% class="warning text-right">ID</th>
									<td width=70%>{{vo.id}}</td>
								</tr>
								<tr>
									<th width=30% class="warning text-right">이름</th>
									<td width=70%>{{vo.name}}</td>
								</tr>
								<tr>
									<th width=30% class="warning text-right">성별</th>
									<td width=70%>{{vo.sex}}</td>
								</tr>
								<tr>
									<th width=30% class="warning text-right">생년월일</th>
									<td width=70%>{{vo.birth}}</td>
								</tr>
								<tr>
									<th width=30% class="warning text-right">이메일</th>
									<td width=70%>{{vo.email}}</td>
								</tr>
								<tr>
									<th width=30% class="warning text-right">우편번호</th>
									<td width=70%>{{vo.zipcode}}</td>
								</tr>
								<tr>
									<th width=30% class="warning text-right">주소</th>
									<td width=70%>{{vo.addr1}}</td>
								</tr>
								<tr>
									<th width=30% class="warning text-right">상세주소</th>
									<td width=70%>{{vo.addr2}}</td>
								</tr>
								<tr>
									<th width=30% class="warning text-right">전화번호</th>
									<td width=70%>{{vo.phone}}</td>
								</tr>
								<tr>
									<td colspan="2" class="text-center">
									 <a href="../mypage/info_delete_ok.do">
										<input type=button value="회원탈퇴" class="button button-ck red" id="DelBtn">
								     </a> 
									 <a href="../mypage/info_update.do">
										<input type=button value="회원수정" class="button button-ck">
								     </a> 
										<input type=button value="취소" class="button button-ck"
										onclick="javascript:history.back()">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->

	<script src="vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="vendors/skrollr.min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="vendors/jquery.ajaxchimp.min.js"></script>
	<script src="vendors/mail-script.js"></script>
	<script src="js/main.js"></script>
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
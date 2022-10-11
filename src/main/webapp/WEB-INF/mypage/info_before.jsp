<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Login</title>
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
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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
  .login_form_inner{
  	padding-top: 20px;
  }
  .form-control {
  	border: none;
  	border-bottom: 1px solid #ced4da;
  	border-radius: 0px;
  }
  .form-control:focus {
  	border: none;
  	border-bottom: 1px solid #ced4da;
  	border-radius: 0px;
  }
  </style>
</head>
<body>
  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
		  <div id="info_before">
			<div class="row">
				<div class="col-lg-6" style="margin: 0px auto;">
					<div class="login_form_inner">
						<h3>Input Password</h3>
							<div class="col-md-12 form-group">
							  <input type="password" class="form-control" name="pw" ref=pw placeholder="Password" id="pw" v-model="pw">
							</div>
							<div class="col-md-12 form-group">
							  <input type=button value="확인" class="button button-ck red" v-on:click="ok()">
							  <input type=button value="취소" class="button button-ck" onclick="javascript:history.back()">
							</div>
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
    					location.href="../mypage/myinfo.do";
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
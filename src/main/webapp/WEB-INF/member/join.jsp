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
  <script>
  $(function(){
	$('#okid').hide();
    //$( "#dialog" ).dialog();
    $('#idcheck').click(function(){
    	$( "#dialog" ).dialog({
    		autoOpen:false,
    		width:420,
    		height:250,
    		modal:true,
    		background: '#fff'
    	}).dialog("open");
    })
    
    $('#okBtn').click(function(){
    	$('#myid').val($('#id').val())
    	$('#dialog').dialog("close");
    })
    
    $('#postBtn').click(function(){
    	new daum.Postcode({
			oncomplete:function(data)
			{
				$('#post').val(data.zonecode)
				$('#addr1').val(data.address)
			}
		}).open()
    })
    
    $('#idBtn').on("click",function(){
    	let id=$('#id').val();
    	if(id.trim()==="")
    	{
    		$('#id').focus(); // 태그 $('.클래스'), $('#아이디') , $('태그명')
    		//  $refs.ref명 ==> vuejs,react
    		// node => 서버측 사이드 (Spring)
    		// app.get('../a.do',function(request,response){처리})
    		return;
    	}
    	
    	// 스프링서버로 전송 
    	/*
    	    axios.get(url,{params:{}}).then()
    	    axios.post(url,)
    	*/
    	$.ajax({
    		type:'post',
    		url:'../member/idcheck.do',
    		data:{"id":id},
    		success:function(result)
    		{
    			let res=result.trim();
    			if(res==='YES')
    			{
    				let msg='<span style="color:blue">'+id+'는(은) 사용 가능합니다</span>';
    				$('#result').html(msg)
    				$('#okid').show()
    			}
    			else
    			{
    				let msg='<span style="color:red">'+id+'는(은) 사용중인 아이디입니다</span>';
    				$('#result').html(msg)
    			}
    		}
    	})
    	
    })
  });
  </script>
  <style type="text/css">
  .button-ck{
  	margin-top: 7px;
  	padding: 0px;
  	border-radius: 15px;
  	font-size: 10px;
  	height: 2rem;
  	width: 100%;
  }
  .button-ck:hover{
  	border: 1px solid #384aeb;
  }
  input[type="radio"] {
    margin-left: 10px;
    margin-right: 5px;
  }
  .sexCk{
  	margin-top: 0.7rem;
  }
  .register_form_inner{
  	padding-top: 50px;
  	height: 600px;
  	overflow: scroll;
  }
  .login_box_area .login_box_img:before{
    height: 600px;
  }
  input[type="text"]:read-only{
  	background-color: white;
  }
  </style>
</head>
<body>
  <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Register</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Register</li>
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
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>Already have an account?</h4>
							<p>There are advances being made in science and technology everyday, and a good example of this is the</p>
							<a class="button button-account" href="login.html">Login Now</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3>Create an account</h3>
						<form class="row login_form" method="post" action="../member/join_ok.do" id="register_form" >
							<div class="col-md-9 form-group">
								<input type="text" class="form-control" id="myid" name="id" placeholder="UserID" readonly onblur="this.placeholder = 'UserID'">
							</div>
								<input type="button" class="col-md-2 button button-ck" id="idcheck" name="idcheck" value="중복체크">
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="pw" name="pw" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
              				</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="name" name="name" placeholder="Username" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'">
              				</div>
							<div class="col-md-6 form-group">
								<input type=date name="birth" size=20 style="text-align: left">
							</div>
							<span class="sexCk">
								<label><input type=radio name="sex" value="남자" checked="checked">남자&nbsp;</label>
								<label><input type=radio name="sex" value="여자">여자</label>
							</span>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="email" name="email" placeholder="Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email'">
              				</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone'">
              				</div>
              				<div class="col-md-9 form-group">
								<input type="text" class="form-control" id="post" name="zipcode" placeholder="Zipcode" readonly onblur="this.placeholder = 'Zipcode'">
							</div>
								<input type="button" class="col-md-2 button button-ck" id="postBtn" value="우편검색">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="addr1" name="addr1" placeholder="Address1" readonly onblur="this.placeholder = 'Address1'">
              				</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="addr2" name="addr2" placeholder="Address2" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address2'">
              				</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="selector" checked>
									<label for="f-option2">Allow Doit to use your information</label>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-register w-100">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
	<div id="dialog" title="아이디중복체크" style="display:none">
      <table class="table">
        <tr>
          <td>
                       아이디:<input type=text name="id" size=15 class="input-sm" id="id">
                 <input type=button class="button button-ck" id="idBtn" value="아이디체크" style="width: 100px;">
          </td>
        </tr>
        <tr>
          <td class="text-center" id="result"></td>
        </tr>
        <tr id="okid">
          <td class="text-center">
            <input type=button class="button button-register" id="okBtn" value="확인">
          </td>
        </tr>
      </table>
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
</body>
</html>
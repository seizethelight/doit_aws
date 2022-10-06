<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>서울시민 건강포털</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 50px;
   text-align: center;
}
.row{
   margin: 0px auto;
   width:100%;
   text-align:center;
}
.text-center{
	text-align: center;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link type="text/css" href="https://health.seoulmc.or.kr/css/default.css" rel="stylesheet" />
<link type="text/css" href="https://health.seoulmc.or.kr/css/BITCommon.css" rel="stylesheet" />
<link type="text/css" href="https://health.seoulmc.or.kr/css/jquery.fileupload.css" rel="stylesheet" />
<link type="text/css" href="https://health.seoulmc.or.kr/css/jquery.fileupload-ui.css" rel="stylesheet" />
<link type="text/css" href="https://health.seoulmc.or.kr/css/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

<script  type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

</head>
<body>

<div class="container">
	<div style="height:100px"></div>
	
	<div class="pop-body">
	<h2><b>나의 체질량지수(BMI)</b></h2>
		<div class="message-box" >
		<h6>
			<span>체질량지수는 자신의 몸무게(kg)를 키의 제곱(m)으로 나눈 값입니다.<br />
			18.5 미만             : 저체중<br />
			18.5 이상 23 미만 : 정상<br />
			23 이상 25미만      : 과체중<br />
			25 이상                  : 비만<br />
			</span>
			</h6>
		</div>
       	<div class="form">
           	<form id="bmiCheckForm" name="bmiCheckForm">
				<label for="">신장</label>
				<input type="text" id="length" name="length"/><span>cm</span>
				<span class="dash">/</span>
				<label for="">체중</label>
				<input type="text" id="weight" name="weight"/><span>kg</span>
				<span class="compute">
			
					<input type="button" class="btn btn-lg btn-dark" id="btnCalc" value="계산" />
					<input type="reset" class="btn btn-lg btn-dark" value="초기화" />
				</span>
			</form>
			<dl class="clearfix" >
			<br>
				<dt><h5> </h5></dt>
				<dt><b><h5>비만도 결과</h5></b></dt>
				<h6 style="color: orange;"><dd id="resultText"></dd></h6>
				<dt><b><h5>BMI 지수</h5></b></dt>
				<h6 style="color: orange;"><dd id="bmiNumber"></dd></h6>
			</dl>
			<!-- <ul>
			<li>
				<label>BMI</label><label class="dv1">18.5</label><label class="dv2">23</label><label>25.00</label>
				<ul class="clearfix">
					<li class="low-weight">저체중</li>
					<li class="regular">정상</li>
					<li class="overweight">과체중</li>
					<li class="obesity">비만</li>
				</ul>
				<label>체중</label>
			</li>
			</ul> -->
           </div>
			</div>
</div>
<script type="text/javascript">
$().ready(function() {
	this.title = $(".pop-header h1").text();
	
	
	
	$("#btnCalc").click(function(){
		if($("#length").val()==""){
			alert("신장을 입력해주세요");
			return false;
		}
		if($("#weight").val()==""){
			alert("체중을 입력해주세요");
			return false;
		}
		var len = parseFloat($('#length').val())/100;
		var wet = parseFloat($('#weight').val());
		var result = parseFloat(wet)/parseFloat(len*len);
		var resultText = "";
		if(result<18.5){
			resultText = "저체중";
		} else if(result<23){
			resultText = "정상";
		} else if(result<25){
			resultText = "과체중";
		} else{
			resultText = "비만";
		}
		resultText += " 입니다.";
		
		$("#bmiNumber").text(result.toString().match(/^.*\.\d{2}/) || result);
		$("#resultText").text(resultText);
	});
	
	$(":reset").click(function(){
		$("#bmiNumber").text("");
		$("#resultText").text("");
	});
});
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout Form</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	 <%-- <link rel="stylesheet" href="${path }/resources/css/pay_style.css" type="text/css"> --%>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
					<!-- iamport.payment.js -->
					<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
					<script type="text/javascript">
					var IMP = window.IMP; // 생략 가능
					IMP.init("imp40678337"); // 예: imp00000000   imp12148244  imp40678337
					function requestPay() {
						console.log('clicked');
						
						// IMP.request_pay(param, callback) 결제창 호출
					  IMP.request_pay({ // param
					      pg: "html5_inicis", //.INIpayTest
					      pay_method: 'card',//결제수단 
					      merchant_uid:'merchant_' + new Date().getTime(),
					      name: 'doit 상품 결제',//결제창에 보여질 이름 
					      amount: ${sum+sum1},//가격 
					      buyer_email: "${vo.email}",
					      buyer_name: "${vo.name}",
					      buyer_tel: "${vo.phone}",
					      buyer_addr: "${vo.addr1}",
					      buyer_postcode: "${vo.zipcode}"
					  }, function (rsp) { // callback
					      if (rsp.success) {
					          // 결제 성공 시 로직,
					         
					      } else {
					          // 결제 실패 시 로직,
					    	  alert('결제에 성공하였습니다!');
					          location.href="../mypage/payment.do";
					      }
					  });
					}
					</script>

	<div class="col-md-5 container bg-default" style="margin-top: 100px; margin-bottom: 80px; width: 800px;border: 9px solid #dee2e6;
    padding: 30px;">
			
			<h4 class="my-4" style="font-weight: bold">
					결제하기
			</h4>
		<form action="../mypage/payment.do" method="post" id="frm" name="frm">	
			 <div class="column-labels" style="display: flex; font-weight: bold">
			    <label class="product-image" style="width: 80%">이미지</label>
			    <label class="product-details" style="width: 90%">상품명</label>
			    <label class="product-quantity" style="width: 80%">수량 / 개월</label>
			    <label class="product-price" style="width: 20%">가격</label>
			  </div>
			
			<div class="row" style="border-bottom: 1px solid #dee2e6; margin-bottom: 20px">
			  <tr>
	         <td>
	           <c:forEach var="gvo" items="${cList }">
	             <table class="table"style="boder: 2px solid black;">
	               <tr>
	                 <td width=28% rowspan="1" class="#">
	                   <img src="${gvo.poster }" style="width: 100px;height: 100px"></a>
	                 </td>
	                 <div class="noen" style="display: flex;">
	                 <td width=39%><h6>${gvo.name }</a>&nbsp;</h6></td>
	                 <td width=19%><h6>${gvo.account }</a>&nbsp;</h6></td>
	                 <td width=30%><h6 style="color: orange"><fmt:formatNumber value="${gvo.total }" pattern="#,###"/>원</a>&nbsp;</h6></td>
	               </div>
	               </tr>
	             </table> 
	           </c:forEach>
	         </td>
	        </tr>
	       </div>
	       <div class="row" style="margin-left: 570px">
	       <label class="product-line-price" style="width: 40%; font-weight: bold ">합계:&nbsp;
	       </label><span style="color: orange; font-weight: 600" ><fmt:formatNumber value="${sum+sum1}" pattern="#,###"/></span>원
			</div>
			<div style="border-bottom:2px solid #dee2e6;margin-bottom: 20px" ></div>
			
			
			<c:forEach var="vo" items="${list }">
				<div class="form-row">
					<div class="col-md-6 form-group">
						<label for="firstname" style="font-weight: bold;font-size: 16px;">주문자 이름</label>
						<input type="text" class="form-control" id="firstname" value="${vo.name }" placeholder="주문자명" style="max-width: 700px;">
						<div class="invalid-feedback">
						</div>
					</div>

				</div> 

				<div class="form-group">
					<label for="username" style="font-weight: bold;font-size: 16px;">전화번호</label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">tel</span>
							</div>	
							<input type="text" class="form-control" id="username"  value="${vo.phone }" placeholder="tel" required>
							<div class="invalid-feedback">
								Your username is required.
							</div>
						</div>
				</div>

				 <div class="form-group">
						<label for="email" style="font-weight: bold;font-size: 16px;">Email</label>
						<input type="email" class="form-control" id="email" value="${vo.email }" placeholder="you@example.com" required>
				</div> 

				<div class="form-group">
					<label for="adress" style="font-weight: bold;font-size: 16px;">주소</label>
					<input type="text" class="form-control" id="adress" value="${vo.addr1 }" placeholder="도로명주소" required>
					<div class="invalid-feedback">
						주소를 입력해주세요.
					</div>
				</div>

				<div class="form-group">
					<label for="address2" style="font-weight: bold;font-size: 16px;">상세 주소
						<!-- <span class="text-muted"></span> -->
					</label>
					<input type="text" class="form-control" id="adress2" value="${vo.addr2 }" placeholder="상세주소">
				</div>
				
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="shipping-adress" name="chkSelect" checked required> 
						결제정보 서비스를 위한 개인정보 수집 및 이용 약관에 동의합니다.
					<label for="shipping-adress" class="form-check-label"></label>
				</div>
				
				<h4 class="mb-4" style="margin-top: 20px">Payment</h4>
				
				<div class="form-check">
					<input type="radio" class="form-check-input" id="credit" name="payment-method" checked required>
					<label for="credit" class="form-check-label">아임포트 결제</label>
				</div>


				<div class="row mt-4"></div>
				<div class="form-row"></div> 

					<hr class="mb-4">
					<%-- <input type="hidden" name="no" value="${vo.no }"> --%>
					<input type="button" class="btn btn-primary bt-md btn-block" onclick="requestPay()" value="결제하기" id="payBtn">
					 <input type="button" class="btn btn-info bt-md btn-block" onclick="javascript:history.back()" value="취소">
					
			   </c:forEach>	
			</form>
		</div>
</body>
</html>
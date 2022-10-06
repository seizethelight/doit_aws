<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout Form</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	 <link rel="stylesheet" href="${path }/resources/css/pay_style.css" type="text/css">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
					<!-- iamport.payment.js -->
					<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
					<script type="text/javascript">
					var IMP = window.IMP; // 생략 가능
					IMP.init("imp68206770"); // 예: imp00000000   imp12148244
					function requestPay() {
						console.log('clicked');
						
						// IMP.request_pay(param, callback) 결제창 호출
					  IMP.request_pay({ // param
					      pg: "html5_inicis.MID-a",
					      pay_method: 'card',//결제수단 
					      merchant_uid: "1",//주문번호 
					      name: 'doit 상품 결제',//결제창에 보여질 이름 
					      amount: ${sum2},//가격 
					      buyer_email: "${vo.email}",
					      buyer_name: "${vo.name}",
					      buyer_tel: "${vo.phone}",
					      buyer_addr: "${vo.addr1}",
					      buyer_postcode: "${vo.zipcode}"
					  }, function (rsp) { // callback
					      if (rsp.success) {
					          // 결제 성공 시 로직,
					          alert('결제에 성공하였습니다!');
					    	  location.href="../mypage/payment.do";
				                
					      } else {
					          // 결제 실패 시 로직,
					    	  alert('결제에 실패하였습니다!');
					          location.href="../main/main.do";
					      }
					  });
					}
					</script>

	<div class="col-md-4 container bg-default" style="margin-top: 100px; margin-bottom: 80px; width: 800px;border: 5px solid #dee2e6;
    padding: 40px;">
			
			<h4 class="my-4" style="font-weight: bold">
					결제하기
			</h4>
			
			 <div class="column-labels" style="display: flex; font-weight: bold">
			    <label class="product-image" style="width: 80%">이미지</label>
			    <label class="product-details" style="width: 90%">상품명</label>
			    <label class="product-quantity" style="width: 80%">수량 / 개월</label>
			    <label class="product-price" style="width: 15%">가격</label>
			  </div>
			
			<div class="row" style="border-bottom: 1px solid #dee2e6; margin-bottom: 20px">
			  <tr>
	         <td>
	           <c:forEach var="gvo" items="${cList }">
	             <table class="table"style="boder: 2px solid black;">
	               <tr>
	                 <td width=30% rowspan="1" class="#">
	                   <img src="${gvo.poster }" style="width: 100px;height: 100px"></a>
	                 </td>
	                 <div class="noen" style="display: flex;">
	                 <td width=40%><h6>${gvo.name }</a>&nbsp;</h6></td>
	                 <td width=25%><h6>${gvo.account }</a>&nbsp;</h6></td>
	                 <td width=50%><h6 style="color: orange">${gvo.price }</a>&nbsp;</h6></td>
	               </div>
	               </tr>
	             </table> 
	           </c:forEach>
	         </td>
	        </tr>
	       </div>
	       <div class="row" style="margin-left: 580px">
	       <label class="product-line-price" style="width: 42%; font-weight: bold" >합계:&nbsp;
	       </label><span style="color: orange; font-weight: 600" >${sum2}</span>원
			</div>
			<div style="border-bottom:2px solid #dee2e6;margin-bottom: 20px" ></div>
			
			<form action="#" method="request">
			<c:forEach var="vo" items="${list }">
				<div class="form-row">
					<div class="col-md-6 form-group">
						<label for="firstname">주문자 이름</label>
						<input type="text" class="form-control" id="firstname" value="${vo.name }" placeholder="주문자명" style="max-width: 700px;">
						<div class="invalid-feedback">
						</div>
					</div>

				</div> 

				<div class="form-group">
					<label for="username">전화번호</label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">tel</span>
							</div>	
							<input type="text" class="form-control" id="username" value="${vo.phone }" placeholder="tel" required>
							<div class="invalid-feedback">
								Your username is required.
							</div>
						</div>
				</div>

				 <div class="form-group">
						<label for="email">Email</label>
						<input type="email" class="form-control" id="email" value="${vo.email }" placeholder="you@example.com" required>
				</div> 

				<div class="form-group">
					<label for="adress">주소</label>
					<input type="text" class="form-control" id="adress" value="${vo.addr1 }" placeholder="도로명주소" required>
					<div class="invalid-feedback">
						Please enter your shipping address.
					</div>
				</div>

				<div class="form-group">
					<label for="address2">상세 주소
						<!-- <span class="text-muted"></span> -->
					</label>
					<input type="text" class="form-control" id="adress2" value="${vo.addr2 }" placeholder="상세주소">
				</div>
				
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="shipping-adress"> 
						결제정보 서비스를 위한 개인정보 수집 및 이용 약관에 동의합니다.
					<label for="shipping-adress" class="form-check-label"></label>
				</div>
				
				<h4 class="mb-4" style="margin-top: 20px">Payment</h4>
				
				<div class="form-check">
					<input type="radio" class="form-check-input" id="credit" name="payment-method" checked required>
					<label for="credit" class="form-check-label">아임포트</label>
				</div>

				<div class="form-check">
					<input type="radio" class="form-check-input" id="debit" name="payment-method" required>
					<label for="debit" class="form-check-label">카카오 QR결제</label>
				</div>

				<div class="row mt-4"></div>
				<div class="form-row"></div> 

					<hr class="mb-4">
				
					<button class="btn btn-primary bt-md btn-block" type="button" onclick="requestPay()">결제하기</button>
					 <input type="button" class="btn btn-info bt-md btn-block" onclick="javascript:history.back()" value="취소">
					
			   </c:forEach>	
			</form>
		</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
 <link rel="stylesheet" href='${path}/resources/css/cartstyle.css'>

<!-- JS start -->


<style>
body{
	padding: 0px;
	
}
.shopping-cart{
	margin: -45px 150px 45px 150px;
}
h1{
	margin-left: 100px;
	font-weight: 600;
}
</style>
</head>

	<body style="margin-top: 130px;">
	<!-- partial:index.partial.html -->
	<h2 style="margin-left: 155px;margin-bottom: 25px;">장바구니</h2>
	 
	<div class="shopping-cart" >
	
	  <div class="column-labels">
	    <label class="product-image">이미지</label>
	    <label class="product-details">상품</label>
	    <label class="product-price">가격</label>
	    <label class="product-quantity">수량</label>
	  <!--   <label class="product-removal">취소</label> -->
	    <label class="product-line-price" >합계</label>
	  </div>
	  
	  <c:if test="${listsize==0 }">
	        <table class="table">
	          <tr style="height:500px">
	            <td class="text-center" style="vertical-align:middle">
	                <img src="http://1004towel.com/SG/img/cart_img_empty.gif" style="display: flex;margin-left: 600px;width: 500px;"><br>
						 <a href="../main/main.do"><button class="checkout" style="margin-right: 150px">메인으로 가기</button></a>             
	            </td>
	          </tr>
	        </table>
	      </c:if>
	<form action="../payment/pay_form.do" name="pay_frm" id="pay_frm" method="post">
	 <c:if test="${listsize!=0 }">
	  <h3 style="border-bottom: 7px solid #eee;margin-bottom: 29px;margin-top: 40px;">헬스장</h3>
	  <c:forEach var="vo" items="${list }">
	  <c:if test="${vo.cate==1 }">
	  <div class="product">
	    <div class="product-image">
	      <img src="${vo.poster}">
	    </div>
	    <div class="product-details">
	      <div class="product-title">${vo.name}</div>
	    </div>
	    <div class="product-quantity" data-price="${ vo.price}">${vo.price}</div>
	    <!-- <div class="product-quantity">
	      <input type="number" value="1" min="1">
	    </div> -->
	    <div class="product-quantity">&nbsp;${vo.account}</div> 
	    <%-- <div class="product-quantity">${gvo.account} 개월 </div>  --%>
	    <div class="product-removal">
	   
	     <a href="../cart/cart_cancel.do?no=${vo.no }"  style="margin: -2px 0px 0px 120px; width: 50px"class="btn btn-sm btn-danger">삭제</a>
	       <div class="product-quantity" id="total2">${vo.total}</div>
	    </div>
	    
	    
	  <%--   <div class="product-line-price">${gvo.account}</div> --%>
	  </div>
	  </c:if>
	  </c:forEach>
	  <h3 style="border-bottom: 7px solid #eee;margin-bottom: 29px;margin-top: 40px;">쇼핑몰</h3>
	  <c:forEach var="vo" items="${list }">
	  <c:if test="${vo.cate==2 }">
	  <div class="product">
	    <div class="product-image">
	      <img src="${vo.poster}">
	    </div>
	    <div class="product-details">
	      <div class="product-title">${vo.name}</div>
	    </div>
	    <div class="product-quantity" data-price="${ vo.price}">${vo.price}</div>
	    <!-- <div class="product-quantity">
	      <input type="number" value="1" min="1">
	    </div> -->
	    <div class="product-quantity">&nbsp;${vo.account}</div> 
	    <%-- <div class="product-quantity">${gvo.account} 개월 </div>  --%>
	    <div class="product-removal">
	     <div class="product-quantity" id="total2">${vo.total}</div>
	    
	     <a href="../cart/cart_cancel.do?no=${vo.no }"  style="margin: -2px 0px 0px 120px; width: 50px"class="btn btn-sm btn-danger">삭제</a>
	      
	    </div>
	
	  </div>
	  </c:if>
	  </c:forEach>
	
	<c:forEach var="vo" items="${cList }">
	  <div class="totals">
	    
	   
	  </div>
	</c:forEach>
	 <div class="totals-item totals-item-total" style="display: flex;flex-direction: row;justify-content: flex-end;">
	      <label>최종 결제 금액</label>
			 <div class="totals" id="total" name="total"><span style="margin-left: 114px;">${sum+sum1 }원</span></div>
	    </div>
	      </c:if>
		 <input type="hidden" name="no" value="${vo.no }">
		  <c:if test="${listsize!=0 }">
		 	<input type="submit" class="checkout" id="payBtn" value="결제하기">
		 </c:if>
		   <input type="button" class="backtolist" onclick="javascript:history.back()" value="목록으로">
	    	   
	</div>
	 </form>
	
	</body>
</html>






















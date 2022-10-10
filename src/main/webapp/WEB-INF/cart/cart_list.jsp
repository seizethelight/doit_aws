
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../resource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../resource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../resource/vendors/linericon/style.css">
<link rel="stylesheet" href="../resource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="../resource/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../resource/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="../resource/vendors/nouislider/nouislider.min.css">
</head>

	<body>
	
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>장바구니</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item active" aria-current="page">Shopping Cart</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  <!--================Cart Area =================-->
  <section class="cart_area">
      <div class="container"style="max-width: 1300px;">
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                      <c:if test="${listsize==0 }">
				        <table class="table">
				          <tr style="height:500px">
				            <td class="text-center" style="vertical-align:middle">
				                <img src="http://1004towel.com/SG/img/cart_img_empty.gif" style="display: flex;margin-left: 350px;width: 500px;"><br>
									 <a href="../main/main.do"><button class="checkout" style="margin-right: 150px">메인으로 가기</button></a>             
				            </td>
				          </tr>
				        </table>
				      </c:if>
                     
                      <form action="../payment/pay_form.do" name="pay_frm" id="pay_frm" method="post">
                      
                       <c:if test="${listsize!=0 }">
                        <thead>
                          <tr>
                              <th scope="col">상품</th>
                              <th scope="col">가격</th>
                              <th scope="col">수량</th>
                              <th scope="col">합계</th>
                          	  <th scope="col"></th> 
                          </tr>
                      </thead>
                        <h3 style="border-bottom: 7px solid #eee;margin-bottom: 29px;margin-top: 40px;">헬스장</h3>
						 <c:forEach var="vo" items="${list }">
							 <c:if test="${vo.cate==1 }">
		                     
		                          <tr>
		                              <td>
		                                  <div class="media" style="width: 365px;">
		                                      <div class="d-flex">
		                                             <img src="${vo.poster}" alt="" style=" width: 100px;">
		                                      </div>
		                                      <div class="media-body">
		                                          <p>${vo.name}</p>
		                                      </div>
		                                  </div>
		                              </td>
		                              <td>
		                                  <h5 data-price="${ vo.price}"><fmt:formatNumber value="${vo.price }" pattern="#,###"/>원</h5>
		                              </td>
		                              <td>
		                                  <div class="product_count">
		                                    <!--   <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:"
		                                          class="input-text qty"> -->
		                                      <div class="product-quantity">&nbsp;${vo.account}</div> 
		                                  </div>
		                              </td>
		                             
		                              <td>
		                                  <h5><fmt:formatNumber value="${vo.total }" pattern="#,###"/>원</h5>
		                              </td>
		                              
		                               <td>
		                               <a href="../cart/cart_cancel.do?no=${vo.no }"  style="width: 50px"class="btn btn-sm btn-danger">삭제</a>
		                              </td>
		                             
		                          </tr>
		                          </c:if>
	 						 </c:forEach>
	 						</table> 
	 						<table class="table">
	 						  <thead>
		                          <tr>
		                              <th scope="col">상품</th>
		                              <th scope="col">가격</th>
		                              <th scope="col">수량</th>
		                              <th scope="col">합계</th>
		                          	  <th scope="col"></th> 
		                          </tr>
		                      </thead>
	 						 <h3 style="border-bottom: 7px solid #eee;margin-bottom: 29px;margin-top: 40px;">쇼핑몰</h3>
	 						
	 						  <c:forEach var="vo" items="${list }">
								  <c:if test="${vo.cate==2 }">
								   <tr>
		                              <td>
		                                  <div class="media">
		                                      <div class="d-flex">
		                                             <img src="${vo.poster}" alt="" style="width: 100px;">
		                                      </div>
		                                      <div class="media-body">
		                                          <p>${vo.name}</p>
		                                      </div>
		                                  </div>
		                              </td>
		                              <td>
		                                  <h5 data-price="${ vo.price}"><fmt:formatNumber value="${vo.price }" pattern="#,###"/>원</h5>
		                              </td>
		                              <td>
		                                  <div class="product_count">
		                                    <!--   <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:"
		                                          class="input-text qty"> -->
		                                      <div class="product-quantity">&nbsp;${vo.account}</div> 
		                                  </div>
		                              </td>
		                              <td>
		                                  <h5><fmt:formatNumber value="${vo.total }" pattern="#,###"/>원</h5>
		                              </td>
		                              <td>
		                               <a href="../cart/cart_cancel.do?no=${vo.no }"  style="width: 50px"class="btn btn-sm btn-danger">삭제</a>
		                              </td>
		                              
		                          </tr>
		                    	  </c:if>
		                     </c:forEach>
		                     </table>
		                     
		                          <tr class="bottom_button">
		                              <td></td>
		                              <td></td>
		                              <td></td>
		                           	  <td></td>
		                           	  <td></td>
		                              
		                          </tr>
		                          <table class="table"> 
		                          <tr>
		                           
		                              <td></td>
		                              <td></td>
		                              <td></td>
		                               <td></td>
		                               <td></td>
		                              <td></td>
		                              <td></td>
		                               <td></td>
		                              <td style="width: 280px;">
		                              		<div style="display: flex; font-size: 16px;font-weight: bold">최종 결제 금액 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                                  <div class="totals" id="total" name="total" style="color: #384aeb"><fmt:formatNumber value="${sum+sum1 }" pattern="#,###"/>원</div>
		                                  </div>
		                              </td>
		                              
		                          </tr>
		                       
		                          <tr class="out_button_area">
		                             <td></td>
		                              <td></td>
		                               <td></td>
		                              <td></td>
		                              <td></td>
		                             
		                              <td></td>
		                              <td>
										<div class="checkout_btn_inner d-flex align-items-center" style="margin-left: 1px;">
										  <input type="hidden" name="no" value="${vo.no }">
										   <c:if test="${listsize!=0 }">
											 	<input type="submit" class="primary-btn ml-2" id="payBtn" value="결제하기">
											 </c:if>
											   <input type="button" class="gray_btn" onclick="javascript:history.back()" value="목록으로">
		                                  </div>
		                              </td>
		                              
		                              <td>
		
		                              </td>
		                              <td>
		                                  
		                              </td>
		                          </tr>
		                    	
		                    	</c:if>
	                      </form> 
                    </table>
              </div>
          </div>
      </div>
  </section>
  <!--================End Cart Area =================-->
	

  <script src="../resource/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="../resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="../resource/vendors/skrollr.min.js"></script>
  <script src="../resource/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="../resource/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="../resource/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="../resource/vendors/mail-script.js"></script>
  <script src="../resource/js/main.js"></script>
	</body>
</html>






















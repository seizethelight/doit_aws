
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				                <img src="http://1004towel.com/SG/img/cart_img_empty.gif" style="display: flex;margin-left: 600px;width: 500px;"><br>
									 <a href="../main/main.do"><button class="checkout" style="margin-right: 150px">메인으로 가기</button></a>             
				            </td>
				          </tr>
				        </table>
				      </c:if>
                      <thead>
                          <tr>
                              <th scope="col">상품</th>
                              <th scope="col">가격</th>
                              <th scope="col">수량</th>
                              <th scope="col">합계</th>
                          	  <th scope="col">상태</th> 
                          </tr>
                      </thead>
                      <form action="../payment/pay_form.do" name="pay_frm" id="pay_frm" method="post">
                       <c:if test="${listsize!=0 }">
                        <h3 style="border-bottom: 7px solid #eee;margin-bottom: 29px;margin-top: 40px;">헬스장</h3>
						 <c:forEach var="vo" items="${list }">
							 <c:if test="${vo.cate==1 }">
		                      <tbody>
		                          <tr>
		                              <td>
		                                  <div class="media">
		                                      <div class="d-flex">
		                                             <img src="${vo.poster}" alt="" style=" width: 100px;">
		                                      </div>
		                                      <div class="media-body">
		                                          <p>${vo.name}</p>
		                                      </div>
		                                  </div>
		                              </td>
		                              <td>
		                                  <h5 data-price="${ vo.price}">${vo.price}</h5>
		                              </td>
		                              <td>
		                                  <div class="product_count">
		                                    <!--   <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:"
		                                          class="input-text qty"> -->
		                                      <div class="product-quantity">&nbsp;${vo.account}</div> 
		                                  </div>
		                              </td>
		                              <td>
		                                  <h5>${vo.total}</h5>
		                              </td>
		                          </tr>
		                          </c:if>
	 						 </c:forEach>
	 						 
	 						 <h3 style="border-bottom: 7px solid #eee;margin-bottom: 29px;margin-top: 40px;">쇼핑몰</h3>
	 						  <c:forEach var="vo" items="${list }">
								  <c:if test="${vo.cate==2 }">
								   <tr>
		                              <td>
		                                  <div class="media">
		                                      <div class="d-flex">
		                                             <img src="${vo.poster}" alt="">
		                                      </div>
		                                      <div class="media-body">
		                                          <p>${vo.name}</p>
		                                      </div>
		                                  </div>
		                              </td>
		                              <td>
		                                  <h5 data-price="${ vo.price}">${vo.price}</h5>
		                              </td>
		                              <td>
		                                  <div class="product_count">
		                                    <!--   <input type="text" name="qty" id="sst" maxlength="12" value="1" title="Quantity:"
		                                          class="input-text qty"> -->
		                                      <div class="product-quantity">&nbsp;${vo.account}</div> 
		                                  </div>
		                              </td>
		                              <td>
		                                  <h5>${vo.total}</h5>
		                              </td>
		                          </tr>
		                    	  </c:if>
		                     </c:forEach>
		                          <tr class="bottom_button">
		                              <td>
		                                  <a class="button" href="#">Update Cart</a>
		                              </td>
		                              <td>
		
		                              </td>
		                              <td>
		
		                              </td>
		                              <td>
		                                  <div class="cupon_text d-flex align-items-center">
		                                      <input type="text" placeholder="Coupon Code">
		                                      <a class="primary-btn" href="#">Apply</a>
		                                      <a class="button" href="#">Have a Coupon?</a>
		                                  </div>
		                              </td>
		                          </tr>
		                          <tr>
		                              <td>
		
		                              </td>
		                              <td>
		
		                              </td>
		                              <td>
		                                  <h5>최종 결제 금액</h5>
		                              </td>
		                              <td>
		                                  <h5>${sum+sum1 }원</h5>
		                              </td>
		                          </tr>
		                          <tr class="shipping_area">
		                              <td class="d-none d-md-block">
		
		                              </td>
		                              <td>
		
		                              </td>
		                              <td>
		                                  <h5>Shipping</h5>
		                              </td>
		                              <td>
		                                  <div class="shipping_box">
		                                      <ul class="list">
		                                          <li><a href="#">Flat Rate: $5.00</a></li>
		                                          <li><a href="#">Free Shipping</a></li>
		                                          <li><a href="#">Flat Rate: $10.00</a></li>
		                                          <li class="active"><a href="#">Local Delivery: $2.00</a></li>
		                                      </ul>
		                                      <h6>Calculate Shipping <i class="fa fa-caret-down" aria-hidden="true"></i></h6>
		                                      <select class="shipping_select">
		                                          <option value="1">Bangladesh</option>
		                                          <option value="2">India</option>
		                                          <option value="4">Pakistan</option>
		                                      </select>
		                                      <select class="shipping_select">
		                                          <option value="1">Select a State</option>
		                                          <option value="2">Select a State</option>
		                                          <option value="4">Select a State</option>
		                                      </select>
		                                      <input type="text" placeholder="Postcode/Zipcode">
		                                      <a class="gray_btn" href="#">Update Details</a>
		                                  </div>
		                              </td>
		                          </tr>
		                          <tr class="out_button_area">
		                              <td class="d-none-l">
		
		                              </td>
		                              <td class="">
		
		                              </td>
		                              <td>
		
		                              </td>
		                              <td>
		                                  <div class="checkout_btn_inner d-flex align-items-center">
		                                      <a class="gray_btn" href="#">Continue Shopping</a>
		                                      <a class="primary-btn ml-2" href="#">Proceed to checkout</a>
		                                  </div>
		                              </td>
		                          </tr>
		                         
		                    	  </tbody>
		                    	
		                    	</c:if>
	                      </from> 
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






















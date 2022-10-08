<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
 <link rel="stylesheet" href="${path }/resources/css/s_detail_style.css">
 <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
 $(function(){
	$('#account').change(function(){
		let count=$(this).val();
		let price=$(this).attr("data-price");
		let total=count*price;
		$('#total').text(total)
		
		$('#goods_account').val(count);
	})
})

window.onload=function(){
  let inputContainer = document.querySelector(".input-container");
  let input = inputContainer.firstElementChild.nextElementSibling;
  let minus = inputContainer.firstElementChild;
  let plus = inputContainer.lastElementChild;
  inputContainer.addEventListener("click", changeNumber);
 }
 

</script>
</head>
<body>

 <div class="container">
     <div id="store_detail">
    
     <div style="height: 20px"></div>
		    <div class="grid" style=" margin-top: 100px;">
			  <div class="image-list">
			    <img :src="store_detail.poster">
			    <img :src="store_detail.img1">
			    <img :src="store_detail.img2">
			    <img :src="store_detail.img3">
			  </div>
			  <div class="info-section">
			    <h1 width="100%"style="font-size: 33px;">{{store_detail.name}}</h1>
			      <div style="height: 20px"></div>
			      <h3>판매가</h3>
			     	 <div style="text-align: right;">
			     		 <span style="text-decoration: line-through; color: gray;">{{store_detail.price}}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			      		<span style="font-size: 32px;" >{{store_detail.first_price}}</span>
					</div>
			    
			      <div class="color-option">
			      <p3>Color</p3>
			        <div style="margin-top:8px">
			          <button class="color" style="background-color:lavender;">
			          </button>
			          <button class="color" style="background-color:teal"></button>
			    </div>
			    </div>
			
	 <form method="post" action="../cart/cart_insert.do">
		 <input type="hidden" name="no" :value="s_no">
		 <input type="hidden" name="cate" value="2">
		 <input type ="hidden" name ="total" value="${cvo.total }">
		<tr>
          <td>
              <div style="display: flex;justify-content: space-around;margin-bottom: 40px;"> 
               수량 :&nbsp;&nbsp; <input type=number id="account" name="account" :value="account" max="10" min="1"
                 data-price="${vo.store_price }">총 금액 :&nbsp;&nbsp;<span style="color:blue;font-size: 18px;" id="total">${vo.store_price}</span> 원
          </div>
          </td>
       	 </tr>
			
			       <div style="margin-left: 140px;">     
			         <input type="submit"  value="장바구니" class="btn btn-lg btn-primary" style="margin-bottom: 10px;width: 100%;background: black;">
			        </div>
			<!--  <form method="post" action="#">       
			        <div style="margin-left: 140px;">     
			         <input type="submit"  value="결제하기" class="btn btn-lg btn-primary" style="margin-bottom: 10px;width: 100%;background: black;">
			        </div>
			 </form>  -->      
	 </form>
	 		 <form method="post" action="../payment/pay_form.do">       
			        <div style="margin-left: 140px;">     
			         <input type="submit"  value="결제하기" class="btn btn-lg btn-primary" style="margin-bottom: 10px;width: 100%;background: black;">
			        </div>
			 </form> 
	 	 
			    
			    <div style="margin-top:24px">
			    <p>Fitted scoop neckline t-shirt in purple
			'LO' logo embroidery at centre back neck.
			<ul>
			  <li>Short sleeves</li>
			  <li>Cropped length</li>
			  <li>Baby rib jersey</li>
			  <li>Gentle machine wash</li>
			  <li>100% Cotton</li>
			  <li>Available in sizes UK 6 - 20</li>
			    </ul>
			    Beatriz wears 8 - she is 5.8” and a UK 6
			Alice wears 8 - she is 5.3” and a UK 8</p>
			  </div>
			<tr>
           <td class="text-right">
             <a href="javascript:history.back();" class="btn btn-xs btn-primary" style="background-color: black;">목록</a>
           </td>
         </tr>
			</div>
			</div>
   </div>
</div>
  <script>
    new Vue({
    	el:'#store_detail',
    	data:{
    		s_no:${s_no},
    		type:${c_no},
    		store_detail:{}
    	},
    	mounted:function(){
    		let _this=this;
    		axios.get("http://localhost:8080/web/store/detail.do",{
    			params:{
    				type:_this.type,
    				s_no:_this.s_no
    			}
    		}).then(function(result){
    			console.log(result);
    			_this.store_detail=result.data;
    		})
    	}
    })
    
   </script>
</body>
</html>
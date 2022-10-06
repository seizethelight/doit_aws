<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 
  <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  
<script type="text/javascript">

$(function(){
	$('#account').change(function(){
		let count=$(this).val();
		let price=$(this).attr("data-price");
		let total=price*count;
		$('#total').text(total)
		$('#goods_account').val(count);
	})
})
 $('#cartBtn').click(function(){
	 let id = '${sessionScope.id}';
	 console.log(id);
	 if(id.trim()==''){
		 alert('로그인 후 이용 가능합니다.');
		 
		 return;
	 }
 })
</script>
<style>
app{
	background-color: #eee;
	font-family: 'Noto Sans KR', sans-serif !important;
}
</style>
</head>

<body>
	<div class="container" style="background-color: #f6f6f6;">
	<div class="app">
    <div class="row">
      <table class="table">
        <tr>
          <td class="text-center">
            <img :src="gym_detail.poster" style="width: 500px;height: 350px; margin-right: 80px; margin-top: 100px;">
          </td>
        </tr>
      </table>
    </div>
    <div style="height: 10px"></div>
    <div class="col-sm-8" style="text-align: -webkit-center;margin-left: 170px;"> 
      <table class="table">
        <tr>
          <td colspan="2"><h2 style="text-align: center">{{gym_detail.store}}&nbsp;</h2></td>
          <td style="padding: 20px;">
          <c:if test="${sessionScope.id==null }">
		  <i class="fa fa-heart-o" style="font-size:30px"></i>
		 </c:if>
		 <c:if test="${sessionScope.id!=null && lcount==0 }">
			 <a :href="'../gym/LikeInsert.do?g_no='+gym_detail.g_no"><i class="fa fa-heart-o" style="font-size:30px; color: red;"></i></a>
		 </c:if>
		 <c:if test="${sessionScope.id!=null && lcount!=0 }">
		  <a :href="'../gym/DisLikeInsert.do?g_no='+gym_detail.g_no"><i class="fa fa-heart" style="font-size:30px; color: red;"></i></a>
		  </c:if>
          </td>
        </tr>
        <tr>
         <th class="default" width=25%><h5>운영시간,<br>전화번호 :</h5></th>
         <td width="75%"><h5>&nbsp;{{gym_detail.time}}</h5></td>
        </tr>
        <tr>
         <th class="default" width=25%><h5>주소 :</h5></th>
         <td width="75%"><h5>{{gym_detail.addr}}</h5></td>
        </tr>
        <tr>
         <th class="default" width=25%><h5>가격 :</h5></th>
         <td width="75%">
			<h5>{{gym_detail.price | currency }} 원/개월</h5>
         </td>
        </tr>
        <tr>
         <th class="default" width=25%><h5>#태그 :</h5></th>
         <td width="75%"><h5>{{gym_detail.type}}</h5></td>
        </tr>
        <tr>
         <th class="default" width=25%></th>
         <td width="75%"><h5>{{gym_detail.type1}}</h5></td>
        </tr>
        <tr>
         <th class="default" width=25%></th>
         <td width="75%"><h5>{{gym_detail.type2}}</h5></td>
        </tr>
        <tr>
         <th class="default" width=25%></th>
         <td width="75%"><h5>{{gym_detail.type3}}</h5></td>
        </tr>
      </table>

     	 
		                 
      <form method="post" action="../cart/cart_insert.do">
        <input type="hidden" name="no" :value="g_no">
        <input type="hidden" name="cate" value="1">

             <div style="text-align: left; font-size: 16px;"> 개월 수 :&nbsp;&nbsp; <input type=number id="account" name="account" :value="account" max="10" min="1"
                 data-price="${vo.price }">&nbsp; 총 금액 :&nbsp;&nbsp;<span style="color:blue;" id="total"><fmt:formatNumber value="${vo.price}" pattern="#,###"/> </span> 원  </div><br><br>
         <div style="margin-left: 140px;">     
         <input type="button" onclick="location.href='../gym/gym_list.do'" value="목록" class="btn btn-md btn-info" style="margin-bottom: 20px;margin-left: -200px">&nbsp;
         <input type="submit"  value="장바구니" class="btn btn-md btn-primary" style="margin-bottom: 20px"id="cartBtn">
        <!--  <input type="submit" value="회원권 결제하기" class="btn btn-lg btn-success" style="margin-bottom: 20px"> -->
         </div>
      </form>
      
     <!-- 따로... -->
        
    <div class="col-sm-4">
    <div class="none" style="margin-top: 30px;"></div>
      <div id="map" style="width:700px;height:350px; margin-bottom: 30px; margin-left: -250px" :data="gym_detail.store"></div>
						
    </div>
  </div>
  </div>
 </div>
 
  <script>
  
  new Vue({
	   el:'.app',
	   data:{
		   g_no:${g_no},
		   gym_detail:{}
	   },
	   mounted:function(){
		   // 카카오 등록 
		   let _this=this;
		   axios.get("http://localhost:8080/web/gym/gym_detail_vue.do",{
			   params:{
				   g_no:_this.g_no
			   }
		   }).then(function(result){
			   console.log(result.data)
			   _this.gym_detail=result.data
			   
			   
			   if(window.kakao && window.kakao.maps)
			   {
				  _this.initMap(_this.gym_detail.store);   
				 // console.log(_this.gym_detail.store+"=>1")
				  
			   }
			   else
			   {
				   _this.addScript();
				   
			   }
		   })
		   
		   
	   },
	   filters:{
		   currency: function(value){ // 금액 3자리 수 마다 따옴표 필터
               let num = new Number(value);
               return num.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
           }
	   },
	   methods:{
		   addScript:function() {
			      const script = document.createElement('script');
			      
			      /* global kakao*/
			        script.onload = () => kakao.maps.load(this.initMap);
			        script.src = 'http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=b18319530b6d6d62d5c86a8807893413&libraries=services';
			        document.head.appendChild(script);
			        console.log(this.gym_detail.store+"=>1") 
			    },
		   initMap:function(){
			   
			   //console.log(store+"=>2")
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				         center: new kakao.maps.LatLng(33.450701, 126.570667),  // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 주소-좌표 변환 객체를 생성합니다
				/* global kakao */
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(this.gym_detail.addr, function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+$('#map').attr("data")+'</div>'
				        });
				        infowindow.open(map, marker);
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
				
		   }
	   }
	   
  })
  </script>
</body>
</html>
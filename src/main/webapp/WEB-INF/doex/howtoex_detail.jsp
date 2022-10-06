<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<style type="text/css">
.container{
   margin-top: 30px;
}
.row {
   margin: 0px auto;
   width:100%
}
body{
	background-color: #eee;
	font-family: 'Noto Sans KR', sans-serif !important;
}
</style>
</head>
<body>
<br><br><br><br><br>
<div class="container" id=exdetail>
    <!-- <div class="row">
      <table class="table">
        <tr>
          <td class="text-center">
            <img :src="howtoex_detail.pic1" style="width: 500px;height: 350px; margin-right: 80px">
          </td>
        </tr>
      </table>
    </div> -->
    <div style="height: 10px"></div>
    <div class="col-sm-8" style="text-align: -webkit-center;margin-left: 170px;"> 
      <table class="table">
        <tr>
          <td colspan="3"><h1 style="text-align: center">{{howtoex_detail.ex_title}}&nbsp;</h1></td>
        </tr>
        <tr>
         <th class="default" width=30%><h5><b>난이도:</b> </h5></th>
         <td width="70%"><h5>&nbsp;{{howtoex_detail.ex_level}}</h5></td>
        </tr>
        <tr>
         <th class="default" width=30%><h5><b>운동부위 :</b></h5></th>
         <td width="70%"><h5>{{howtoex_detail.ex_bodypart}}</h5></td>
        </tr>
        
        <tr>
         <th class="default" width=30%><h5><b>주운동 근육 부위 :</b></h5></th>
         <td width="70%"><h5>{{howtoex_detail.ex_musclepart1}}</h5></td>
        </tr>
        <tr>
         <th class="default" width=30%><h5><b>부운동 근육 부위 :</b></h5></th>
         <td width="70%"><h5>{{howtoex_detail.ex_musclepart2}}</h5></td>
        </tr>
        </table>
        
        <hr/>
        <br>
        <tr>
         <th class="default"><h4 style="text-align: left"><b>운동개요</b></h4></th>
         <br>
         <td><h5>{{howtoex_detail.ex_outline}}</h5></td>
        </tr>
 		
 		<br>
 		<br>
 		
          <tr>
          <td class="text-center">
          	<th class="default"><h4 style="text-align: left"><b>운동순서</b></h4></th>
         	<br>
            <img :src="howtoex_detail.pic1" style="width: 500px;height: 350px; margin-right: 80px">
            <td><h5>{{howtoex_detail.sub1}}</h5></td>
            <img :src="howtoex_detail.pic2" style="width: 500px;height: 350px; margin-right: 80px">
 			<td><h5>{{howtoex_detail.sub2}}</h5></td>
   			<img :src="howtoex_detail.pic3" style="width: 500px;height: 350px; margin-right: 80px">
 			 <td><h5>{{howtoex_detail.sub3}}</h5></td>
 			 <img :src="howtoex_detail.pic4" style="width: 500px;height: 350px; margin-right: 80px">
 			 <td><h5>{{howtoex_detail.sub4}}</h5></td>
          </td>
       	  </tr>
        	<br>
        	<br>
  
      </table>
      </div>
      </div>
     
  <script>



  new Vue({
  	el:'#exdetail',
  	data:{
  		ex_no:'${ex_no}',
  		howtoex_detail:{}
  	},
  	mounted:function(){
  		let _this=this;
  		axios.get("http://localhost:8080/web/doex/howtoex_detail.do",{
  			params:{
  				ex_no:_this.ex_no
  			}
  		}).then(function(result){
  			console.log(result);
  			_this.howtoex_detail=result.data;
  		})
  	}
  })
	  
  </script>
</body>
</html>






<!--   <div class="container" id=exdetail>
    <div class="row">
      <table class="table" v-for="vo in howtoex_detail">
        <tr>
         
           <img :src="vo.pic1" style="width:100%">
           
          
        </tr>
      </table>
      <table class="table">
        <tr>
          <td colspan="2"><h3>{{vo.ex_title}}</h3>&nbsp;<span style="color:orange"></span></td>
        </tr>
        <tr>
          <td width=20% style="color:gray">주소</td>
          <td width=80%>{{vo.ex_no}}</td>
        </tr>
        <tr>
          <td width=20% style="color:gray">전화</td>
          <td width=80%>{{vo.ex_sub1}}</td>
        </tr>
        <tr>
          <td width=20% style="color:gray">음식종류</td>
          <td width=80%>{{vo.ex_sub2}}</td>
        </tr>
        <tr>
          <td width=20% style="color:gray">가격대</td>
          <td width=80%>{{vo.sub3}}</td>
        </tr>
        <tr>
          <td width=20% style="color:gray">영업시간</td>
          <td width=80%>{{vo.sub4}}</td>
        </tr>
        <tr>
          <td width=20% style="color:gray">주차</td>
          <td width=80%>{{vo.ex_hit}}</td>
        </tr>
      
      </table>
    </div>
  </div>   -->

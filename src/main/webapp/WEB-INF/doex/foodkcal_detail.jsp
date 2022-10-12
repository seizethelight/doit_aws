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
<div class="container" id=foodkcal_detail>
    <!-- <div class="row">
      <table class="table">
        <tr>
          <td class="text-center">
            <img :src="foodkcal_detail.pic1" style="width: 500px;height: 350px; margin-right: 80px">
          </td>
        </tr>
      </table>
    </div> -->
    <div style="height: 10px"></div>
    <div class="col-sm-8" style="text-align: -webkit-center;margin-left: 170px;"> 
      <table class="table">
        <tr>
          <td colspan="3"><h1 style="text-align: center">{{foodkcal_detail.f_title}}&nbsp;</h1></td>
        </tr>
        <tr>
         <th class="default" width=30%><h5> 난이도:</h5></th>
         <td width="70%"><h5>&nbsp;{{foodkcal_detail.f_title}}</h5></td>
        </tr>
        <tr>
         <th class="default" width=30%><h5>단위 :</h5></th>
         <td width="70%"><h5>{{foodkcal_detail.f_unit}}</h5></td>
        </tr>
        
        <tr>
         <th class="default" width=30%><h5>칼로리 :</h5></th>
         <td width="70%"><h5>{{foodkcal_detail.f_kcal}}kcal</h5></td>
        </tr>
        
        </table>
        
       </div>
       </div>
       
     
  <script>



  new Vue({
  	el:'#foodkcal_detail',
  	data:{
  		f_no:${f_no},
  		foodkcal_detail:{}
  	},
  	mounted:function(){
  		let _this=this;
  		axios.get("http://15.165.108.114/doex/foodkcal_detail.do",{
  			params:{
  				f_no:_this.f_no
  			}
  		}).then(function(result){
  			console.log(result);
  			_this.foodkcal_detail=result.data;
  		})
  	}
  })
	  
  </script>
</body>
</html>








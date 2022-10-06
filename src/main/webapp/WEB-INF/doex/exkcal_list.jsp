<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
   margin-top: 30px;
   margin-left:20px;
}

.container2{
margin-top:30px;
   	margin-left:30px;
}
.row {
   margin: 0px auto;
   width:100%
}

.text-center{
	text-align: center;
	margin:auto;
	padding: 5px 0px 5px;
}


</style>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

</head>
<body>
<br><br><br><br><br>
 <div class="container">
 	 <div class="container2" id=exkcal>
    <div style="height: 20px"></div>
    <div class="row" >
    <div class="message-box">
			<span> <h3><b>운동 칼로리 알아보기</b></h2> </span>
	</div>
       <table class=table>
         <thead style="font-size: 20px; color:#e45c43;">
     	 <tr>
   	  	 	<th>운동</th>
    		<th>단위</th>
   		 	<th>칼로리</th>
     	 </tr>
    	</thead>
		  <tbody id=exkcal v-for="vo in exkcal_list">
      		<tr>
       		  <td style="font-size:16px;"> <a :href="'../doex/exkcal_detail.do?e_no='+vo.e_no"> 
        		{{vo.e_title}}
        		  </a>
        	 </td>
      		  <td style="font-size:16px;">{{vo.e_unit}}</td>
     		  <td style="font-size:16px;">{{vo.e_kcal}}kcal</td>
            </tr>
           </tbody>
        </table>
      </div>
    <div class="row">
       <div class="text-center">
         <input type=button class="btn btn-lg btn-dark" value="이전" @click="prev()">
          {{curpage}} page / {{totalpage}} pages
         <input type=button class="btn btn-lg btn-dark" value="다음" @click="next()">
       </div>
    </div>
  </div>
 </div>

  <script>
   new Vue({
		 el:'#exkcal',
		 data:{
			 curpage:1,
			 totalpage:0,
			 exkcal_list:[],
	         
		 },
		 mounted:function(){
			 let _this=this;
			 axios.get("http://localhost:8080/web/doex/exkcal_list.do",{
				 params:{
					 page:_this.curpage
				 }
			 }).then(function(result){
				 console.log(result);
				 _this.exkcal_list=result.data;
				 _this.curpage=result.data[0].curpage;
				 _this.totalpage=result.data[0].totalpage;
				 console.log(_this.exkcal_list);
				 console.log(_this.curpage);
				 console.log(_this.totalpage);
			 })
		 },
		 
		 methods:{
			 send:function(){
				 let _this=this;
				 axios.get("http://localhost:8080/web/doex/exkcal_list.do",{
					 params:{
						 page:_this.curpage
					 }
				 }).then(function(result){
					 console.log(result);
					 _this.exkcal_list=result.data;
					 _this.curpage=result.data[0].curpage;
					 _this.totalpage=result.data[0].totalpage;
				 })
			 },
			 prev:function(){
				 this.curpage=this.curpage>1?this.curpage-1:this.curpage;
				 this.send()
			 },
			 next:function(){
				 this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
				 this.send()
			 }
			
		 }
   })
   </script>

    
<br><br><br><br><br>

    </body>
</html>
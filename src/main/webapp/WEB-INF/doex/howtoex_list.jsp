<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">

    
<style type="text/css">
body{
   /*background-color: #eff8ff;*/
   background-color: #eee;
     font-family: 'Noto Sans KR', sans-serif !important;
     
}
.container{
   margin-top: 30px;
}
.row {
   margin: 0px auto;
   width:100%
}
.text-center{
	margin:auto;
	padding: 5px 0px 5px;
}

.padding-space{
	padding-left:50px;
}

.btn.btn-outline-secondary {
	border-radius:4px;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<br><br><br><br><br>
 <div class="container" id=app>
 
    <div style="height: 20px"></div>
    <div class="row" >
       <div class="col-md-3" v-for="vo in howtoex_list">
		    <div class="thumbnail margin-space" >
		      <a :href="'../doex/howtoex_detail.do?ex_no='+vo.ex_no">
		        <img :src="vo.pic1" alt="Lights" style="width:350px;height:250px;">
		        <div class="caption">
		        	<h4><b>{{vo.ex_title }}</b></h4>
		        	<div style="float: left;">
		        		<h5 style="color: grey;"> <b>운동부위 : {{vo.ex_bodypart }}</b></h5>
		        	</div>
		      	
		           <div style="float: right;">
		           		<h5>
			           		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
	  						<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
	 					 	<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
							</svg> {{vo.ex_hit}}
						</h5>
					</div>	
				</div>
					
					<br>
					<div class="readmore">
	 					<div class="text-center">
	 		 				<!-- <div class="primary-btn">Read More</div> -->
	 		 				<input type=button class="btn btn-outline-secondary" value="Read More">
						</div>		
		       		</div>
					</a>	
			</div>
		</div>
				 
					<br>
	 				<!-- <div class="readmore">
	 					<div class="text-center">
	 		 				<div class="primary-btn">Read More</div>
						</div>		
		       		</div> -->
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
		 el:'#app',
		 data:{
			 curpage:1,
			 totalpage:0,
			 howtoex_list:[],
	         
		 },
		 mounted:function(){
			 let _this=this;
			 axios.get("http://localhost:8080/web/doex/howtoex_list.do",{
				 params:{
					 page:_this.curpage
				 }
			 }).then(function(result){
				 console.log(result);
				 _this.howtoex_list=result.data;
				 _this.curpage=result.data[0].curpage;
				 _this.totalpage=result.data[0].totalpage;
				 console.log(_this.howtoex_list);
				 console.log(_this.curpage);
				 console.log(_this.totalpage);
			 })
		 },
		 methods:{
			 send:function(){
				 let _this=this;
				 axios.get("http://localhost:8080/web/doex/howtoex_list.do",{
					 params:{
						 page:_this.curpage
					 }
				 }).then(function(result){
					 console.log(result);
					 _this.howtoex_list=result.data;
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


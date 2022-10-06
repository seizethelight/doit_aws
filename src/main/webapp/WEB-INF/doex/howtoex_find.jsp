<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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

</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
<br><br><br><br><br><br><br>
  <div class="container" id=exfind >
     <div class="row row1"> 
        	<div class="row">
        	<h3 style="padding:5px"><b>운동부위로 운동방법을 검색하세요</b></h3>
        	
        	</div>
        	 <div style="height:25px"></div>
        <input type=text size=20 class="input-sm" :value="ss" ref="ss" v-model="ss"> &nbsp;
        <input type=button value=" 검색 " class="btn btn-sm btn-dark" v-on:click="howtoexFind()">
     </div>
     <div style="height: 15px"></div>
     <div class="row">
         <div class="col-md-3" v-for="vo in howtoex_list">
		    <div class="thumbnail">
		      <a :href="'../doex/howtoex_detail.do?ex_no='+vo.ex_no">
		        <img :src="vo.pic1" alt="Lights" style="width:100%">
		        <div class="caption">
		         <h5><b>{{vo.ex_title }}</b></h5>
		        
		           <p>{{vo.ex_hit}}</p>
		        </div>
		        <div class="readmore">
	 					<div class="text-center">
	 		 				
	 		 				<input type=button class="btn btn-outline-secondary" value="Read More">
						</div>		
		       		</div>
		      </a>
		    </div>
		  </div>
     </div>
     <div style="height: 20px"></div>
     <div class="row">
       <div class="text-center">
         <input type=button class="btn btn-sm btn-dark" v-on:click="prev()" value=이전>
         {{curpage}} page / {{totalpage}} pages
         <input type=button class="btn btn-sm btn-dark" v-on:click="next()" value=다음>
       </div>
     </div>
   </div>
   <br> <br>
   <script>
     new Vue({
    	 el:'#exfind',
    	 data:{
    		 curpage:1,
             totalpage:0,
             ss:'어깨',
             howtoex_list:[]
    	 },
    	 // vue_find.do?ss=강남&page=1
         // data:{no:1,pwd:''},
         // success:function(result)
    	 mounted:function(){
    		 // window.onload => main
    		 // http://localhost:8080/web/food/vue_find.do?ss=%EA%B0%95%EB%82%A8&page=1
    		 this.send();
    	 },
    	 methods:{
    		 send:function(){
    			 axios.get('http://localhost:8080/web/doex/vue_find.do',{
        			 params:{
        				 ss:this.ss,
        				 page:this.curpage
        			 }
        		 }).then(result=>{
        			 // function(result){}
        			 console.log(result)
        			 this.howtoex_list=result.data;
        			 this.curpage=this.howtoex_list[0].curpage;
        			 this.totalpage=this.howtoex_list[0].totalpage;
        		 })
    		 },
    		 howtoexFind:function(){
    			 if(this.ss==="")
    			 {
    				 alert("검색어를 입력하세요");
    				 this.$refs.ss.focus();
    				 return;
    			 }
    			 this.send();
    		 },
    		 prev:function(){
    			 //alert("1");
    			 this.curpage=this.curpage>1?this.curpage-1:this.curpage;
    			 this.send();
    		 },
    		 next:function(){
    			 //alert("2");
    			 this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
    			 //alert("page="+this.curpage)
    			 this.send();
    		 }
    	 }
     })
   </script>
</body>
</html>
</body>
</html>

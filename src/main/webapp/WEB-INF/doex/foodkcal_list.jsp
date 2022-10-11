<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Category</title>
<link rel="icon" href="img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="../resources/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../resources/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../resources/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../resources/vendors/linericon/style.css">
<link rel="stylesheet" href="../resources/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="../resources/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="../resources/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="../resources/vendors/nouislider/nouislider.min.css">

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

 <link rel="stylesheet" href="../resources/css/style.css" > 

<style>

.text-center{
	margin:auto;
	padding: 5px 0px 5px;
}
</style>
</head>

<body>
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Exercise</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Doit!</a></li>
              <li class="breadcrumb-item active" aria-current="page">Kcal Dictionary</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
<br><br>
 <div class="container">
     <div class="container2" id=foodkcal>
     	 <span> <h3><b> 칼로리 사전</b></h2> </span>
    <div style="height: 20px"></div>
    <div class="row" >
    <div class="message-box">
        
        <input type=button class="btn btn-lg btn-dark" style="background-color:#eeeee" value="음식칼로리" v-on:click="kcalChange(1)">
        <input type=button class="btn btn-lg btn-gray" value="운동칼로리" v-on:click="kcalChange(2)">
   
   </div>   
   <div class="text-center">
   			</div>		
       <table class=table>
          <thead style="font-size: 20px; color:#e45c43;">
         <tr>
               <th><b>음식명/운동명</b></th>
          <th><b>단위</b></th>
             <th>칼로리</th>
         </tr>
       </thead>
        <tbody id=foodkcal v-for="vo in foodkcal_list">
            <tr>
              <td style="font-size:16px;"> <!-- <a :href="'../doex/foodkcal_detail.do?f_no='+vo.f_no">  -->
              {{vo.f_title}}
               <!--  </a> -->
            </td>
              <td style="font-size:16px;">{{vo.f_unit}}</td>
             <td style="font-size:16px;">{{vo.f_kcal}}kcal</td>
            </tr>
           </tbody>
           </div>
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
    const list=new Vue({
    	el:'#foodkcal',
    	data:{
    		curpage:1,
    		totalpage:0,
    		foodkcal_list:[],
    		type:1
    	},
    	mounted:function(){
    		this.send()
    	},
    	methods:{
    		send:function(){
    			let _this=this;
        		axios.get("http://localhost:8080/web/doex/foodkcal_list.do",{
        			params:{
        				page:_this.curpage,
        				type:_this.type
        			}
        		}).then(function(result){
        			_this.foodkcal_list=result.data;
        			_this.curpage=result.data[0].curpage;
        			_this.totalpage=result.data[0].totalpage;
        			_this.type=result.data[0].type;
        		})
    		},
    		kcalChange:function(f_no){
    			this.type=f_no;
    			this.curpage=1;
    			this.send();
    		},
    		prev:function(){
    			this.curpage=this.curpage>1?this.curpage-1:this.curpage;
    			this.send();
    		},
    		next:function(){
    			this.curpage=this.curpage<this.totalpage?this.curpage+1:this.curpage;
    			this.send();
    		}
    	}
    })
    const cook=new Vue({
    	el:'#foodkcal_cookie',
    	data:{
    		foodkcal_cook:[]
    	}
    })
  </script>
    
<br><br><br><br><br>

    </body>
</html>
package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@RestController
public class FoodkcalRestController {
	@Autowired
	private FoodkcalDAO fDao;
	@GetMapping(value="doex/foodkcal_list.do", produces="text/plain;charset=UTF-8")
	public String foodkcal_list(String page)
	{
		 String result="";
		if(page==null)
			page="1";
		
		   int curpage=Integer.parseInt(page);
	 	   Map map=new HashMap();
	 	   int rowSize=12;
	 	   int start=(rowSize*curpage)-(rowSize-1);
	 	   int end=(rowSize*curpage);
	 	   
	 	   map.put("start", start);
	 	   map.put("end", end);
	 	   
	 	   List<FoodkcalVO> list=fDao.foodkcalListData(map);
	 	   int totalpage=fDao.foodkcalTotalPage(map);
	 	   
	 	   
	 	   JSONArray arr=new JSONArray();//[] => {no,poster,title,curpage,totalpage},{no,poster,title}.....
	 	   int k=0;
	 	   for(FoodkcalVO vo:list)
	 	   {
	 		   JSONObject obj=new JSONObject();
	 		    obj.put("f_no", vo.getF_no());
				 obj.put("f_title", vo.getF_title());
				 obj.put("f_hit", vo.getF_hit());
				 obj.put("f_unit", vo.getF_unit());
				 obj.put("f_kcal", vo.getF_kcal());
				 
				 if(k==0)
		 		   {
		 			   obj.put("curpage", curpage);
		 	 		   obj.put("totalpage", totalpage);
		 		   }
	 		   arr.add(obj);
	 		   k++;
	 		   
	 	   }
	 	   result=arr.toJSONString();
	 	   return result;
	    }
	
	 @GetMapping(value = "doex/foodkcal_detail.do", produces = "text/plain;charset=UTF-8")
	 public String foodkcal_detail(int f_no)
	 {
		 String result="";
		 try {
			 FoodkcalVO vo=fDao.foodkcalDetailData(f_no);
			 JSONObject obj=new JSONObject();
			
			 obj.put("f_no", vo.getF_no());
			 obj.put("f_title", vo.getF_title());
			 obj.put("f_hit", vo.getF_hit());
			 obj.put("f_unit", vo.getF_unit());
			 obj.put("f_kcal", vo.getF_kcal());
			 
			 result=obj.toJSONString();
			 
		 }catch(Exception ex) 
		 {
			 ex.printStackTrace();
		 }
		 return result;
	 }
	
	
}

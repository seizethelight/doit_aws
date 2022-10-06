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
public class ExkcalRestController {
	@Autowired
	private ExkcalDAO ekDao;
	@GetMapping(value="doex/exkcal_list.do", produces="text/plain;charset=UTF-8")
	public String exkcal_list(String page)
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
	 	   
	 	   List<ExkcalVO> list=ekDao.exkcalListData(map);
	 	   int totalpage=ekDao.exkcalTotalPage(map);
	 	   
	 	   
	 	   JSONArray arr=new JSONArray();//[] => {no,poster,title,curpage,totalpage},{no,poster,title}.....
	 	   int k=0;
	 	   for(ExkcalVO vo:list)
	 	   {
	 		   JSONObject obj=new JSONObject();
	 		    obj.put("e_no", vo.getE_no());
				 obj.put("e_title", vo.getE_title());
				 obj.put("e_hit", vo.getE_hit());
				 obj.put("e_unit", vo.getE_unit());
				 obj.put("e_kcal", vo.getE_kcal());
				 
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
	
	 @GetMapping(value = "doex/exkcal_detail.do", produces = "text/plain;charset=UTF-8")
	 public String exkcal_detail(int e_no)
	 {
		 String result="";
		 try {
			 ExkcalVO vo=ekDao.exkcalDetailData(e_no);
			 JSONObject obj=new JSONObject();
			
			 obj.put("e_no", vo.getE_no());
			 obj.put("e_title", vo.getE_title());
			 obj.put("e_hit", vo.getE_hit());
			 obj.put("e_unit", vo.getE_unit());
			 obj.put("e_kcal", vo.getE_kcal());
			 
			 result=obj.toJSONString();
			 
		 }catch(Exception ex) 
		 {
			 ex.printStackTrace();
		 }
		 return result;
	 }
	
	
}

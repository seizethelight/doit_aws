package com.sist.web;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.sist.dao.HowtoexDAO;
import com.sist.vo.*;
@RestController
public class HowtoexRestController {
	@Autowired
	private HowtoexDAO eDao;
	@GetMapping(value="doex/howtoex_list.do", produces="text/plain;charset=UTF-8")
	public String howtoex_list(String page)
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
	 	   
	 	   List<HowtoexVO> list=eDao.howtoexListData(map);
	 	   int totalpage=eDao.howtoexTotalPage(map);
	 	   
	 	   
	 	   JSONArray arr=new JSONArray();//[] => {no,poster,title,curpage,totalpage},{no,poster,title}.....
	 	   int k=0;
	 	   for(HowtoexVO vo:list)
	 	   {
	 		   JSONObject obj=new JSONObject();
	 		   obj.put("ex_no", vo.getEx_no());
	 		   obj.put("ex_title", vo.getEx_title());
	 		   obj.put("ex_level", vo.getEx_level());
	 		  obj.put("ex_hit", vo.getEx_hit());
	 		   obj.put("ex_bodypart", vo.getEx_bodypart());
	 		   obj.put("ex_musclepart1", vo.getEx_musclepart1());
	 		  obj.put("ex_musclepart2", vo.getEx_musclepart2());
	 		 obj.put("pic1", "http://localhost:8080/web/"+vo.getPic1());
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
	
	@GetMapping(value = "doex/vue_find.do",produces = "text/plain;charset=UTF-8")//JSON
    public String howtoex_find(String ss,String page)
    {
    	System.out.println("ss="+ss);
    	System.out.println("page="+page);
    	String result="";
    	try
    	{
    		if(page==null)
    			page="1";
    		if(ss==null)
    			ss="?ñ¥Íπ?";
    		int curpage=Integer.parseInt(page);
    		Map map=new HashMap();
    		int rowSize=12;
    		int start=(rowSize*curpage)-(rowSize-1);
    		int end=(rowSize*curpage);
    		map.put("start", start);
    		map.put("end", end);
    		map.put("ex_bodypart", ss);
    		
    		List<HowtoexVO> list=eDao.exFindData(map);
 	 	    int totalpage=eDao.exFindTotalPage(ss);
 	 	   
    		JSONArray arr=new JSONArray(); //List  => [] => ?ûêÎ∞îÏä§?Å¨Î¶ΩÌä∏ Í∞ùÏ≤¥?ëú?òÑÎ≤? 
    		int k=0;
    		for(HowtoexVO vo:list)
    		{
    			JSONObject obj=new JSONObject(); //{"fno":1,"name":"ddd"}
    			 obj.put("ex_no", vo.getEx_no());
    			 obj.put("ex_title", vo.getEx_title());
    			 obj.put("ex_outline", vo.getEx_outline());
    			 obj.put("ex_level", vo.getEx_level());
    			 obj.put("ex_bodypart", vo.getEx_bodypart());
    			 obj.put("ex_musclepart1", vo.getEx_musclepart1());
    			 obj.put("ex_musclepart2", vo.getEx_musclepart2());
    			 obj.put("pic1", "http://localhost:8080/web/"+vo.getPic1());
    			 obj.put("sub1", vo.getSub1());
    			 obj.put("pic2", "http://localhost:8080/web/"+vo.getPic2());
    			 obj.put("pic3", "http://localhost:8080/web/"+vo.getPic3());
    			 obj.put("pic4", "http://localhost:8080/web/"+vo.getPic4());
    			 obj.put("sub2", vo.getSub2());
    			 obj.put("sub3", vo.getSub3());
    			 obj.put("sub4", vo.getSub4());
    			if(k==0)
    			{
    				obj.put("curpage", curpage);
    				obj.put("totalpage", totalpage);
    			}
    			
    			arr.add(obj);
    			k++;
    		}
    		result=arr.toJSONString();
    	}catch(Exception ex){}
    	return result;
    }
	
	
	 @GetMapping(value = "doex/howtoex_detail.do", produces = "text/plain;charset=UTF-8")
	 public String howtoex_detail(int ex_no)
	 {
		 String result="";
		 try {
			 HowtoexVO vo=eDao.howtoexDetailData(ex_no);
			 JSONObject obj=new JSONObject();
			
			 obj.put("ex_no", vo.getEx_no());
			 obj.put("ex_title", vo.getEx_title());
			 obj.put("ex_outline", vo.getEx_outline());
			 obj.put("ex_level", vo.getEx_level());
			 obj.put("ex_bodypart", vo.getEx_bodypart());
			 obj.put("ex_musclepart1", vo.getEx_musclepart1());
			 obj.put("ex_musclepart2", vo.getEx_musclepart2());
			 obj.put("pic1", "http://localhost:8080/web/"+vo.getPic1());
			 obj.put("sub1", vo.getSub1());
			 obj.put("pic2", "http://localhost:8080/web/"+vo.getPic2());
			 obj.put("pic3", "http://localhost:8080/web/"+vo.getPic3());
			 obj.put("pic4", "http://localhost:8080/web/"+vo.getPic4());
			 obj.put("sub2", vo.getSub2());
			 obj.put("sub3", vo.getSub3());
			 obj.put("sub4", vo.getSub4());
			
			 obj.put("ex_hit", vo.getEx_hit());
			 
			 result=obj.toJSONString();
			 
		 }catch(Exception ex) 
		 {
			 ex.printStackTrace();
		 }
		 return result;
	 }
	 
	 
	 @GetMapping(value="doex/howtoex_cookie.do" , produces = "text/plain;charset=UTF-8")
	    public String howtoex_cookie_list(HttpServletRequest request)
	    {
	    	String result="";
	    	Cookie[] cookies=request.getCookies();
	    	List<HowtoexVO> list=new ArrayList<HowtoexVO>();
	    	if(cookies!=null)
	    	{
	    		for(int i=cookies.length-1;i>=0;i--)
	    		{
	    			if(cookies[i].getName().startsWith("howtoex"))
	    			{
	    				String ex_no=cookies[i].getValue();
	    				HowtoexVO vo=eDao.howtoexCookieData(Integer.parseInt(ex_no));
	    				list.add(vo);
	    			}
	    		}
	    	}
	    	JSONArray arr=new JSONArray();
	    	for(HowtoexVO vo:list)
	    	{
	    		JSONObject obj=new JSONObject();
	    		obj.put("ex_no", vo.getEx_no());
		 		obj.put("ex_title", vo.getEx_title());
		 		obj.put("ex_level", vo.getEx_level());
		 		obj.put("ex_hit", vo.getEx_hit());
		 		obj.put("ex_bodypart", vo.getEx_bodypart());
		 		obj.put("ex_musclepart1", vo.getEx_musclepart1());
		 		obj.put("ex_musclepart2", vo.getEx_musclepart2());
		 		obj.put("pic1", "http://localhost:8080/web/"+vo.getPic1());
	    		arr.add(obj);
	    	}
	    	result=arr.toJSONString();
	    	return result;
	    }
	
	
}

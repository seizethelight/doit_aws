package com.sist.web;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.vo.*;
import com.sist.dao.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GymRestController {
	@Autowired
	private GymDAO dao;
	
	 @GetMapping(value = "gym/gym_list_vue.do",produces = "text/plain;charset=UTF-8")
	    public String gym_list(String page)
	    {
	    	String result="";
	    	try
	    	{
	    		if(page==null)
	    			page="1";
	    		int curpage=Integer.parseInt(page);
	    		Map map=new HashMap();
	    		int rowSize=9;
	    		int start=(rowSize*curpage)-(rowSize-1);
	    		int end=(rowSize*curpage);
	    		map.put("start", start);
	    		map.put("end", end);
	    		
	    		List<GymVO> list=dao.gymListData(map);
	    		int totalpage=dao.gymTotalPage();
	    		
	    		JSONArray arr=new JSONArray(); 

	    		int k=0;
	    		for(GymVO vo:list)
	    		{
	    			JSONObject obj=new JSONObject(); //{"fno":1,"name":"ddd"}
	    			/*
	    			 * g_no,store,poster,type,type1,addr,price,hit
	    			 */
	    			obj.put("g_no", vo.getG_no());
	    			obj.put("store", vo.getStore());
	    			obj.put("poster", vo.getPoster());
	    			obj.put("type", vo.getType());
	    			obj.put("type1", vo.getType1());
	    			obj.put("addr", vo.getAddr().substring(0,vo.getAddr().indexOf("구")+1));
	    			obj.put("price", vo.getPrice());
	    			obj.put("hit", vo.getHit());
	    			
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
	 
	 @GetMapping(value = "gym/gym_detail_vue.do", produces = "text/plain;charset=UTF-8")
	 public String gym_detail(int g_no)
	 {
		 String result="";
		 try {
			 GymVO vo=dao.gymDetailData(g_no);
			 JSONObject obj=new JSONObject();
			
			 obj.put("g_no", vo.getG_no());
			 obj.put("store", vo.getStore());
			 obj.put("time", vo.getTime());
			 obj.put("poster", vo.getPoster());
			 obj.put("type", vo.getType());
			 obj.put("type1", vo.getType1());
			 obj.put("type2", vo.getType2());
			 obj.put("type3", vo.getType3());
			 obj.put("addr", vo.getAddr());
			 obj.put("price", vo.getPrice());
			 obj.put("hit", vo.getHit());
			 
			 result=obj.toJSONString();
			 
		 }catch(Exception ex) 
		 {
			 ex.printStackTrace();
		 }
		 return result;
	 }
	 
	 @GetMapping(value="gym/gym_cookie.do" , produces = "text/plain;charset=UTF-8")
	    public String gym_cookie_list(HttpServletRequest request)
	    {
	    	String result="";
	    	Cookie[] cookies=request.getCookies();
	    	List<GymVO> list=new ArrayList<GymVO>();
	    	if(cookies!=null)
	    	{
	    		for(int i=cookies.length-1;i>=0;i--)
	    		{
	    			if(cookies[i].getName().startsWith("gym"))
	    			{
	    				String g_no=cookies[i].getValue();
	    				GymVO vo=dao.gymCookieData(Integer.parseInt(g_no));
	    				list.add(vo);
	    			}
	    		}
	    	}
	    	JSONArray arr=new JSONArray();
	    	for(GymVO vo:list)
	    	{
	    		JSONObject obj=new JSONObject();
	    		obj.put("g_no", vo.getG_no());
    			obj.put("store", vo.getStore());
    			obj.put("poster", vo.getPoster());
    			obj.put("type", vo.getType());
    			obj.put("type1", vo.getType1());
    			obj.put("addr", vo.getAddr().substring(0,vo.getAddr().indexOf("구")+1));
    			obj.put("price", vo.getPrice());
    			obj.put("hit", vo.getHit());
	    		arr.add(obj);
	    	}
	    	result=arr.toJSONString();
	    	return result;
	    }
	 
	
}

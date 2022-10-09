package com.sist.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.StoreDAO;
import com.sist.vo.StoreVO;

@RestController
public class StoreRestController {
	@Autowired
	private StoreDAO dao;
//	
//	 @Autowired
//	    private BCryptPasswordEncoder encoder;//시큐리
	@GetMapping(value="store/list.do",produces = "text/plain;charset=utf-8")
    // text/html (Ajax) , text/xml (XML), text/plain (JSON)
    public String list(String type ,String page)
    {
 	   if(page==null)
 		   page="1";
 	   
 	   if(type==null)
 		   type="1";
 	  int cate=Integer.parseInt(type);
 	   String[] c_no={"","a","w","m","k","n","i","g","f"};
//System.out.println("list_type="+type);
 	   JSONArray arr=new JSONArray();//[] => {no,poster,title,curpage,totalpage},{no,poster,title}.....
 	   int k=0;
 	   int s=235;//man 시작번호 
 	   int p=409;//kids
 	   int g=623;//new
 	   int f=1002;//item
 	   int c=790;//g
 	   
 		  int curpage=Integer.parseInt(page);
	 	   Map map=new HashMap();
	 	   int rowSize=12;
	 	   
	 	   if(cate==3)
	 	   {
	 		  int start=(rowSize*curpage+s)-(rowSize-1);
		 	   int end=(rowSize*curpage)+s;
		 	   map.put("start", start);
		 	   map.put("end", end);
		 	   map.put("c_no", c_no[cate]);
	 	   }
	 	  else if(cate==4)//kids
	 	   {
	 		  int start=(rowSize*curpage+p)-(rowSize-1);
		 	   int end=(rowSize*curpage)+p;
		 	   map.put("start", start);
		 	   map.put("end", end);
		 	   map.put("c_no", c_no[cate]);
	 	   }
	 	   else if(cate==5)//new
	 	   {
	 		  int start=(rowSize*curpage+g)-(rowSize-1);
		 	   int end=(rowSize*curpage)+g;
		 	   map.put("start", start);
		 	   map.put("end", end);
		 	   map.put("c_no", c_no[cate]);
	 	   }
	 	  else if(cate==6)//items
	 	   {
	 		 int start=(rowSize*curpage+f)-(rowSize-1);
		 	   int end=(rowSize*curpage)+f;
		 	   map.put("start", start);
		 	   map.put("end", end);
		 	   map.put("c_no", c_no[cate]);
	 	   }
	 	  else if(cate==7)//golf
	 	   {
	 		 int start=(rowSize*curpage+c)-(rowSize-1);
		 	   int end=(rowSize*curpage)+c;
		 	   map.put("start", start);
		 	   map.put("end", end);
		 	   map.put("c_no", c_no[cate]);
	 	   }
	 	  else
	 	   {
	 		  int start=(rowSize*curpage)-(rowSize-1);
		 	   int end=rowSize*curpage;
		 	   map.put("start", start);
		 	   map.put("end", end);
		 	   map.put("c_no", c_no[cate]);
	 	   }
	 	  
	 	   
	 	   List<StoreVO> list=new ArrayList<StoreVO>();
	 	   int totalpage=0;
	 			   
	 			  if(cate==1)//전체 
	 			  {
	 				  list=dao.storeaListData(map);
	 				 totalpage=dao.storeaTotalPage(map);
	 			  }
	 			  else //여자,남자 (cate=2,3) 
	 			  {
	 				  list=dao.storeListData(map);
	 				 totalpage=dao.storeTotalPage(map);
	 			  }
	 			 

	 	   for(StoreVO vo:list)
	 	   {
	 		   JSONObject obj=new JSONObject();
	 		   obj.put("s_no", vo.getS_no());
	 		 
			   String name = vo.getName();
			   if(name.length()>25) {
				name = name.substring(0,25)+"...";
				vo.setName(name);
			   }
					
					 obj.put("name", vo.getName());
			
	 		   obj.put("poster", "http://"+vo.getPoster());
	 		   obj.put("price", vo.getPrice());
	 		   obj.put("first_price", vo.getFirst_price());

	 		   if(k==0)
	 		   {
	 			   obj.put("curpage", curpage);
	 	 		   obj.put("totalpage", totalpage);
	 	 		   obj.put("type", type);
	 	 		   
	 		   }
	 		   
	 		   arr.add(obj);
	 		   k++;
	 	   }
 	  return arr.toJSONString();
 	  
 	 }
	  @GetMapping(value="store/detail.do",produces = "text/plain;charset=utf-8")
	    public String store_detail_vue(int s_no,int type)
	    {
		  	String result="";
	 	  
	    	try
	    	{
	    		 String[] c_no={"","a","w","m","k","n","i","g","f"};
	    		//String[] table_name={"","seoul_location","seoul_nature","seoul_shop"};
	    		Map map=new HashMap();
	    		map.put("s_no", s_no);
	    		map.put("c_no", c_no[type]);
	    		
	    		
	    		StoreVO vo=dao.storeDetailData(map);
	    	
	    		/*
	    		 * s_no,name,poster,price,first_price,c_no
	    		 */
	    		JSONObject obj=new JSONObject();
	    		
	    		obj.put("s_no",vo.getS_no());
	    		obj.put("name",vo.getName());
	    		obj.put("poster","http://"+vo.getPoster());
	    		obj.put("price", vo.getPrice());
	    		obj.put("first_price", vo.getFirst_price());
	    		obj.put("c_no", vo.getC_no());
	    		obj.put("img1", vo.getImg1());
	    		obj.put("img2", vo.getImg2());
	    		obj.put("img3", vo.getImg3());
//	    		obj.put("",vo.getAddress().substring(vo.getAddress().indexOf(" ")).trim());
	    		
	    		result=obj.toJSONString();
	    		
	    	}catch(Exception ex) 
	    	{
	    		ex.printStackTrace();
	    	}
	    	return result;
	    }
	    
	    @GetMapping(value="store/store_cookie.do" , produces = "text/plain;charset=utf-8")
	    public String store_cook_list(String c_no,HttpServletRequest request)
	    {
	    	
	    	String result="";
	    	Cookie[] cookies=request.getCookies();
	    	System.out.println("cookie-size:"+cookies.length);
	    	List<StoreVO> list=new ArrayList<StoreVO>();
	    	if(cookies!=null)
	    	{
	    		for(int i=cookies.length-1;i>=0;i--)
	    		{
	    			if(cookies[i].getName().startsWith("store"))
	    			{
	    				Map map=new HashMap();
	    				String s_no=cookies[i].getValue();
	    				map.put("s_no", s_no);
	    				map.put("c_no", "store_"+c_no);
	    				StoreVO vo=dao.storeDetailData(map);
	    				list.add(vo);
	    			}
	    		}
	    	}
	    	// list => JSON
	    	JSONArray arr=new JSONArray();
	    	System.out.println("list:"+list.size());
	    	for(StoreVO vo:list)
	    	{
	    		JSONObject obj=new JSONObject();
	    		obj.put("s_no",vo.getS_no());
	    		obj.put("name",vo.getName());
	    		//obj.put("address",vo.getAddress().substring(vo.getAddress().indexOf(" ")).trim());
	    		obj.put("poster","http://"+vo.getPoster());
	    		arr.add(obj);
	    	}
	    	result=arr.toJSONString();
	    	return result;
	    }
}

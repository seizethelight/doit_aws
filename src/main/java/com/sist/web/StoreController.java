package com.sist.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.DoitLikeDAO;
import com.sist.dao.StoreDAO;
import com.sist.vo.GymVO;
import com.sist.vo.StoreVO;

@Controller
public class StoreController {
	
	@Autowired
	private StoreDAO dao;
	@Autowired
	private DoitLikeDAO ldao;
	
	@GetMapping("store/list.do")
	public String store_list(String s_no, Model model)
	{
		return "store/list";
	}
		 @GetMapping("store/detail_before.do")
	   public String seoul_detail_before(int s_no,String c_no,RedirectAttributes ra,HttpServletResponse response)
	   {
		   // 쿠키 생성 

//		   Cookie cookie=new Cookie(cmd[c_no]+s_no,String.valueOf(s_no));
		   Cookie cookie=new Cookie("store"+s_no,String.valueOf(s_no));
		   cookie.setPath("/");
		   cookie.setMaxAge(60*60*24);
		   response.addCookie(cookie);
		   ra.addAttribute("s_no", s_no);
		   ra.addAttribute("c_no", c_no);
		   return "redirect:../store/detail.do"; // RedirectAttributes
	   }
		// 쿠키삭제
			@GetMapping("store/store_cookie_delete.do")
			public String store_cookie_delete(HttpServletResponse response,HttpServletRequest request)
			{
				 Cookie[] cookies=request.getCookies();
				   for(int i=cookies.length-1;i>=0;i--)
				   {
					   if(cookies[i].getName().startsWith("store"))
					   {
						   cookies[i].setPath("/");
						   cookies[i].setMaxAge(0);
						   response.addCookie(cookies[i]);
					   }
				   }
				   
				return "redirect:../store/list.do";
			}
	   // 10버전 ==> javax.servlet.http  ==> 
	   @GetMapping("store/detail.do")
	   public String store_detail(int s_no,String c_no,Model model,HttpSession session)
	   {
		   String id=(String)session.getAttribute("id");
		   Map map=new HashMap();
		   map.put("s_no", s_no);
		   map.put("c_no", c_no);
		   map.put("id", id);
		   StoreVO vo=dao.storeDetailData(map);
		   vo.setStore_price(Integer.parseInt(vo.getFirst_price().replaceAll("[^0-9]", "").trim()));
		   model.addAttribute("vo",vo);
		   model.addAttribute("s_no", s_no);
		   model.addAttribute("c_no",c_no);
//		   
//		   String id=(String)session.getAttribute("id");
//		  
//	 	   String[] c_no_={"","g_no","s_no"};
//			Map map=new HashMap();
//			
//			if(id!=null) {
//				map.put("s_no",c_no_[no_type]);
//				map.put("id", id);
//				int lcount=ldao.likeCheck(map);
//				model.addAttribute("lcount",lcount);
//			}	else {
//				 map.put("s_no", s_no);
//				 map.put("c_no", c_no);
//			}
//			
//			StoreVO vo=dao.storeDetailData(map);
//			vo.setStore_price(Integer.parseInt(vo.getFirst_price().replaceAll("[^0-9]", "").trim()));
//			
//			model.addAttribute("vo", vo);
//			model.addAttribute("s_no", s_no);
//			model.addAttribute("c_no",c_no);
//			model.addAttribute("no_type", no_type);
		   return "store/detail";
	   }
	// 좋아요
//		@GetMapping("store/LikeInsert.do")
//		public String store_like_insert(int s_no,HttpSession session)
//		{
//			String id=(String)session.getAttribute("id");
//			Map map=new HashMap();
//			map.put("s_no", s_no);
//			map.put("id", id);
//			ldao.S_LikeInsert(s_no, map);
//			
//			return "redirect:../store/store_detail.do?s_no="+s_no;
//			
//		}
//		@GetMapping("store/DisLikeInsert.do")
//		public String store_dislike_insert(int s_no,HttpSession session)
//		{
//			String id=(String)session.getAttribute("id");
//			Map map=new HashMap();
//			map.put("s_no", s_no);
//			map.put("id", id);
//			ldao.S_LikeDelete(s_no, map);
//			
//			return "redirect:../store/store_detail.do?s_no="+s_no;
//			
//		}
}

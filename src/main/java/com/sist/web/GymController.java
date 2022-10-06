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
import com.sist.dao.GymDAO;
import com.sist.vo.GymVO;

@Controller
public class GymController {
	@Autowired
	private GymDAO dao;
	
	@Autowired
	private DoitLikeDAO ldao;
	
	@GetMapping("gym/gym_list.do")
	public String gym_list()
	{
		return "gym/gym_list";
	}
	
	// 상세보기
	@GetMapping("gym/gym_detail.do")
	public String gym_detail(int g_no,Model model,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		Map map=new HashMap();
		GymVO vo=dao.gymDetailData(g_no);
		
		if(id!=null) {
			map.put("g_no", g_no);
			map.put("id", id);
			int lcount=ldao.likeCheck(map);
			model.addAttribute("lcount",lcount);
		}		
		
		model.addAttribute("vo", vo);
		model.addAttribute("g_no", g_no);
		return "gym/gym_detail";
	}
	// 쿠키생성
	@GetMapping("gym/gym_detail_before.do")
	public String gym_detail_before(int g_no,RedirectAttributes ra,HttpServletResponse response)
	{
		Cookie cookie=new Cookie("gym"+g_no, String.valueOf(g_no));
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		ra.addAttribute("g_no", g_no);
		return "redirect:../gym/gym_detail.do";
	}
	// 쿠키삭제
	@GetMapping("gym/gym_cookie_delete.do")
	public String gym_cookie_delete(HttpServletResponse response,HttpServletRequest request)
	{
		 Cookie[] cookies=request.getCookies();
		   for(int i=cookies.length-1;i>=0;i--)
		   {
			   if(cookies[i].getName().startsWith("gym"))
			   {
				   cookies[i].setPath("/");
				   cookies[i].setMaxAge(0);
				   response.addCookie(cookies[i]);
			   }
		   }
		   
		return "redirect:../gym/gym_list.do";
	}
	// 좋아요
	@GetMapping("gym/LikeInsert.do")
	public String gym_like_insert(int g_no,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		Map map=new HashMap();
		map.put("g_no", g_no);
		map.put("id", id);
		ldao.LikeInsert(g_no, map);
		
		return "redirect:../gym/gym_detail.do?g_no="+g_no;
		
	}
	@GetMapping("gym/DisLikeInsert.do")
	public String gym_dislike_insert(int g_no,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		Map map=new HashMap();
		map.put("g_no", g_no);
		map.put("id", id);
		ldao.LikeDelete(g_no, map);
		
		return "redirect:../gym/gym_detail.do?g_no="+g_no;
		
	}
	
	
}

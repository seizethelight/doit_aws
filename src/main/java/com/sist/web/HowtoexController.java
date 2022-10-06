package com.sist.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestMapping;
import com.sist.vo.HowtoexVO;

@Controller
public class HowtoexController {
@GetMapping("doex/howtoex_list.do")
public String howtoex_list()
	{	
		return "doex/howtoex_list";
}

@GetMapping("doex/howtoex_detail.do")
public String howtoex_detail(int ex_no,Model model)
{
	Map map=new HashMap();	
	map.put("ex_no", ex_no);
	model.addAttribute("ex_no", ex_no);
	return "doex/howtoex_detail";
}

@GetMapping("doex/howtoex_find.do")
public String howtoex_find()
{
	 return "doex/howtoex_find";
}



@GetMapping("doex/howtoex_detail_before.do")
public String howtoex_detail_before(int ex_no,RedirectAttributes ra2,HttpServletResponse response)
{
	Cookie cookie=new Cookie("howtoex"+ex_no, String.valueOf(ex_no));
	cookie.setPath("/");
	cookie.setMaxAge(60*60*24);
	response.addCookie(cookie);
	ra2.addAttribute("ex_no", ex_no);
	return "redirect:../doex/howtoex_detail.do";
}

@GetMapping("doex/howtoex_cookie_delete.do")
public String howtoex_cookie_delete(HttpServletResponse response,HttpServletRequest request)
{
	 Cookie[] cookies=request.getCookies();
	   for(int i=cookies.length-1;i>=0;i--)
	   {
		   if(cookies[i].getName().startsWith("howtoex"))
		   {
			   cookies[i].setPath("/");
			   cookies[i].setMaxAge(0);
			   response.addCookie(cookies[i]);
		   }
	   }
	   
	return "redirect:../doex/howtoex_list.do";
}

}
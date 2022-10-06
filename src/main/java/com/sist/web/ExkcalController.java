package com.sist.web;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.vo.ExkcalVO;
import com.sist.dao.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ExkcalController {
	@GetMapping("doex/exkcal_list.do")
	public String exkcal_list()
	{
		return "doex/exkcal_list";
	}
	
	
	@GetMapping("doex/exkcal_detail.do")
	public String exkcal_detail(int e_no,Model model)
	{	
		Map map=new HashMap();	
		map.put("e_no", e_no);
		model.addAttribute("e_no", e_no);
		return "doex/exkcal_detail";
	}
}
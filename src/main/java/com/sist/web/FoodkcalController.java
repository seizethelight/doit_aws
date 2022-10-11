package com.sist.web;

import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.vo.FoodkcalVO;
import com.sist.dao.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FoodkcalController {
	@GetMapping("doex/foodkcal_list.do")
	public String foodkcal_list()
	{
		return "doex/foodkcal_list";
	}
	
	
	@GetMapping("doex/foodkcal_detail.do")
	public String foodkcal_detail(int f_no,int type,Model model)
	{	
		Map map=new HashMap();	
		map.put("f_no", f_no);
		model.addAttribute("f_no", f_no);
		model.addAttribute("type", type);
		return "doex/foodkcal_detail";
		
	}
}
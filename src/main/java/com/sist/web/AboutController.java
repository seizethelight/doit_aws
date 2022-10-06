package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AboutController {
	@GetMapping("about/about.do")
	public String about_about(String no, Model model)
	{
		return "about/about";
	}
}

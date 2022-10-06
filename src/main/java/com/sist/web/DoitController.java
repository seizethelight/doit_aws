package com.sist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DoitController {
	 @GetMapping("doit/pay_list.do")
	   public String pay_list()
	   {
		   return "doit/pay_list"; 
	   }
}

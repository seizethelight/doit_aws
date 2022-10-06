package com.sist.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.sist.dao.AdminDAO;
import com.sist.vo.MemberVO;

@Controller
public class AdminController {
	@Autowired
	private AdminDAO dao;
	
	@GetMapping("admin/userinfo.do")
	public String userinfo(String page, Model model,HttpSession session)
	{
		List<MemberVO> list=dao.userinfoList();
		model.addAttribute("list", list);
		return "admin/userinfo";
	}
	@GetMapping("admin/community.do")
	public String community()
	{
		return "admin/community";
	}
}

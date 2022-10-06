package com.sist.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.AdminDAO;

@RestController
public class AdminRestController {
	@Autowired
	private AdminDAO dao;
	
	@PostMapping("admin/userinfo_ok.do")
	public String userUpdate(String id,String admin)
	{
		Map map=new HashMap();
		map.put("id", id);
		map.put("admin", admin);
		System.out.println(id);
		System.out.println(admin);
		dao.userUpdate(map);
		return "OK";
	}
}

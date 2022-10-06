package com.sist.web;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.MypageDAO;
import com.sist.vo.MemberVO;

@RestController
public class MypageRestController {
	@Autowired
	private MypageDAO dao;
	
	@GetMapping(value="mypage/myinfo_vue.do",produces="text/plain;charset= UTF-8")
	public String myinfo(HttpSession session)
	{
		String result="";
		try
		{
			String id=(String)session.getAttribute("id");
			System.out.println(id);
			MemberVO vo=dao.myinfo(id);
			JSONObject obj=new JSONObject();
			
			obj.put("id", vo.getId());
			obj.put("name", vo.getName());
			obj.put("sex", vo.getSex());
			obj.put("birth", vo.getBirth());
			obj.put("email", vo.getEmail());
			obj.put("zipcode", vo.getZipcode());
			obj.put("addr1", vo.getAddr1());
			obj.put("addr2", vo.getAddr2());
			obj.put("phone", vo.getPhone());
			
			result=obj.toJSONString();
		}catch(Exception ex) 
		 {
			 ex.printStackTrace();
		 }
		 return result;
	}
}

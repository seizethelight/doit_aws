package com.sist.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.dao.*;
import com.sist.vo.*;

@Controller
public class MypageController {
	@Autowired
	private MypageDAO dao;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@GetMapping("mypage/info_before.do")//수정하기 전 비밀번호 입력
	 public String info_before(Model model)
	 {
	      return "mypage/info_before";
	 }
	 @GetMapping("mypage/info_before_ok.do")
	 @ResponseBody
	 public String info_before_ok(String pw,HttpSession session)
	 {
		   String id=(String)session.getAttribute("id");
		   String result="";
		   String db_pwd=dao.memberGetPassword(id);
		   if(encoder.matches(pw, db_pwd))
		   {
			   result="yes";
		   }
		   else
		   {
			   result="no";
		   }
		   return result;
	 }
	@GetMapping("mypage/myinfo") //내정보
	public String myinfo(String id,Model model)
	{
		return "mypage/myinfo";
	}
	@GetMapping("mypage/info_update") //내정보수정
	public String info_update(Model model,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		MemberVO vo=dao.memberUpdateData(id);
		model.addAttribute("vo", vo);
		return "mypage/info_update";
	}
	@PostMapping("mypage/info_update_ok.do")
	public String info_update_ok(MemberVO vo,HttpSession session)
	{
	   //DB연동 
	   dao.memberUpdate(vo);
	   session.setAttribute("name", vo.getName());
	   return "redirect:../mypage/myinfo.do";
	}
	@GetMapping("mypage/myactivity") //내활동
	public String myActivity()
	{
		return "mypage/myactivity";
	}
	
	@GetMapping("mypage/payment")
	public String myPayment()
	{
		return "mypage/payment";
	}
	
	@RequestMapping("mypage/mylike.do")
	public String myLike(Model model,HttpSession session)
	{
		String id=(String)session.getAttribute("id");
		List<LikeVO> list=dao.myPageLikeData(id);

		model.addAttribute("list", list);
		return "mypage/mylike";
	}
}

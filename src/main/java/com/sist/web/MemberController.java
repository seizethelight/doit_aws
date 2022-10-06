package com.sist.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
// 커스터마이징 , 리팩토링  
@Controller
public class MemberController {
   @Autowired
   private MemberDAO dao;
   
   @Autowired
   private BCryptPasswordEncoder encoder;
   
   @GetMapping("member/join.do")
   public String member_join(Model model)
   {
	   return "member/join";//forward => request를 전송 
   }
   
   @PostMapping("member/join_ok.do")
   public String member_join_ok(MemberVO vo)
   {
	   String en=encoder.encode(vo.getPw());// 암호화 
	   vo.setPw(en);
	   System.out.println("pwd"+vo.getPw());
	   System.out.println("birth"+vo.getBirth());
       dao.memberJoinInsert(vo);	   
	   return "redirect:../main/main.do"; //재전송 (sendRedirect()) => request초기화 
   }
   
   @PostMapping("member/idcheck.do")
   @ResponseBody
   // JSP파일명 , .do 전송 ==> 일반 데이터, JSON ==> @RestController
   public String member_idcheck(String id)
   {
	   String result="";
	   int count=dao.memberIdCheck(id);
	   if(count==0)
	   {
		   result="YES";
	   }
	   else
	   {
		   result="NO";
	   }
	   return result;
   }
   @GetMapping("member/login.do")
   public String member_login(Model model)
   {
	   return "member/login";
   }
   
   @PostMapping("member/login_ok.do")
   @ResponseBody //결과값만 송출 시 사용
   public String member_login_ok(String id, String pw,boolean ck, HttpSession session,HttpServletResponse response)
   {
	   String result="";
	   int count=dao.memberIdCheck(id);
	   if(count==0)
	   {
		   result="NOID";
	   }
	   else
	   {
		   MemberVO vo=dao.memberJoinInfoData(id);
		   if(encoder.matches(pw, vo.getPw())) //암호화된 비번과 비교
		   {
			   session.setAttribute("id", id);
			   session.setAttribute("name", vo.getName());
			   session.setAttribute("admin", vo.getAdmin());
			   if(ck==true)
			   {
				   Cookie cookie=new Cookie("id", id);
				   cookie.setPath("/");
				   cookie.setMaxAge(60*60*24);
				   response.addCookie(cookie);
				   ////////////////////////////////
				   cookie=new Cookie("name", vo.getName());
				   cookie.setPath("/");
				   cookie.setMaxAge(60*60*24);
				   response.addCookie(cookie);
				   ///////////////////////////////
				   cookie=new Cookie("admin", vo.getAdmin());
				   cookie.setPath("/");
				   cookie.setMaxAge(60*60*24);
				   response.addCookie(cookie);
			   }
			   result="OK";
		   }
		   else
		   {
			   result="NOPW";
		   }
	   }
	   return result;
   }
   
   @GetMapping("member/logout.do")
   public String member_logout(HttpSession session)
   {
	   session.invalidate();
	   return "redirect:../main/main.do";
   }
}




































package com.sist.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sist.dao.PostDAO;
import com.sist.vo.NewsVO;

@Controller
public class PostController {
	@Autowired
	private PostDAO dao;

	@GetMapping("post/post.do")
	public String post_post()
	{
		return "postmain";
	}
	
	//********	자유게시판 ********//
	@GetMapping("post/forum.do")
	public String post_forum()
	{
		return "post/forum";
	}
	
	@GetMapping("post/forum_detail.do")
	public String post_forum_detail(int f_no, Model model)
	{
		model.addAttribute("f_no", f_no);
		return "post/forum_detail";
	}
	
	@GetMapping("post/forum_insert.do")
	public String forum_insert(NewsVO vo,HttpSession session)
	{
		
		return "post/forum_insert";
	}
	
	//news edit
	@GetMapping("post/forum_edit.do")
	public String forum_edit(int f_no, Model model)
	{
		model.addAttribute("f_no", f_no);
		return "post/forum_edit";
	}
	
	
	//********	뉴스 ********//
	@GetMapping("post/news.do")
	public String post_news(String no, Model model)
	{
		return "post/news";
	}
	
	@GetMapping("post/news_detail.do")
	public String post_news_detail(int n_no, Model model, HttpSession session)
	{	
//		String sid=(String)session.getAttribute("id");
//		Map map=new HashMap();
//		NewsVO vo=dao.newsDetailData(n_no);
//		int l_no=dao.likeCheck(map);
//		
//		map.put("n_no", n_no);
//		map.put("sid", sid);
//		model.addAttribute("l_no", l_no);
		model.addAttribute("n_no", n_no);
		
		return "post/news_detail";
	}
	
	// news insert
	@GetMapping("post/news_insert.do")
	public String news_insert()
	{
		return "post/news_insert";
	}
	
	// news edit
	@GetMapping("post/news_edit.do")
	public String news_edit(int n_no, Model model)
	{
		model.addAttribute("n_no", n_no);
		return "post/news_edit";
	}
	
	//********	블로그 ********//
	@GetMapping("post/blog.do")
	public String post_blog(String b_no, Model model)
	{
		return "post/blog";
	}
	@GetMapping("post/blog_detail.do")
	public String post_blog_detail(int b_no, Model model)
	{
		model.addAttribute("b_no", b_no);
		return "post/blog_detail";
	}
	
	@GetMapping("post/blog_edit.do")
	public String post_blog_edit(int b_no, Model model)
	{
		model.addAttribute("b_no", b_no);
		return "post/blog_edit";
	}
	
	//********	문의 ********//
	@GetMapping("post/qna.do")
	public String qna_list()
	{
		return "post/qna";
	}
	
	@GetMapping("post/qna_insert.do")
	public String qna_insert()
	{
		return "post/qna_insert";
	}
	
	// qna detail
	@GetMapping("post/qna_detail.do")
	public String post_qna_detail(int q_no, Model model)
	{
		model.addAttribute("q_no", q_no);
		return "post/qna_detail";
	}
	
	// qna edit
	@GetMapping("post/qna_edit.do")
	public String qna_edit(int q_no, Model model)
	{
		model.addAttribute("q_no", q_no);
		return "post/qna_edit";
	}
	
	
	

}
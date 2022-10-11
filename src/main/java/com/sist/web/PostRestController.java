package com.sist.web;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sist.dao.PostDAO;
import com.sist.vo.BlogReplyVO;
import com.sist.vo.BlogVO;
import com.sist.vo.CartVO;
import com.sist.vo.ForumReplyVO;
import com.sist.vo.ForumVO;
import com.sist.vo.NewsLikeVO;
import com.sist.vo.NewsVO;
import com.sist.vo.QnaVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RestController
public class PostRestController {
	@Autowired
	private PostDAO dao;
	
	/**************** qna ****************/
	// qna 리스트
	@GetMapping(value = "post/qna_list.do", produces = "text/plain;charset=utf-8")
	public String qna_list(String page, HttpServletRequest request) {
		String result = "";
		try {
			if (page == null)
				page = "1";
			int curpage = Integer.parseInt(page);
			Map map = new HashMap();
			int rowSize = 10;
			int start = (rowSize * curpage) - (rowSize - 1);
			int end = rowSize * curpage;
			map.put("start", start);
			map.put("end", end);

			List<QnaVO> list = dao.qnaListData(map);
			int totalpage = dao.qnaTotalPage();
			final int BLOCK=5;
			int startPage=((curpage-1)/BLOCK*BLOCK)+1;
			int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			
			if(endPage>totalpage)
					endPage=totalpage;
			
			JSONArray arr = new JSONArray();
			int k = 0;
			for (QnaVO vo : list) {
				JSONObject obj = new JSONObject();
				obj.put("q_no", vo.getQ_no());
				obj.put("title", vo.getTitle());
				obj.put("id", vo.getId());
				obj.put("dbday", vo.getDbday());
				obj.put("hit", vo.getHit());

				if (k == 0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
				}
				arr.add(obj);
				k++;

			}
			result = arr.toJSONString();
		} catch (Exception e) {
		}
		return result;
	}

	// qna insert
	@GetMapping(value = "post/qna_insert.do", produces = "text/plain;charset=utf-8")
	public String post_qna_insert(QnaVO vo, HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		dao.qnaInsertData(vo);
		return "OK";
	}

	// qna detail
	@GetMapping(value = "post/qna_detail.do", produces = "text/plain;charset=utf-8")
	public String qna_detail(int q_no) {
		String result = "";
		QnaVO vo = dao.qnaDetailData(q_no);
		JSONObject obj = new JSONObject();
		obj.put("q_no", vo.getQ_no());
		obj.put("title", vo.getTitle());
		obj.put("id", vo.getId());
		obj.put("content", vo.getContent());
		obj.put("dbday", vo.getDbday());
		obj.put("hit", vo.getHit());
		obj.put("editeddate", vo.getEditeddate());

		result = obj.toJSONString();
		return result;
	}

	// qna edit
	@GetMapping(value = "post/qna_edit.do", produces = "text/plain;charset=utf-8")
	public String qna_edit(int q_no) {
		String result = "";
		QnaVO vo = dao.qnaEditData(q_no);
		JSONObject obj = new JSONObject();
		
		obj.put("q_no", vo.getQ_no());
		obj.put("title", vo.getTitle());
		obj.put("id", vo.getId());
		obj.put("content", vo.getContent());
		obj.put("hit", vo.getHit());
		obj.put("dbday", vo.getDbday());
		result = obj.toJSONString();
		return result;
	}

	@GetMapping(value = "post/qna_edit_vue.do", produces = "text/plain;charset=utf8")
	public String qna_edit_vue(QnaVO vo) {
		String result = dao.qnaEdit(vo);
		return result;
	}

	// qna delete
	@GetMapping(value = "post/qna_delete.do", produces = "text/plain;charset=utf-8")
	public String qna_delete(int q_no) {
		String result = dao.qnaDeleteData(q_no);
		return result;
	}

	/**************** news ****************/
	// news list
	@GetMapping(value = "post/news_list.do", produces = "text/plain;charset=utf-8")
	public String news_list(String page) {
		String result = "";
		try {
			if (page == null)
				page = "1";
			int curpage = Integer.parseInt(page);
			Map map = new HashMap();
			int rowSize = 10;
			int start = (rowSize * curpage) - (rowSize - 1);
			int end = rowSize * curpage;
			map.put("start", start);
			map.put("end", end);

			List<NewsVO> list = dao.newsListData(map);
			int totalpage = dao.newsTotalPage();

			JSONArray arr = new JSONArray();
			int k = 0;
			for (NewsVO vo : list) {
				JSONObject obj = new JSONObject();
				obj.put("n_no", vo.getN_no());
				obj.put("title", vo.getTitle());
				obj.put("content", vo.getContent());
				obj.put("id", vo.getId());
				obj.put("dbday", vo.getDbday());
				obj.put("hit", vo.getHit());
				obj.put("cate", vo.getCate());

				if (k == 0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
				}
				arr.add(obj);
				k++;

			}
			result = arr.toJSONString();
		} catch (Exception e) {
		}
		return result;
	}

	// news insert
	@GetMapping(value = "post/news_insert.do", produces = "text/plain;charset=utf-8")
	public String post_news_insert(NewsVO vo) {
		dao.newsInsertData(vo);
		return "OK";
	}

	// news detail
	@GetMapping(value = "post/news_detail.do", produces = "text/plain;charset=utf-8")
	public String news_detail(int n_no, Model model, HttpSession session) {
		String result = "";
		NewsVO vo = dao.newsDetailData(n_no);
		JSONObject obj = new JSONObject();
		String sid=(String)session.getAttribute("id");
		
		Map map=new HashMap();
		map.put("n_no", n_no);
		map.put("id", sid);
		int lCheck=dao.likeCheck(map);
		
		obj.put("n_no", vo.getN_no());
		obj.put("title", vo.getTitle());
		obj.put("id", vo.getId());
		obj.put("content", vo.getContent());
		obj.put("dbday", vo.getDbday());
		obj.put("hit", vo.getHit());
		obj.put("etdate", vo.getEtdate());
		obj.put("cate", vo.getCate());
		obj.put("lCheck", lCheck);

		result = obj.toJSONString();
		return result;
	}

	// news edit
	@GetMapping(value = "post/news_edit.do", produces = "text/plain;charset=utf-8")
	public String news_edit(int n_no, String title) {
		String result = "";
		NewsVO vo = dao.newsEditData(n_no);
		JSONObject obj = new JSONObject();
		obj.put("n_no", vo.getN_no());
		obj.put("title", vo.getTitle());
		obj.put("id", vo.getId());
		obj.put("content", vo.getContent());
		obj.put("hit", vo.getHit());
		obj.put("dbday", vo.getDbday());
		obj.put("edate", vo.getEtdate());
		System.out.println(vo.getTitle());
		result = obj.toJSONString();
		return result;
	}

	@GetMapping(value = "post/news_edit_vue.do", produces = "text/plain;charset=utf8")
	public String news_edit_vue(NewsVO vo) {
		String result = dao.newsEdit(vo);
		return result;
	}

	// news top
	@GetMapping(value = "post/news_top.do", produces = "text/plain;charset=utf-8")
	public String news_top() {
		String result = "";
		List<NewsVO> list = dao.newsTop();

		JSONArray arr = new JSONArray();
		for (NewsVO fvo : list) {
			JSONObject obj = new JSONObject();
			obj.put("n_no", fvo.getN_no());
			obj.put("title", fvo.getTitle());
			String content = fvo.getContent();
			if(content.length()>40) {
				content = content.substring(0,20)+"...";
				fvo.setContent(content);
			}
			obj.put("content", fvo.getContent());
			obj.put("id", fvo.getId());
			obj.put("dbday", fvo.getDbday());
			obj.put("hit", fvo.getHit());
			arr.add(obj);
		}
		// result에 arr 추가해줘야함
		result = arr.toJSONString();
		return result;
	}

	// news delete
	@GetMapping(value = "post/news_delete.do", produces = "text/plain;charset=utf-8")
	public String news_delete(int n_no) {
		String result = dao.newsDeleteData(n_no);
		return result;
	}
	
	// news like insert
	@GetMapping(value = "post/news_like_insert.do", produces = "text/plain;charset=utf-8")
	public String post_news_like_insert(NewsLikeVO vo, Map map, HttpSession session) 
	{	
		String id = (String) session.getAttribute("id");
		map.put("id", id);
		map.put("n_no", vo.getN_no());
		dao.newsLikeInsert(map);
		return "OK";
	}
	
	// news like cancel
	@GetMapping(value = "post/news_like_cancel.do", produces = "text/plain;charset=utf-8")
	public String post_news_like_cancel(NewsLikeVO vo, Map map, HttpSession session) 
	{	
		String id = (String) session.getAttribute("id");
		map.put("id", id);
		map.put("n_no", vo.getN_no());
		dao.newsLikeCancel(map);
		return "OK";
	}

	/**************** blog ****************/
	// blog list
	@GetMapping(value = "post/blog_list.do", produces = "text/plain;charset=utf-8")
	public String blog_list(String page) {
		String result = "";
		try {
			if (page == null)
				page = "1";
			int curpage = Integer.parseInt(page);
			Map map = new HashMap();
			int rowSize = 10;
			int start = (rowSize * curpage) - (rowSize - 1);
			int end = rowSize * curpage;
			map.put("start", start);
			map.put("end", end);

			List<BlogVO> list = dao.blogListData(map);
			int totalpage = dao.blogTotalPage();

			JSONArray arr = new JSONArray();
			int k = 0;
			for (BlogVO vo : list) {
				JSONObject obj = new JSONObject();
				obj.put("b_no", vo.getB_no());
				obj.put("title", vo.getTitle());
				obj.put("content", vo.getContent());
				obj.put("id", vo.getId());
				obj.put("dbday", vo.getDbday());
				obj.put("hit", vo.getHit());
				obj.put("cate", vo.getCate());
				obj.put("img", vo.getImg());

				if (k == 0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
				}
				arr.add(obj);
				k++;

			}
			result = arr.toJSONString();
		} catch (Exception e) {
		}
		return result;
	}

	// blog detail
	@GetMapping(value = "post/blog_detail.do", produces = "text/plain;charset=utf-8")
	public String blog_detail(int b_no) {
		String result = "";
		BlogVO vo = dao.blogDetailData(b_no);
		JSONObject obj = new JSONObject();

		obj.put("b_no", vo.getB_no());
		obj.put("title", vo.getTitle());
		obj.put("content", vo.getContent());
		obj.put("id", vo.getId());
		obj.put("dbday", vo.getDbday());
		obj.put("hit", vo.getHit());
		obj.put("cate", vo.getCate());
		obj.put("img", vo.getImg());
		
		result = obj.toJSONString();
		return result;
	}
	
	// blog_insert
	@GetMapping(value = "post/blog_insert.do", produces = "text/plain;charset=utf-8")
	public String post_blog_insert(BlogVO vo) {
		dao.blogInsertData(vo);
		return "OK";
	}
	// blog delete
	@GetMapping(value = "post/blog_delete.do", produces = "text/plain;charset=utf-8")
	public String blog_delete(int b_no) {
		String result = dao.blogDeleteData(b_no);
		return result;
	}

	// blog edit
	@GetMapping(value = "post/blog_edit.do", produces = "text/plain;charset=utf-8")
	public String blog_edit(int b_no) {
		String result = "";
		BlogVO vo = dao.blogEditData(b_no);
		JSONObject obj = new JSONObject();
		obj.put("b_no", vo.getB_no());
		obj.put("title", vo.getTitle());
		obj.put("id", vo.getId());
		obj.put("content", vo.getContent());
		obj.put("hit", vo.getHit());
		obj.put("dbday", vo.getDbday());
		result = obj.toJSONString();
		return result;
	}

	@GetMapping(value = "post/blog_edit_vue.do", produces = "text/plain;charset=utf8")
	public String blog_edit_vue(BlogVO vo) {
		String result = dao.blogEdit(vo);
		return result;
	}
	
	/**************** blog reply ****************/
	public String blog_reply_json_data(List<BlogReplyVO> list)
	{
		JSONArray arr = new JSONArray();
		for (BlogReplyVO bvo : list) {
			JSONObject obj = new JSONObject();
			obj.put("b_no", bvo.getB_no());
			obj.put("b_r_no", bvo.getB_r_no());
			obj.put("content", bvo.getContent());
			obj.put("id", bvo.getId());
			obj.put("dbday", bvo.getDbday());
			obj.put("dbtime", bvo.getDbtime());
			obj.put("pwd", bvo.getPwd());

			arr.add(obj);
		}
		return arr.toJSONString();
	}
	
	@GetMapping(value = "post/blog_reply_list.do", produces = "text/plain;charset=utf-8")
	public String blog_reply_list(int b_no, HttpSession session) {
		String id=(String)session.getAttribute("id");
		String result = "";
		BlogReplyVO vo=new BlogReplyVO();
		vo.setB_no(b_no);
		
		List<BlogReplyVO> list = dao.blogReplyListData(b_no);
		result = blog_reply_json_data(list);
		return result;
	}
	
	@GetMapping(value="post/blog_reply_insert.do", produces = "text/plain;charset=utf-8")
	public String blog_reply_insert(BlogReplyVO vo, HttpSession session)
	{
	   dao.blogReplyInsert(vo);
	   return "OK";
	}
	
	@GetMapping(value="post/blog_reply_delete.do", produces = "text/plain;charset=utf-8")
	public String blog_reply_delete(int b_r_no)
	{
		String result="";
		BlogReplyVO vo=new BlogReplyVO();
		dao.blogReplyDelete(b_r_no);
		
		List<BlogReplyVO> list=dao.blogReplyListData(vo.getB_no());
		result=blog_reply_json_data(list);
		return result;
	}
	
	
	/**************** forum ****************/
	// forum list
	@GetMapping(value = "post/forum_list.do", produces = "text/plain;charset=utf-8")
	public String forum_list(String page) {
		String result = "";
		try {
			if (page == null)
				page = "1";
			int curpage = Integer.parseInt(page);
			Map map = new HashMap();
			int rowSize = 10;
			int start = (rowSize * curpage) - (rowSize - 1);
			int end = rowSize * curpage;
			map.put("start", start);
			map.put("end", end);

			List<ForumVO> list = dao.forumListData(map);
			int totalpage = dao.forumTotalPage();

			JSONArray arr = new JSONArray();
			int k = 0;
			for (ForumVO vo : list) {
				JSONObject obj = new JSONObject();
				obj.put("f_no", vo.getF_no());
				obj.put("title", vo.getTitle());
				obj.put("content", vo.getContent());
				obj.put("id", vo.getId());
				obj.put("dbday", vo.getDbday());
				obj.put("hit", vo.getHit());
				obj.put("cate", vo.getCate());
				obj.put("img", vo.getImg());

				if (k == 0) {
					obj.put("curpage", curpage);
					obj.put("totalpage", totalpage);
				}
				arr.add(obj);
				k++;

			}
			result = arr.toJSONString();
		} catch (Exception e) {
		}
		return result;
	}

	// forum detail
	@GetMapping(value = "post/forum_detail.do", produces = "text/plain;charset=utf-8")
	public String forum_detail(int f_no, HttpSession session) {
		String result = "";
		ForumVO vo = dao.forumDetailData(f_no);
		JSONObject obj = new JSONObject();
		String sid = (String) session.getAttribute("id");
		
		obj.put("f_no", vo.getF_no());
		obj.put("title", vo.getTitle());
		obj.put("content", vo.getContent());
		obj.put("id", vo.getId());
		obj.put("dbday", vo.getDbday());
		obj.put("hit", vo.getHit());
		obj.put("etdate", vo.getEtdate());
		obj.put("sid", sid);
		obj.put("cate", vo.getCate());
		obj.put("img", vo.getImg());

		result = obj.toJSONString();
		return result;
	}

	@GetMapping(value = "post/forum_insert.do", produces = "text/plain;charset=utf-8")
	public String post_forum_insert(ForumVO vo) {
		dao.forumInsert(vo);
		return "OK";
	}
	
	// forum delete
	@GetMapping(value = "post/forum_delete.do", produces = "text/plain;charset=utf-8")
	public String forum_delete(int f_no) {
		String result = dao.forumDeleteData(f_no);
		return result;
	}
	// forum edit
	@GetMapping(value = "post/forum_edit.do", produces = "text/plain;charset=utf-8")
	public String forum_edit(int f_no) {
		String result = "";
		ForumVO vo = dao.forumEditData(f_no);
		JSONObject obj = new JSONObject();
		obj.put("f_no", vo.getF_no());
		obj.put("title", vo.getTitle());
		obj.put("id", vo.getId());
		obj.put("content", vo.getContent());
		obj.put("hit", vo.getHit());
		obj.put("dbday", vo.getDbday());
		result = obj.toJSONString();
		return result;
	}

	@GetMapping(value = "post/forum_edit_vue.do", produces = "text/plain;charset=utf8")
	public String forum_edit_vue(ForumVO vo) {
		String result = dao.forumEdit(vo);
		return result;
	}
	
	/**************** forum reply ****************/
	public String reply_json_data(List<ForumReplyVO> list,String id)
	{
		JSONArray arr = new JSONArray();
		for (ForumReplyVO rvo : list) {
			JSONObject obj = new JSONObject();
			obj.put("f_no", rvo.getF_no());
			obj.put("f_r_no", rvo.getF_r_no());
			obj.put("content", rvo.getContent());
			obj.put("id", rvo.getId());
			obj.put("dbday", rvo.getDbday());
			obj.put("group_id", rvo.getGroup_id());
			obj.put("group_tab", rvo.getGroup_tab());
			obj.put("group_step", rvo.getGroup_step());
			obj.put("sessionId", id);
			arr.add(obj);
		}
		return arr.toJSONString();
	}
	@GetMapping(value="post/reply_insert.do", produces = "text/plain;charset=utf-8")
	public String reply_insert(ForumReplyVO vo, HttpSession session)
	{
	   dao.forumReplyInsert(vo);
	   return "OK";
	}
	
	@GetMapping(value="post/reply_delete.do", produces = "text/plain;charset=utf-8")
	public String reply_delete(int f_r_no)
	{
		String result = dao.forumDeleteData(f_r_no);
		return result;
	   
	}
			
	@GetMapping(value = "post/reply_list.do", produces = "text/plain;charset=utf-8")
	public String reply_list(int f_no, HttpSession session) {
		String sid=(String)session.getAttribute("id");
		String result = "";
		ForumReplyVO vo=new ForumReplyVO();
		vo.setF_no(f_no);
		List<ForumReplyVO> list = dao.replyListData(f_no);
		result = reply_json_data(list, sid);
		return result;
	}
	
}

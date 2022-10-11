package com.sist.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.PostMapper;
import com.sist.vo.BlogVO;
import com.sist.vo.ForumVO;
import com.sist.vo.NewsLikeVO;
import com.sist.vo.NewsVO;
import com.sist.vo.QnaVO;
import com.sist.vo.ForumReplyVO;

@Repository
public class PostDAO {
	@Autowired
	private PostMapper mapper;
	
	
	//*********** qna ***********//	
	// qna list
	public List<QnaVO> qnaListData(Map map)
	{
		return mapper.qnaListData(map);
	}
	
	public int qnaTotalPage()
	{
		return mapper.qnaTotalPage();
	}
	
	// qna insert
	public void qnaInsertData(QnaVO vo)
	{
		mapper.qnaInsertData(vo);
	}
	
	// qna detail
	public QnaVO qnaDetailData(int q_no)
	{
		mapper.qnaHitIncrement(q_no);
		return mapper.qnaDetailData(q_no);
	}

	// qna edit
	public QnaVO qnaEditData(int q_no)
	{
		return mapper.qnaDetailData(q_no);
	}
	
	public String qnaEdit(QnaVO vo)
	{
		String result="yes";
		mapper.qnaEdit(vo);
		return result;
	}
	
	// qna delete
	public String qnaDeleteData(int q_no)
	{
		return mapper.qnaDeleteData(q_no);
	}
	
	//*********** 뉴스 ***********//	
	// news detail
	public NewsVO newsDetailData(int n_no)
	{
		mapper.newsHitIncrement(n_no);
		return mapper.newsDetailData(n_no);
	}
	
	//news top
	public List<NewsVO> newsTop()
	{
		return mapper.newsTop();
	}
	
	// news list
	public List<NewsVO> newsListData(Map map)
	{
		return mapper.newsListData(map);
	}
	public int newsTotalPage()
	{
		return mapper.newsTotalPage();
	}
	
	// news delete
	public String newsDeleteData(int n_no)
	{
		return mapper.newsDeleteData(n_no);
	}
	
	// news insert
	public void newsInsertData(NewsVO vo)
	{
		mapper.newsInsertData(vo);
	}
	
	// news edit
	public NewsVO newsEditData(int n_no)
	{
		return mapper.newsDetailData(n_no);
	}
	
	public String newsEdit(NewsVO vo)
	{
		String result="yes";
		mapper.newsEdit(vo);
		return result;
	}
	// news like count
	public int likeCheck(Map map)
	{
		return mapper.likeCheck(map);
	}
	// news like
	public void newsLikeInsert(Map map)
	{
		mapper.newsLikeInsert(map);
	}
	// news like cancel
	public void newsLikeCancel(Map map)
	{
		mapper.newsLikeCancel(map);
	}
	
	//*********** 블로그 ***********//	
	// blog list
	public List<BlogVO> blogListData(Map map)
	{
		return mapper.blogListData(map);
	}
	
	public int blogTotalPage()
	{
		return mapper.blogTotalPage();
	}
	
	// blog insert
	public void blogInsertData(BlogVO vo)
	{
		mapper.blogInsertData(vo);
	}
	// blog detail
	public BlogVO blogDetailData(int b_no)
	{
		mapper.blogHitIncrement(b_no);
		return mapper.blogDetailData(b_no);
	}
	// blog delete
	public String blogDeleteData(int b_no)
	{	
		String result="yes";
		mapper.blogDeleteData(b_no);
		return result;
	}
	// blog edit
	public BlogVO blogEditData(int b_no)
	{
		return mapper.blogDetailData(b_no);
	}
	
	public String blogEdit(BlogVO vo)
	{
		String result="yes";
		mapper.blogEdit(vo);
		return result;
	}
	
	//*********** 자유게시판 ***********//	
	//forum list
	public List<ForumVO> forumListData(Map map)
	{
		return mapper.forumListData(map);
	}
	
	public int forumTotalPage()
	{
		return mapper.forumTotalPage();
	}
	
	// forum detail
	public ForumVO forumDetailData(int f_no)
	{
		mapper.forumHitIncrement(f_no);
		return mapper.forumDetailData(f_no);
	}
	
	// forum insert
	public void forumInsert(ForumVO vo)
	{
		mapper.forumInsert(vo);
	}
	
	// forum reply list
	public List<ForumReplyVO> replyListData(int f_no)
	{
		return mapper.replyListData(f_no);
	}
	// forum delete
	public String forumDeleteData(int f_no)
	{
		String result="yes";
		mapper.forumDeleteData(f_no);
		return result;
	}
	
	// forum edit
	public ForumVO forumEditData(int f_no)
	{
		return mapper.forumDetailData(f_no);
	}
	
	public String forumEdit(ForumVO vo)
	{
		String result="yes";
		mapper.forumEdit(vo);
		return result;
	}
	
	//*********** 자유게시판 댓글 ***********//	
	public void forumReplyInsert(ForumReplyVO vo)
	{
		mapper.forumReplyInsert(vo);
	}
	public String forumReplyDelete(int f_r_no)
	{
		String result="yes";
		mapper.forumReplyDelete(f_r_no);
		return result;
	}
	
	//*********** 개인 로그 ***********//		
	// my list
	public void myListData(ForumVO fvo)
	{
		mapper.myListData(fvo);
	}

	
}

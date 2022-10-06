package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.BlogVO;
import com.sist.vo.ForumVO;
import com.sist.vo.NewsVO;
import com.sist.vo.QnaVO;
import com.sist.vo.ReplyVO;

import lombok.Delegate;
import oracle.net.aso.f;

public interface PostMapper {
	
	//*********** 질문 ***********//
	@Select("SELECT q_no, hit, title, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, id, num "
			+ "FROM (SELECT q_no, hit, title, regdate, id, rownum as num "
			+ "FROM (SELECT q_no, hit, title, regdate, id  "
			+ "FROM T4_QNA ORDER BY q_no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<QnaVO> qnaListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM T4_QNA")
	public int qnaTotalPage();
	
	// qna 추가
	@SelectKey(keyProperty = "q_no", resultType = int.class, before = true,
			statement = "SELECT NVL(MAX(q_no)+1,1) as q_no FROM t4_qna")
	@Insert("INSERT INTO t4_qna VALUES(#{q_no}, #{title}, #{content} ,SYSDATE, 0, 0, 0, 0, #{id} )")
	public void qnaInsertData(QnaVO vo);
	
	// qna 디테일
	@Select("SELECT q_no, title, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, TO_CHAR(editeddate, 'YYYY-MM-DD hh:mm:ss') as etdate , id, content FROM T4_QNA WHERE q_no=#{q_no}")
	public QnaVO qnaDetailData(int q_no);
	
	// qna 디테일 조회수 증가
	@Update("UPDATE T4_QNA SET hit=hit+1 WHERE q_no=#{q_no}")
	public void qnaHitIncrement(int q_no);

	// qna 수정
	@Update("UPDATE T4_QNA SET title=#{title}, content=#{content} WHERE q_no=#{q_no}")
	public void qnaEdit(QnaVO vo);	
	
	// qna 삭제
	@Delete("DELETE FROM T4_QNA WHERE q_no=#{q_no}")
	public String qnaDeleteData(int q_no);
	
	
	//*********** 뉴스 ***********//
	// news 리스트
	@Select("SELECT n_no, title, content, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, id, hit, num "
			+ "FROM (SELECT n_no, title, content, regdate, id, hit, rownum as num "
			+ "FROM (SELECT n_no, title, content, regdate, id, hit "
			+ "FROM T4_NEWS ORDER BY regdate DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<NewsVO> newsListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM T4_NEWS")
	public int newsTotalPage();
	
	// news 디테일
	@Select("SELECT n_no, hit, title, content, id, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, TO_CHAR(editeddate, 'YYYY-MM-DD hh:mm:ss') as etdate FROM T4_NEWS WHERE n_no=#{n_no}")
	public NewsVO newsDetailData(int n_no);
	
	// news 디테일 조회수 증가
	@Update("UPDATE T4_NEWS SET hit=hit+1 WHERE n_no=#{n_no}")
	public void newsHitIncrement(int n_no);

	// news 좋아요 +
	@Update("UPDATE T4_NEWS SET goodcount=goodcount+1 WHERE n_no=#{n_no}")
	public void newsGoodcountIncrement(int n_no);
	
	// news top
	@Select("SELECT * FROM ( SELECT * FROM T4_NEWS ORDER BY hit DESC) WHERE rownum <= 3")
	public List<NewsVO> newsTop();
	
	// news 추가
	@SelectKey(keyProperty = "n_no", resultType = int.class, before = true,
			statement = "SELECT NVL(MAX(n_no)+1,1) as n_no FROM T4_NEWS")
	@Insert("INSERT INTO T4_NEWS VALUES(#{n_no}, #{title}, #{content} ,SYSDATE, 0, 0, 0, #{id}, SYSDATE)")
	public void newsInsertData(NewsVO vo);
	
	// news 삭제
	@Delete("DELETE FROM T4_NEWS WHERE n_no=#{n_no}")
	public String newsDeleteData(int n_no);
	
	// news 수정
	@Update("UPDATE T4_NEWS SET title=#{title}, content=#{content}, editeddate=SYSDATE WHERE n_no=#{n_no}")
	public void newsEdit(NewsVO vo);
	
	// news 수정, 삭제를 위한 세션 비밀번호

	
	//*********** 블로그 ***********//
	// blog 리스트
	@Select("SELECT b_no, title, content, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, id, hit, num "
			+ "FROM (SELECT b_no, title, content, regdate, id, hit, rownum as num "
			+ "FROM (SELECT b_no, title, content, regdate, id, hit "
			+ "FROM T4_BLOG ORDER BY regdate DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<BlogVO> blogListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM T4_BLOG")
	public int blogTotalPage();
	
	// blog 디테일
	@Select("SELECT b_no, hit, title, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, id, content FROM T4_BLOG WHERE b_no=#{b_no}")
	public BlogVO blogDetailData(int b_no);
	
	// blog 디테일 조회수 증가
	@Update("UPDATE T4_BLOG SET hit=hit+1 WHERE b_no=#{b_no}")
	public void blogHitIncrement(int b_no);
	
	// blog 삭제
	@Delete("DELETE FROM T4_BLOG WHERE b_no=#{b_no}")
	public String blogDeleteData(int b_no);
	
	// blog 수정
	@Update("UPDATE T4_BLOG SET title=#{title}, content=#{content} WHERE b_no=#{b_no}")
	public void blogEdit(BlogVO vo);
	
	//*********** 포럼 ***********//	
	// forum 리스트
	@Select("SELECT f_no, title, content, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, id, hit, num "
			+ "FROM (SELECT f_no, title, content, regdate, id, hit, rownum as num "
			+ "FROM (SELECT f_no, title, content, regdate, id, hit "
			+ "FROM T4_FORUM ORDER BY f_no DESC)) "
			+ "WHERE num BETWEEN #{start} AND #{end}")
	public List<ForumVO> forumListData(Map map);	
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM T4_FORUM")
	public int forumTotalPage();
	
	// forum 디테일
	@Select("SELECT f_no, hit, title, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, id, content, TO_CHAR(editeddate, 'YYYY-MM-DD hh:mm:ss') as etdate FROM T4_FORUM WHERE f_no=#{f_no}")
	public ForumVO forumDetailData(int f_no);
	
	// forum 디테일 조회수 증가
	@Update("UPDATE T4_FORUM SET hit=hit+1 WHERE f_no=#{f_no}")
	public void forumHitIncrement(int f_no);

	// forum 수정
	@Update("UPDATE T4_FORUM SET title=#{title}, content=#{content} WHERE f_no=#{f_no}")
	public void forumEdit(ForumVO vo);
	
	// forum 인서트
	@SelectKey(keyProperty = "f_no", resultType = int.class, before = true,
	statement = "SELECT NVL(MAX(f_no)+1,1) as q_no FROM T4_FORUM")
	@Insert("INSERT INTO T4_FORUM VALUES(#{f_no}, #{title}, #{content}, SYSDATE, 0, SYSDATE, #{id} )")
	public void forumInsert(ForumVO vo);

	// forum 삭제
	@Delete("DELETE FROM T4_FORUM WHERE f_no=#{f_no}")
	public String forumDeleteData(int f_no);
	
	// forum 댓글
	@Select("SELECT content, TO_CHAR(regdate, 'YYYY-MM-DD') as dbday, f_no, f_r_no, group_id, group_step, group_tab, id FROM T4_FORUM_REPLY WHERE f_no=#{f_no}")
	public List<ReplyVO> replyListData(int f_no);
	

		
	
	
	
	// my list
	public void myListData(ForumVO fvo);
	


}

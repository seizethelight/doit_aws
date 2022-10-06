package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.LikeVO;
import com.sist.vo.MemberVO;

public interface MypageMapper {
	//내 정보
	@Select("SELECT * FROM t4_user "
			+"WHERE id=#{id}")
	public MemberVO myinfo(String id);
	// 회원 수정  ==> 복호화 
	@Select("SELECT pw FROM t4_user "
		  +"WHERE id=#{id}")
	public String memberGetPassword(String id);
	@Select("SELECT * FROM t4_user "
		  +"WHERE id=#{id}")
	public MemberVO memberUpdateData(String id);
	@Update("UPDATE t4_user SET "
			   +"name=#{name},sex=#{sex},email=#{email},birth=#{birth},"
			   +"zipcode=#{zipcode},addr1=#{addr1},addr2=#{addr2},"
			   +"phone=#{phone} "
			   +"WHERE id=#{id}")
	public void memberUpdate(MemberVO vo);
	@Select("SELECT t4_gym_like.j_no, t4_gym_like.id, t4_gym_like.g_no, t4_gym.poster, t4_gym.store, t4_gym.price "
			+ "FROM t4_gym_like "
			+ "LEFT JOIN t4_gym "
			+ "ON t4_gym_like.g_no = t4_gym.g_no "
			+ "WHERE id = #{id}")
	public List<LikeVO> myPageLikeData(String id);
	
}

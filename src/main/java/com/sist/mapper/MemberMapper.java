package com.sist.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.sist.vo.MemberVO;

public interface MemberMapper {
	// 회원가입 ==> 비밀번호 암호화
	@Select("SELECT COUNT(*) FROM t4_user WHERE id=#{id}")
	public int memberIdCheck(String id);

	@Insert("INSERT INTO t4_user VALUES(" 
	        + "#{id},#{pw},#{name},#{sex},#{birth},#{phone},#{email},"
			+ "#{addr1},#{addr2},#{zipcode},'user',SYSDATE)")
	public void memberJoinInsert(MemberVO vo);
	
	// 로그인    ==> 복호화 ====> 자동로그인
	@Select("SELECT pw,name,admin FROM t4_user "
			  +"WHERE id=#{id}")
	public MemberVO memberJoinInfoData(String id);
	
	@Select("SELECT * FROM t4_user "
			+ "WHERE id=#{id}")
	public MemberVO memberData(String id);
}

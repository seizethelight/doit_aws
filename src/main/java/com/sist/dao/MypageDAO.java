package com.sist.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MypageMapper;
import com.sist.vo.LikeVO;
import com.sist.vo.MemberVO;


@Repository
public class MypageDAO {
	
	@Autowired
	private MypageMapper mapper;
	
	//회원수정
	public MemberVO myinfo(String id)
	{
		return mapper.myinfo(id);
	}
	public String memberGetPassword(String id)
    {
   	 return mapper.memberGetPassword(id);
    }
	public MemberVO memberUpdateData(String id)
    {
   	 return mapper.memberUpdateData(id);
    }
	public void memberUpdate(MemberVO vo)
	{
		mapper.memberUpdate(vo);
	}
	
	//좋아요 내역
	public List<LikeVO> myPageLikeData(String id)
	{
		return mapper.myPageLikeData(id);
	}
	
}

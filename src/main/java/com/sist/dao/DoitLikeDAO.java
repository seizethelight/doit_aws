package com.sist.dao;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.DoitLikeMapper;
@Repository
public class DoitLikeDAO {
	@Autowired
	private DoitLikeMapper  mapper;
	
	//체크
	public int likeCheck(Map map)
	{
		return mapper.likeCheck(map);
	}
	
	//좋아요
	public void LikeInsert(int g_no,Map map)
	{
		mapper.LikecntIncreament(g_no);
		mapper.LikeInsert(map);
	}
	
	//취소
	public void LikeDelete(int g_no,Map map)
	{
		mapper.LikecntDecrement(g_no);
		mapper.LikeDelete(map);
	}
}

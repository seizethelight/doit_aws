package com.sist.dao;

import java.util.*;
import com.sist.vo.*;
import com.sist.mapper.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GymDAO {
	@Autowired
	private GymMapper mapper;
	
	public List<GymVO> gymListData(Map map)
	{
		return mapper.gymListData(map);
	}
	
	public int gymTotalPage(String search)
	{
		return mapper.gymTotalPage(search);
	}
	
	public GymVO gymDetailData(int g_no)
	{
		mapper.gymHitIncrement(g_no);
		return mapper.gymDetailData(g_no);
	}
	
	public GymVO gymCookieData(int g_no)
	{
		return mapper.gymDetailData(g_no);
	}
}

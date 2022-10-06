package com.sist.dao;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.*;

@Repository
public class ExkcalDAO {
	@Autowired
	private ExkcalMapper mapper;
	
	public List<ExkcalVO> exkcalListData(Map map)
	{
		return mapper.exkcalListData(map);
	}
	
	public int exkcalTotalPage(Map map)
	{
		return mapper.exkcalTotalPage(map);
	}

	public ExkcalVO exkcalDetailData(int e_no) {
		// TODO Auto-generated method stub
		mapper.exkcalHitIncrement(e_no);
		return mapper.exkcalDetailData(e_no);
	}
}

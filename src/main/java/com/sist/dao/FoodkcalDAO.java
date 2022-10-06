package com.sist.dao;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.*;
import com.sist.vo.*;

@Repository
public class FoodkcalDAO {
	@Autowired
	private FoodkcalMapper mapper;
	
	public List<FoodkcalVO> foodkcalListData(Map map)
	{
		return mapper.foodkcalListData(map);
	}
	
	public int foodkcalTotalPage(Map map)
	{
		return mapper.foodkcalTotalPage(map);
	}

	public FoodkcalVO foodkcalDetailData(int f_no) {
		// TODO Auto-generated method stub
		mapper.foodkcalHitIncrement(f_no);
		return mapper.foodkcalDetailData(f_no);
	}
}

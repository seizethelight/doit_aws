package com.sist.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.StoreMapper;
import com.sist.vo.GymVO;
import com.sist.vo.StoreVO;

@Repository
public class StoreDAO {
	@Autowired
	private StoreMapper mapper;
	
	public List<StoreVO> storeListData(Map map)
	{
		return mapper.storeListData(map);
	}
	
	public int storeTotalPage(Map map)
	{
		return mapper.storeTotalPage(map);
	}
	public StoreVO storeDetailData(Map map)
	{
		mapper.storeHitIncrement(map);
		return mapper.storeDetailData(map);  
	}
	
	// cookie
	public StoreVO storeCookieData(Map map)
	{
		return mapper.storeDetailData(map);
	}
	
	public List<StoreVO> storeaListData(Map map)
	{
		return mapper.storeaListData(map);
	}
	public int storeaTotalPage(Map map)
	{
		return mapper.storeaTotalPage(map);
	}
	
	public int storeTotalProduct(Map map)
	{
		return mapper.storeTotalProduct(map);
	}
//hit 	
	public List<StoreVO> storeA_Hit_ListData(Map map)
	{
		return mapper.storeA_Hit_ListData(map);
	}
}

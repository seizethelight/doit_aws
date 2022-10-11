package com.sist.mapper;

import java.util.*;
import com.sist.vo.*;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface FoodkcalMapper {
	
	@Select("SELECT f_no,f_title,f_unit,f_kcal, f_hit,num "
			+"FROM (SELECT f_no,f_title,f_unit,f_kcal, f_hit, rownum as num "
			+"FROM (SELECT f_no,f_title,f_unit,f_kcal, f_hit "			
			+"FROM ${table_name} ORDER BY f_no ASC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<FoodkcalVO> foodkcalListData(Map map);
	
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM ${table_name}")
	public int foodkcalTotalPage(Map map);

	@Update("UPDATE ${table_name} "
			+ "SET f_hit = f_hit + 1 "
			+ "WHERE f_no=#{f_no}")
	public void foodkcalHitIncrement(Map map);

	@Select("SELECT * FROM ${table_name} "
			+"WHERE f_no=#{f_no}")
	public FoodkcalVO foodkcalDetailData(Map map);
	
	

}

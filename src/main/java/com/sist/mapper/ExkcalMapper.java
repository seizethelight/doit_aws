package com.sist.mapper;

import java.util.*;
import com.sist.vo.*;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ExkcalMapper {
	
	@Select("SELECT e_no,e_title,e_unit,e_kcal, e_hit,num "
			+"FROM (SELECT e_no,e_title,e_unit,e_kcal, e_hit, rownum as num "
			+"FROM (SELECT e_no,e_title,e_unit,e_kcal, e_hit "			
			+"FROM t4_exercise_kcal ORDER BY e_no ASC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<ExkcalVO> exkcalListData(Map map);
	
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM t4_exercise_kcal")
	public int exkcalTotalPage(Map map);

	@Update("UPDATE t4_exercise_kcal "
			+ "SET e_hit = e_hit + 1 "
			+ "WHERE e_no=#{e_no}")
	public void exkcalHitIncrement(int e_no);

	@Select("SELECT * FROM t4_exercise_kcal "
			+"WHERE e_no=#{e_no}")
	public ExkcalVO exkcalDetailData(int e_no);
	
	

}

package com.sist.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
/*
 	private int ex_no, ex_hit, ex_good;
 	private String  ex_title, ex_outline, ex_level, ex_bodypart, ex_musclepart1, pic1, pic2, pic3, pic4, sub1, sub2, sub3, sub4, ex_musclepart2;
*/
import org.apache.ibatis.annotations.Update;

import com.sist.vo.*;
public interface HowtoexMapper {
	@Select("SELECT ex_no, ex_title, ex_level,pic1, ex_bodypart, ex_hit, ex_good, num "
			+"FROM (SELECT ex_no, ex_title,ex_level, pic1, ex_bodypart, ex_hit, ex_good, rownum as num "
			+"FROM (SELECT ex_no, ex_title,ex_level, pic1, ex_bodypart, ex_hit, ex_good "
			+"FROM t4_exercise_info ORDER BY ex_no ASC)) "
			+"WHERE num BETWEEN #{start} AND #{end}")
	public List<HowtoexVO> howtoexListData(Map map);
	
	@Select("SELECT CEIL(COUNT(*)/12.0) FROM t4_exercise_info")
	public int howtoexTotalPage(Map map);
	
	  @Update("UPDATE t4_exercise_info "
	  		+ "SET ex_hit=ex_hit + 1 " 
			  +"WHERE ex_no=#{ex_no}")
	  public void howtoexHitIncrement(int ex_no);
	  
	  @Select("SELECT * FROM t4_exercise_info "
			  +"WHERE ex_no=#{ex_no}")
	  public HowtoexVO howtoexDetailData(int ex_no);
	 
	   @Select("SELECT ex_no, ex_title, pic1, ex_bodypart, ex_hit, ex_good, num "
			   +"FROM (SELECT ex_no, ex_title, pic1, ex_bodypart, ex_hit, ex_good, rownum as num "
			   +"FROM (SELECT ex_no, ex_title, pic1, ex_bodypart, ex_hit, ex_good "
			   +"FROM t4_exercise_info WHERE ex_bodypart LIKE '%'||#{ex_bodypart}||'%')) "
			   +"WHERE num BETWEEN #{start} AND #{end}")
		public List<HowtoexVO> exFindData(Map map);

	   @Select("SELECT CEIL(COUNT(*)/12.0) FROM t4_exercise_info "
				  +"WHERE ex_bodypart LIKE '%'||#{ex_bodypart}||'%'")
		   public int exFindTotalPage(String ex_bodypart);
	 
	   @Select("SELECT ex_title,rownum "
				  +"FROM (SELECT name FROM t4_exercise_info ORDER BY hit DESC) "
				  +"WHERE rownum<=5")
		   public List<String> exTop5();  

}

package com.sist.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

public interface DoitLikeMapper {
	@Select("SELECT COUNT(*) FROM t4_gym_like "
			+ "WHERE g_no=#{g_no} AND id=#{id}")
	public int likeCheck(Map map);
	
	//좋아요
	@SelectKey(keyProperty = "j_no", resultType = int.class , before = true, 
			statement = "SELECT NVL(MAX(j_no)+1,1) AS j_no FROM t4_gym_like ")
	@Insert("INSERT INTO t4_gym_like (j_no,g_no,id) VALUES( #{j_no}, #{g_no}, #{id} )")
	public void LikeInsert(Map map);
	
	@Update("UPDATE t4_gym SET "
			+ "count = count+1 "
			+ "WHERE g_no=#{g_no}")
	public void LikecntIncreament(int g_no);
	
	//취소
	@Delete("DELETE FROM t4_gym_like "
			+ "WHERE id=#{id} AND g_no=#{g_no}")
	public void LikeDelete(Map map);
	
	@Update("UPDATE t4_gym SET "
			+ "count = count-1 "
			+ "WHERE g_no=#{g_no}")
	public void LikecntDecrement(int g_no);
}

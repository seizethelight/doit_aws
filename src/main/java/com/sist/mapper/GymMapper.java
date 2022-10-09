package com.sist.mapper;

import java.util.*;
import com.sist.vo.*;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;


/*
 * 	private int g_no,hit;
	private String store,time,poster,type,type1,type2,type3,addr,price;
 */
public interface GymMapper {
	
	//리스트
		@Select("SELECT g_no,store,poster,type,type1,addr,price,hit,num "
				+ "FROM (SELECT g_no,store,poster,type,type1,addr,price,hit,rownum as num "
				+ "FROM (SELECT g_no,store,poster,type,type1,addr,price,hit "
				+ "FROM t4_gym WHERE addr LIKE '%'||#{addr}||'%' ORDER BY g_no ASC)) "
				+ "WHERE num BETWEEN #{start} AND #{end}")
		public List<GymVO> gymListData(Map map);
		
		// 총페이지
		@Select("SELECT CEIL(COUNT(*)/9.0) FROM t4_gym WHERE addr LIKE '%'||#{addr}||'%'")
		public int gymTotalPage(String search);
	
	//상세보기
			@Select("SELECT * FROM t4_gym "
					+ "WHERE g_no=#{g_no}")
			public GymVO gymDetailData(int g_no);
			
			// 조회수
			@Update("UPDATE t4_gym "
					+ "SET hit = hit + 1 "
					+ "WHERE g_no=#{g_no}")
			public void gymHitIncrement(int g_no);
}

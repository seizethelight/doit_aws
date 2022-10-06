package com.sist.dao;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;
import com.sist.mapper.*;
import com.sist.vo.*;
@Repository
public class HowtoexDAO {
 
  @Autowired
  private HowtoexMapper mapper;
 
	   public List<HowtoexVO> howtoexListData(Map map)
	   {
		   return mapper.howtoexListData(map);
	   }
  
	   public int howtoexTotalPage(Map map)
	   {
		   return mapper.howtoexTotalPage(map);
	   }
	   
		public HowtoexVO howtoexDetailData(int ex_no)
		{
			mapper.howtoexHitIncrement(ex_no);
			return mapper.howtoexDetailData(ex_no);
		}
		
		public List<HowtoexVO> exFindData(Map map)
		 {
			   return mapper.exFindData(map);
		 }
		   
		public int exFindTotalPage(String ex_bodypart)
		 {
			   return mapper.exFindTotalPage(ex_bodypart);
		 }

		public List<String> exTop5()
		 {
			   return mapper.exTop5();
		 }
		
		public HowtoexVO howtoexCookieData(int ex_no)
		{
			return mapper.howtoexDetailData(ex_no);
		}
	 }
  

package com.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.MemberVO;

public interface AdminMapper {
	@Select("SELECT * FROM t4_user "
			+"ORDER BY admin ASC")
	public List<MemberVO> userinfoList();
	
	@Update("UPDATE t4_user SET admin=#{admin} "
			+"WHERE id=#{id}")
	public void userUpdate(Map map);
}

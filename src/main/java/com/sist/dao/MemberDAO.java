package com.sist.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sist.mapper.MemberMapper;
import com.sist.vo.MemberVO;

@Repository
public class MemberDAO {
   @Autowired
   private MemberMapper mapper;
   
   /*
    *      @Select("SELECT COUNT(*) FROM spring_member2 "
            +"WHERE id=#{id}")
		   public int memberIdCount(String id);
		   @Select("SELECT pwd,name FROM spring_member2 "
				  +"WHERE id=#{id}")
		   public MemberVO memberInfoData(String id);
    */
   public int memberIdCheck(String id)
   {
   	return mapper.memberIdCheck(id);
   }
   public void memberJoinInsert(MemberVO vo)
   {
   	mapper.memberJoinInsert(vo);
   }
   public MemberVO memberJoinInfoData(String id)
   {
   	return mapper.memberJoinInfoData(id);
   }
   public MemberVO memberData(String id)
   {
	   return mapper.memberData(id);
   }
   
}






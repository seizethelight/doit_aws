package com.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sist.vo.MemberVO;
import com.sist.vo.OrderVO;
/*
 * t4_order
 * Name        Null?    Type          
----------- -------- ------------- 
O_NO        NOT NULL NUMBER        
O_DATE      NOT NULL DATE          
TOTAL_PRICE          NUMBER        
STATE                NUMBER        
ID          NOT NULL VARCHAR2(340) 
NO          NOT NULL NUMBER        
COUNT       NOT NULL NUMBER        

 */
public interface PayMapper {
	 // 예약자 정보
	@Select("SELECT id,name,phone,email,addr1,addr2 "
			+ "FROM t4_user "
			+ "WHERE id=#{id}")
	public List<MemberVO> payMemberInfo(String id);
	
	//	@Select("SELECT type, COUNT(*) as count FROM t4_order GROUP BY type")
//	@Update("UPDATE t4_order SET state=state+1 WHERE o_no IN(#{o_no})")
//	public void changeState(int o_no);

	//구매 처리
	@Insert("INSERT INTO t4_order(o_no, no, id, total_price, o_date ) "
			+ "VALUES((SELECT NVL(MAX(o_no)+1,1) FROM t4_order),#{no}, #{id}, #{total_price},SYSDATE)")
	public void payInsert(OrderVO vo);
	
	//구매 내역
	@Select("SELECT o_no, no, id, total_price, to_char(o_date,'yyyy-mm-dd HH24:MM:SS') as dbday "
			+ "FROM t4_order WHERE id=#{id} ORDER BY o_no")
	public List<OrderVO> orderListData(String id);
	
	//구매 취소
	@Delete("DELETE FROM t4_order WHERE o_no=#{o_no}")
	public void orderCancel(int o_no);
//	//상품  state 변경
//	@Update("UPDATE t4_order SET state = state-1 "
//			+ "WHERE o_no=#{o_no}")
//	public void orderCancel_changeState(int o_no);=> 해당상품 테이블에 넣는건데  굳이 필요한가 싶음 
//	 
}

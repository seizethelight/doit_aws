package com.sist.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.GymMapper;
import com.sist.mapper.PayMapper;
import com.sist.vo.MemberVO;
import com.sist.vo.OrderVO;

@Repository
public class CartDAO {
	
	@Autowired
	private PayMapper mapper;
	//주문자 정보 
	public List<MemberVO> payMemberInfo(String id)
	{
		return mapper.payMemberInfo(id);
	}
	//구매처리 
	public void payInsert(OrderVO vo)
	{
		mapper.payInsert(vo);
	}
	//주문리스트 
	public List<OrderVO> orderListData(String id)
	{
		return mapper.orderListData(id);
	}
	//취소 
	public void orderCancel(int o_no)
	{
		mapper.orderCancel(o_no);
	}
}

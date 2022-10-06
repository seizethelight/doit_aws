package com.sist.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dao.CartDAO;
import com.sist.dao.GymDAO;
import com.sist.dao.MemberDAO;
import com.sist.dao.StoreDAO;
import com.sist.vo.CartVO;
import com.sist.vo.GymVO;
import com.sist.vo.MemberVO;
import com.sist.vo.OrderVO;
import com.sist.vo.StoreVO;

@Controller
public class CartController {
	@Autowired
	private StoreDAO sdao;
	
	@Autowired
	private GymDAO gdao; 
	
	@Autowired
	private CartDAO cdao; 
	
	@Autowired
	private MemberDAO mdao;
	
	// 장바구니
		@RequestMapping("cart/cart_list.do")
		public String shop_cart_list(String no, String cate,String account, HttpSession session, Model model) {
			if(no==null) 
				no="0";
			if(cate==null)
				cate="1";
			if(account==null)
				account="1";
			int account_=Integer.parseInt(account);
			int cate_=Integer.parseInt(cate);
			int no_ = Integer.parseInt(no);
			int sum=0;
			int sum1=0;
			List<CartVO> list = (List<CartVO>)session.getAttribute("cart");
			if(list!=null)
			{
			for(CartVO vo:list)
			{
				if(vo.getCate()==1)
				{
					sum+=vo.getTotal();
				}
				if(vo.getCate()==2)
				{
					sum1+=vo.getTotal();
				}
				
			}
			}
			int listsize = 0;
			if(list!=null) {
				listsize = list.size();
				for(CartVO vo:list) {
					//상품 이름 자르기 
					String goods = vo.getName();
					if(goods.length()>20) {
						goods = goods.substring(0,20)+"..";
					}
					vo.setName(goods);
					
				}
			}
			model.addAttribute("sum", sum);
			model.addAttribute("sum1", sum1);
		    model.addAttribute("no", no_);
		    model.addAttribute("cate",cate_);
		    model.addAttribute("account",account_);
		    model.addAttribute("list", list);
		    model.addAttribute("listsize",listsize);
		    return "cart/cart_list";
		}
		@RequestMapping("cart/cart_insert.do")
		public String cart_cart_insert(int no,int account,int cate,HttpSession session, RedirectAttributes ra) {
		  List <CartVO> list = (List <CartVO>) session.getAttribute("cart");
		try {
		  if (list == null) {
		    list = new ArrayList <CartVO> ();
		  }
		  System.out.println("cate="+cate);
		  //name, poster, price
		  Map map =new HashMap();
		  map.put("s_no", no);
		  GymVO gvo=gdao.gymDetailData(no);// 헬스장 
		  StoreVO svo = sdao.storeDetailData(map);// 쇼핑몰 
		  String Sposter="http://"+svo.getPoster();//쇼핑몰 포스터 
		  CartVO cvo = new CartVO();
		  if(cate==1)//헬스장 
		  {
			  cvo.setNo(no);
			  cvo.setName(gvo.getStore());
			  cvo.setPoster(gvo.getPoster());
			  cvo.setPrice(gvo.getPrice());  
			  String total=gvo.getPrice();
			  total=total.replaceAll("[^0-9]","");
			  cvo.setAccount(account);
			  int i=Integer.parseInt(total)*account;
			  cvo.setTotal(i);
			 cvo.setCate(cate);
		  }
		  
		  if(cate==2)//쇼핑몰 
		  {
			  cvo.setNo(no);
			  cvo.setName(svo.getName());
			  cvo.setPoster(Sposter);
			  cvo.setPrice(svo.getFirst_price().replaceAll("[^0-9]", ""));
			  String total=svo.getFirst_price();
			  total=total.replaceAll("[^0-9]", "");
			  cvo.setAccount(account);
			  int i=Integer.parseInt(total)*account;
			  cvo.setTotal(i);
			  cvo.setCate(cate);
		  }
		  boolean bCheck = false;
		  for (CartVO avo: list) { 
			  //이미 장바구니에 있는걸 담은 경우
		    if (avo.getNo() == cvo.getNo()) {
		    	 int acc=avo.getAccount()+cvo.getAccount();
				   avo.setAccount(acc);
		      bCheck = true;
		      break;
		    }
		  }
		  //새로운 상품을 담은 경우
		  if (bCheck == false) {
		    list.add(cvo);
		    session.setAttribute("cart", list);
		    session.setMaxInactiveInterval(60*60*24);
		  }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
			System.out.println("insert 에러!!");
		}
		  //데이터 전송
		  //		model.addAttribute("list",list);
		  //		model.addAttribute("no",no);
		  //redirect가 나올 때는 Model로 보내 주면 안된다. request가 초기화된 후 전송되니까...불가능함.
		  return "redirect:../cart/cart_list.do?no=" + no;
		}
		
		//장바구니 담기 취소
		@RequestMapping("cart/cart_cancel.do")
		public String cart_cancel(int no, HttpSession session) {
		  List <CartVO> list = (List <CartVO> ) session.getAttribute("cart");
		  for (int i = 0; i < list.size(); i++) {
		    CartVO vo = list.get(i);
		    if (vo.getNo() == no) {
		      list.remove(i);
		    }
		  }
		  return "redirect:../cart/cart_list.do?no=" + no;
		}
		// 결제하기 넘기기
		@RequestMapping("payment/pay_form.do")
		public String payment_pay(HttpServletRequest request,HttpSession session)
		{
			  String id=(String)session.getAttribute("id");
			  String name=(String)session.getAttribute("name");
			 
			  MemberVO vo= mdao.memberData(id);
		
			List<MemberVO> list=cdao.payMemberInfo(id);
			  
			  	int sum=0;
				int sum1=0;
				List<CartVO> cList = (List<CartVO>)session.getAttribute("cart");
				if(list!=null)
				{
				for(CartVO cvo:cList)
				{
					if(cvo.getCate()==1)
					{
						sum+=cvo.getTotal();
					}
					if(cvo.getCate()==2)
					{
						sum1+=cvo.getTotal();
					}
					
				}
				}
				String sum2=String.valueOf(sum+sum1).substring(0,3);
				request.setAttribute("sum2", sum2);
				request.setAttribute("id", id);
				request.setAttribute("name", name);
				request.setAttribute("vo", vo);
				request.setAttribute("sum1", sum1);
				request.setAttribute("sum", sum);
				request.setAttribute("cList" , cList);
				request.setAttribute("list" , list);
			return "payment/pay_form";
		}
		
		
		
}
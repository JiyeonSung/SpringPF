package com.jayymall.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jayymall.domain.CartProductVO;
import com.jayymall.domain.CartVO;
import com.jayymall.persistence.CartDAO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO dao;
	
	// 장바구니 추가
	@Override
	public void addCart(CartVO vo) throws Exception {
		dao.addCart(vo);
	}

	// 장바구니 삭제
	@Override
	public void deleteCart(int cart_code) throws Exception {
		dao.deleteCart(cart_code);
	}

	// 장바구니 수량 변경
	@Override
	public void updateCart(Map map) throws Exception {
		dao.updateCart(map);
	}

	// 장바구니 가져오기
	@Override
	public List<CartProductVO> getCart(String mem_id) throws Exception {
		return dao.getCart(mem_id);
	}

	// 장바구니 삭제 (주문 완료)
	@Override
	public void deleteCartOrder(Map map) throws Exception {
		dao.deleteCartOrder(map);
	}
}

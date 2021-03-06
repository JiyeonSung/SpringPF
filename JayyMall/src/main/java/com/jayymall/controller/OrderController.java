package com.jayymall.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jayymall.domain.OrderDetailVOList;
import com.jayymall.domain.OrderListVO;
import com.jayymall.domain.OrderVO;
import com.jayymall.domain.ProductVO;
import com.jayymall.dto.MemberDTO;
import com.jayymall.service.MemberService;
import com.jayymall.service.OrderService;
import com.jayymall.service.ProductService;

@Controller
@RequestMapping(value = "/order/*")
public class OrderController {
	
	@Inject
	private OrderService service;
	
	@Inject
	private ProductService productService;
	
	@Inject
	private MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	
	/* 
	 * 상품 상세 -> 구매 또는 바로 구매 
	 * 
	 * model로 상품리스트, 수량리스트, 구매자 정보 전달
	 */
	@RequestMapping(value = "buy", method = RequestMethod.GET)
	public void buyGET(@RequestParam int ord_amount,
					   @RequestParam int product_num, Model model, HttpSession session) throws Exception {
		
		logger.info("=====buyGET() execute....");
		
		List<ProductVO> productList = new ArrayList<ProductVO>();
		List<Integer> amountList = new ArrayList<Integer>();
		
		productList.add(productService.readProduct(product_num));
		amountList.add(ord_amount);
		
		model.addAttribute("productList", productList);
		model.addAttribute("amountList", amountList);
		
		MemberDTO dto = (MemberDTO)session.getAttribute("user");
		model.addAttribute("user", memberService.readUserInfo(dto.getMem_id()));
	}
	
	
	/*
	 * 장바구니 -> 구매(단일 상품)
	 * 
	 * model로 상품리스트, 수량리스트, 구매자 정보 전달  orderDetailList
	 */
	@RequestMapping(value = "buyFromCart", method = RequestMethod.GET)
	public String buyFromCartGET(@RequestParam int ord_amount,
								 @RequestParam int product_num, Model model, HttpSession session) throws Exception {
		
		logger.info("=====butyFromCartGET() execute...");
		
		// 상품 정보 1개
		List<ProductVO> productList = new ArrayList<ProductVO>();
		List<Integer> amountList = new ArrayList<Integer>();
		
		productList.add(productService.readProduct(product_num));
		amountList.add(ord_amount);
		
		model.addAttribute("productList", productList);
		model.addAttribute("amountList", amountList);
		
		MemberDTO dto = (MemberDTO)session.getAttribute("user");
		model.addAttribute("user", memberService.readUserInfo(dto.getMem_id()));
		
		return "/order/buyFromCart";
	}
	
	/*
	 * 장바구니 -> 체크상품 구매(다수 상품)
	 * 
	 * model로 상품리스트, 수량리스트, 구매자 정보 전달
	
	체크박스에  value= 장바구니 코드
	장바구니 리스트 3개 
	orderDetailList
	  체크박스 2개 선택  
	 체크박스  @RequestParam("check") List<Integer> checkList :  2개(장바구니코드)
	 
	 상품코드 @RequestParam("pdt_num") List<Integer> pdt_numList  : 3개
	 수량      @RequestParam("cart_amount") List<Integer> cart_amountList : 3개
	 장바구니코드 @RequestParam("cart_code") List<Integer> cart_codeList : 3개 (장바구니코드)
	 */
	@RequestMapping(value = "buyFromCart", method = RequestMethod.POST)
	public void buyFromCartPOST(@RequestParam("check") List<Integer> checkList,
								@RequestParam("product_num") List<Integer> product_numList,
								@RequestParam("cart_amount") List<Integer> cart_amountList,
								@RequestParam("cart_code") List<Integer> cart_codeList,
								Model model, HttpSession session) throws Exception {
		
		logger.info("=====buyFromCartPOST() execute...");
		
		// 선택된 2개의 상품코드, 수량정보 작업
		// 상품정보를 저장하기 위한 컬렉션 객체생성 -> 체크박스에 선택된 행의 상품코드의 정보를 db에서 가져와서 저장
		List<ProductVO> productList = new ArrayList<ProductVO>();
		// 선택된 행의 상품의 변경된 수량
		List<Integer> amountList = new ArrayList<Integer>();
		
		// 장바구니 목록에서 체크된 값만을 선택하여 List에 추가
		for(int i=0; i<cart_codeList.size(); i++) {
			for(int j=0; j<checkList.size(); j++) {
				
				if(cart_codeList.get(i) == checkList.get(j)) {
					
					productList.add(productService.readProduct((int)product_numList.get(i)));
					amountList.add(cart_amountList.get(i));
					continue;
					
				} else {
					
					continue;
				}
			}
		}
		
		//선택된 상품의 구매페이지에서 필요한 Model작업
		model.addAttribute("productList", productList);
		model.addAttribute("amountList", amountList);
		
		MemberDTO dto = (MemberDTO)session.getAttribute("user");
		model.addAttribute("user", memberService.readUserInfo(dto.getMem_id()));
	}
	
	
	/* 
	 * 상품 상세 -> 구매 또는 바로구매
	 * 실제 구매 DB작업
	 * 기술 : jsp 파일에서 파라미터 처리를 어떻게 전송을 해야
	 * 		OrderDetailVOList orderDetailList 파라미터를 받는 방법
	 * OrderVO order : 주문정보 1개
	 * OrderDetailVOList orderDetailList : 주문상세정보 여러 개
	 */
	@RequestMapping(value = "order", method = RequestMethod.POST)
	public String orderPOST(OrderVO order, OrderDetailVOList orderDetailList,
							Model model, HttpSession session) throws Exception {
		
		logger.info("=====orderPOST() execute...");
		
		logger.info("=====OrderVO(주문자 정보): " + order.toString());
		logger.info("=====OrderDetail(주문 내역): " + orderDetailList.toString());
		
		service.addOrder(order, orderDetailList);
		
		return "/order/orderComplete";
		
	}
	
	
	/* 
	 * 장바구니 -> 구매
	 * 실제 구매 DB작업
	 * OrderVO : 
	 * OrderVO
	 * check 파라미터 작업이 없는 상태  orderDetailList
	 * 
	 */
	@RequestMapping(value = "orderFromCart", method = RequestMethod.POST)
	public String orderFromCartPOST(OrderVO order, OrderDetailVOList orderDetailList,
									Model model, HttpSession session) throws Exception {
		
		logger.info("=====orderFromCartPOST() execute...");
		
		logger.info("=====OrderVO(주문자 정보): " + order.toString());
		logger.info("=====OrderDetail(주문 내역): " + orderDetailList.toString());
		
		MemberDTO dto = (MemberDTO)session.getAttribute("user");
		service.addOrderCart(order, orderDetailList, dto.getMem_id());
		
		return "/order/orderComplete";
	}
	
	
	/* 
	 * 주문 조회 작업(GET)
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void listGET(Model model, HttpSession session) throws Exception {
		
		logger.info("=====listGET() execute...");
		
		MemberDTO dto = (MemberDTO) session.getAttribute("user");
		List<OrderListVO> list = service.orderList(dto.getMem_id());
		
		model.addAttribute("orderList", list);
	}
	
	
	/*
	 * 주문 상세 조회(GET)
	 */
	@RequestMapping(value = "read", method = RequestMethod.GET)
	public void readGET(int ord_num, Model model, HttpSession session) throws Exception {
		
		logger.info("=====readGET() execute...");
		
		model.addAttribute("orderList", service.readOrder(ord_num));
		model.addAttribute("order", service.getOrder(ord_num));
	}
	

}

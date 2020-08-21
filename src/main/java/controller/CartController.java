package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Cart;
import logic.Item;
import logic.ItemSet;
import logic.Sale;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("cart")
public class CartController {

	@Autowired
	private ShopService service;
	
	@RequestMapping("*")	//item/list.shop
	public String cartview() {
		return null;
	}
	
	@RequestMapping("end")
	public ModelAndView checkend(HttpSession session) {
		ModelAndView mav = new ModelAndView();
//		Cart cart = (Cart)session.getAttribute("CART");
		Cart cart = new Cart();
		Item tItem = new Item();
		tItem.setCode("1");
		ItemSet tItemSet = new ItemSet(tItem, 2);
		cart.push(tItemSet);
		User loginUser = (User)session.getAttribute("loginUser");
		Sale sale = service.checkend(loginUser, cart);
		long total = cart.getTotal();
		// 주문완료시 장바구니 내용 제거
//		session.removeAttribute("CART");
//		mav.addObject("sale", sale);
//		mav.addObject("total", total);
		mav.setViewName("http://localhost:8080/stylepick/cart/pay.shop");
		return mav;
	}
}

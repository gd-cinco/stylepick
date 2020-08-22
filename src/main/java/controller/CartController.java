package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import exception.CartEmptyException;
import logic.Buy;
import logic.Cart;
import logic.Item;
import logic.ItemSet;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("cart")
public class CartController {

	@Autowired
	private ShopService service;

	@RequestMapping("cartAdd")
	public ModelAndView add(Integer item_no,Integer quantity,HttpSession session) {
		ModelAndView mav=new ModelAndView("cart/cart");
		Item item=service.getItem(item_no);
		Cart cart =(Cart)session.getAttribute("CART");
		if(cart==null) {
			cart = new Cart();
			session.setAttribute("CART", cart);
		}
		
		cart.push(new ItemSet(item,quantity));
		mav.addObject("message",item.getItem_name()+":"+quantity+"개 바구니 추가");
		mav.addObject("cart",cart);
		return mav;
	}
	
	@RequestMapping("cartView")
	public ModelAndView cartview(HttpSession session) {
		ModelAndView mav=new ModelAndView("cart/cart");
		Cart cart =(Cart)session.getAttribute("CART");
		if(cart == null || cart.getItemSetList().size()==0) {
			throw new CartEmptyException("장바구니에 상품이 없습니다.","../item/list.shop");
		}
		mav.addObject("cart",cart);
		return mav;
	}
}

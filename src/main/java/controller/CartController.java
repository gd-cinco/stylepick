package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("cart")
public class CartController {

	
	@RequestMapping("*")	//item/list.shop
	public String cartview() {
		return null;
	}
}

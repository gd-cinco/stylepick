package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


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

	
}

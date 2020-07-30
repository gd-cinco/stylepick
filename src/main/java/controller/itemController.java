package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Item;
import logic.ShopService;

@Controller		
@RequestMapping("item")
public class itemController {
		
		//객체 주입
		@Autowired
		private ShopService service;
		
		@RequestMapping("*")	//item/list.shop
		public String testing() {
			return null;
		}
}

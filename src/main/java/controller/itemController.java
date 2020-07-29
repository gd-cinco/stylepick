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
		
		@RequestMapping("store")	//item/list.shop
		public ModelAndView list() {
			ModelAndView mav =new ModelAndView();
			List<Item> itemList = service.getItemList();
			
			mav.addObject("itemList",itemList);
			return mav;
		}
}

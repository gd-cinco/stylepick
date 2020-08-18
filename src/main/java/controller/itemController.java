package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import exception.ItemEmptyException;
import logic.Item;
import logic.ShopService;

@Controller		
@RequestMapping("item")
public class itemController {
		
		//객체 주입
		@Autowired
		private ShopService service;
		
		@RequestMapping("list")	//item/list.shop
		public ModelAndView list() {
			ModelAndView mav =new ModelAndView();
			List<Item> itemList = service.getItemList();
			
			mav.addObject("itemList",itemList);
			return mav;
		}
		
		@RequestMapping("store")	//item/list.shop
		public String storeform(Model model) {
			model.addAttribute(new Item());
			return null;
		}

		@RequestMapping("create")
		public String addform(Model model) {
			model.addAttribute(new Item());
			return "item/add";
		}
		
		@RequestMapping("register")
		public ModelAndView add(@Valid Item item, BindingResult bresult, HttpServletRequest request) {
		ModelAndView mav=new ModelAndView("item/add");
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
		int max=service.getmaxnum();
		item.setItem_no(++max);
		service.itmeCreate(item,request);
		mav.setViewName("redirect:/item/list.shop");
		}catch(Exception e) {
			e.printStackTrace();
			mav.getModel().putAll(bresult.getModel());
		}
		
		return mav;
		}
		
		@GetMapping("*") // /item/*.shop
		public ModelAndView detail(Integer item_no) {
			ModelAndView mav =new ModelAndView();
		
			try {
			Item item=service.getItem(item_no);
			mav.addObject("item",item);
		}catch(IndexOutOfBoundsException e) {
			throw new ItemEmptyException("존재하지 않는 상품입니다.","list.shop");
		}
			
			return mav;
		}
		
		
}

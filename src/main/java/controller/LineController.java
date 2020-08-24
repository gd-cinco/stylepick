package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.LineException;
import logic.Item;
import logic.Line;
import logic.ShopService;


@Controller		
@RequestMapping("item")
public class LineController {
	
	
	@Autowired
	private ShopService service;
	
	@RequestMapping("write")
	public ModelAndView write(@Valid Line line,Item item,HttpServletRequest request) {
		ModelAndView mav =new ModelAndView("item/line");
		
		service.lineWrite(line,request);  
	
		return mav;
	}
	
}

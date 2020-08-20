package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.LineException;
import logic.Line;
import logic.ShopService;


@Controller		
@RequestMapping("item")
public class LineController {
	
	
	@Autowired
	private ShopService service;
	
	@RequestMapping("write")
	public ModelAndView write(@Valid Line line,BindingResult bresult,HttpServletRequest request) {
		ModelAndView mav =new ModelAndView("item/line");
		if(bresult.hasErrors()) {
		mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			service.lineWrite(line,request);  //팝업창  없애고 새로고침
			mav.setViewName("redirect:/item/list.shop");
		}catch(Exception e) {
			e.printStackTrace();
			throw new LineException("게시물 등록에 실패!","line.shop"); //
		}
		return mav;
	}
	
	
}

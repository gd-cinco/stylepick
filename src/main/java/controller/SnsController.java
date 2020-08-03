package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import logic.ShopService;
import logic.Sns;
import logic.SnsItem;


@Controller
@RequestMapping("sns")	
public class SnsController {
	@Autowired
	private ShopService service;
	
	@GetMapping("*")
	public String entry(Model model) {
		model.addAttribute(new Sns());
		return null;
	}
	
	@PostMapping("write")
	public ModelAndView create(Sns sns,List<MultipartFile> imgs,List<String> category,List<String> detail,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<SnsItem> list = new ArrayList<SnsItem>();
		for(int i=0;i<category.size();i++) {
			SnsItem item = new SnsItem(0,i,category.get(i),detail.get(i));
			list.add(item);
		}
		sns.setItemList(list);
		service.snsWrite(sns,request);
		mav.setViewName("redirec:list.shop?type="+sns.getType());
		return mav;
	}

}

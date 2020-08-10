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
	
	@RequestMapping("test")
	public String test(Model model) {
		return null;
	}
	
	@GetMapping("*")
	public String entry(Model model) {
		model.addAttribute(new Sns());
		return null;
	}
	
	@PostMapping("write")
	public ModelAndView create(Sns sns,String category,String detail,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<SnsItem> list = new ArrayList<SnsItem>();
		String[] cg = category.split(",");
		String[] dt = detail.split(",");
		sns.setSns_no(service.snsNum());
		for(int i=0;i<cg.length;i++) {
			SnsItem item = new SnsItem(sns.getSns_no(),i+1,cg[i],dt[i]);
			list.add(item);
		}
		sns.setItemList(list);
		service.snsWrite(sns,request);
		mav.setViewName("redirec:list.shop?ksb=new&type="+sns.getType());
		return mav;
	}
	
	@RequestMapping("list")
	public ModelAndView list(String ksb,String type,Integer pageNum,String searchcontent) {
		ModelAndView mav = new ModelAndView();
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		if(searchcontent == null || searchcontent.trim().equals("")) {
			searchcontent = null;
		}
		
		int limit = 20;
		int listcount = service.getSnsCount(type,searchcontent);
		List<Sns> snslist = service.getSnsList(ksb,type,pageNum,limit,searchcontent);
		
		int maxpage = (int)((double)listcount/limit + 0.95);
		int startpage = (int)((pageNum/10.0 + 0.9)-1)*10+1;
		int endpage = startpage + 9;
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		mav.addObject("pageNum",pageNum);
		mav.addObject("maxpage",maxpage);
		mav.addObject("startpage",startpage);
		mav.addObject("endpage",endpage);
		mav.addObject("boardlist",snslist);
		mav.addObject("listcount",listcount);
		
		return mav;
		
	}
	
	

}

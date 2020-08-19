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
import org.springframework.web.servlet.ModelAndView;

import exception.SnsException;
import logic.Comment;
import logic.ShopService;
import logic.Sns;
import logic.SnsItem;
import logic.User;


@Controller
@RequestMapping("sns")	
public class SnsController {
	@Autowired
	private ShopService service;
	
	@GetMapping("main")
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
		sns.setSns_no(service.snsNum());
		if(category == null && detail == null) {
			category = "";
			detail = "";
		} else {
			String[] cg = category.split(",");
			String[] dt = detail.split(",");
			for(int i=0;i<cg.length;i++) {
				SnsItem item = new SnsItem(sns.getSns_no(),i+1,cg[i],dt[i]);
				list.add(item);
			}
			sns.setItemList(list);
		}
		sns.setItemList(list);
		service.snsWrite(sns,request);
		if(sns.getType()==1) {
			mav.setViewName("redirect:main.shop?ksb=new&type=1");
		} else if(sns.getType()==2) {
			mav.setViewName("redirect:main.shop?type=2");
		}
		return mav;
	}
	
	@RequestMapping("main")
	public ModelAndView list(String ksb,String type,Integer pageNum,String searchcontent) {
		ModelAndView mav = new ModelAndView();
		if(type == null) {
			ksb = "hot";
			type = "1";
		}
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
	
	@PostMapping("comment")
	public ModelAndView comment(Comment comment) {
		ModelAndView mav = new ModelAndView();
		comment.setReply_no(service.replyNum(comment.getSns_no()));
		service.replyWrite(comment);
		mav.setViewName("redirect:detail.shop?sns_no="+comment.getSns_no());
		return mav;
	}
	
	@GetMapping("detail")
	public ModelAndView getSns(int sns_no) {
		ModelAndView mav = new ModelAndView();
		try {
			Sns sns = service.getSns(sns_no);
			User user = service.getUser(sns.getUserid());
			List<SnsItem> snsitems = service.getSnsItem(sns.getSns_no());
			sns.setItemList(snsitems);
			int commentnum = service.getcommentnum(sns_no);
			int likenum = service.getlikenum(sns_no);
			mav.addObject("commentnum",commentnum);
			mav.addObject("likenum",likenum);
			mav.addObject("snsitems",snsitems);
			mav.addObject("sns",sns);
			mav.addObject("user",user);
		} catch(Exception e) {
			throw new SnsException("없는 게시물입니다.","main.shop?ksb=new&type=1");
		}
		return mav;
	}
	
	

}

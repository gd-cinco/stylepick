package controller;

import java.util.ArrayList;
import java.util.Date;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import exception.ItemEmptyException;
import exception.QnaException;
import logic.Item;
import logic.Qna;
import logic.ShopService;
import logic.Sns;
import logic.SnsItem;
import logic.User;

@Controller		
@RequestMapping("item")
public class itemController {
		
		//객체 주입
		@Autowired
		private ShopService service;
		
		@RequestMapping("list")	//item/list.shop
		public ModelAndView list(Integer pageNum,String searchtype, String searchcontent, Integer category) {
			ModelAndView mav =new ModelAndView();
			if(pageNum==null || pageNum.toString().equals("")){
				pageNum=1;
			}
			if(searchtype == null || searchcontent == null ||searchtype.trim().equals("") || searchcontent.trim().equals("")) {
				searchtype =null;
				searchcontent =null;
			}
			int limit = 10;
			int listcount=service.getItemCount(searchtype,searchcontent);
			List<Item> itemList = service.getItemList(pageNum, limit,searchtype,searchcontent,category);
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
			mav.addObject("itemList",itemList);
			mav.addObject("listcount",listcount);
			return mav;
		}
		
		
	
		
		@RequestMapping("store")	//item/list.shop
		public ModelAndView storemain() {
			ModelAndView mav = new ModelAndView();
			List<Item> rankItems = service.getRankItems();
			List<Item> newItems = service.getNewItems();
			mav.addObject("rankItems",rankItems);
			mav.addObject("newItems",newItems);
			return mav;
		}
		
	

		@RequestMapping("create")
		public String addform(Model model) {
			model.addAttribute(new Item());
			return "item/add";
		}
		
		@PostMapping("qna")
		public ModelAndView add(@Valid Qna qna,BindingResult bresult,HttpServletRequest request) {
			ModelAndView mav = new ModelAndView("item/qna");
			if(bresult.hasErrors()) {
				mav.getModel().putAll(bresult.getModel());
				return mav;
			}
			try {
				service.qnaWrite(qna,request);
				mav.setViewName("redirect:list.shop");
			}catch (DataIntegrityViolationException e) {
				e.printStackTrace();
				throw new QnaException("게시물 등록에 실패!","write.shop");
			}
			return mav;
			
		}
	
		@PostMapping("reply")
		public ModelAndView reply(@Valid Qna qna) {
			ModelAndView mav = new ModelAndView("item/reply");
			service.qnaReply(qna);
			mav.setViewName("redirect:list.shop");
				

			return mav;
		}
		
		@RequestMapping("register")
		public ModelAndView add(@Valid Item item, BindingResult bresult, HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
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
		
		@RequestMapping("*") // /item/*.shop
		public ModelAndView detail(Integer item_no,Integer qna_no,HttpServletRequest request,Integer pageNum,String searchtype, String searchcontent) {
			ModelAndView mav =new ModelAndView();
			Item item=null;
			Qna qna=new Qna();
			try {
				if(item_no == null) {
					item =new Item();
				}else {
					boolean readcntable=false;
					if(request.getRequestURI().contains("detail.shop")) {
						readcntable=true;
					}
					item=service.getItem(item_no,readcntable);
					if(request.getRequestURI().contains("update.shop")) {
						String[] option = item.getItem_option().split(",");
						String[] size = item.getSize().split(",");
						mav.addObject("option",option);
						mav.addObject("size",size);
					}
				}
				
			mav.addObject("qna",qna);
			mav.addObject("item",item);
		}catch(IndexOutOfBoundsException e) {
			throw new ItemEmptyException("존재하지 않는 상품입니다.","list.shop");
		}
			
			if(pageNum==null || pageNum.toString().equals("")){
				pageNum=1;
			}
			if(searchtype == null || searchcontent == null ||searchtype.trim().equals("") || searchcontent.trim().equals("")) {
				searchtype =null;
				searchcontent =null;
			}
			int limit = 6;
			int listcount = service.qnacount(searchtype,searchcontent);
			List<Qna> qnalist = service.qnalist(pageNum, limit,searchtype,searchcontent,item_no);
			int maxpage = (int) ((double) listcount / limit + 0.95);
			int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;// 시작페이지번호
			int endpage = startpage + 9;// 종료페이지 번호

			if (endpage > maxpage) endpage = maxpage;
			int qnano = listcount - (pageNum - 1) * limit;
		
			
			mav.addObject("listcount",listcount);
			mav.addObject("qnalist",qnalist);
			mav.addObject("pageNum",pageNum);
			mav.addObject("qnano",qnano);
			mav.addObject("startpage",startpage);
			mav.addObject("maxpage",maxpage);
			mav.addObject("endpage",endpage);
			mav.addObject("today",new SimpleDateFormat("yyyyMMdd").format(new Date()));
			
			
			
			return mav;
		}
		
		@GetMapping("update")
		public ModelAndView getItem(Integer item_no,HttpServletRequest request) {
			ModelAndView mav =new ModelAndView();
			boolean readcntable=false;
			Item item=service.getItem(item_no,readcntable);
			String[] option = item.getItem_option().split(",");
			String[] size = item.getSize().split(",");
			mav.addObject("option",option);
			mav.addObject("size",size);
			mav.addObject("item",item);
			return mav;
		}
		
		@PostMapping("update")
		public ModelAndView update(Item item,HttpServletRequest request) {
			ModelAndView mav = new ModelAndView("item/update");
			service.itemUpdate(item,request);
			mav.setViewName("redirect:/item/detail.shop?item_no="+item.getItem_no());
			return mav;
		}
		
		@RequestMapping("imgupload")
		//upload : ckeditor에서 전달해 주는 파일 정보의 이름
		// 			<input type="file" name="upload">
		//CKEditorFuncNum: ckeditor에서 
		public String imgupload(MultipartFile upload,String CKEditorFuncNum, HttpServletRequest request, Model model) {
			String path=request.getServletContext().getRealPath("/") + "item/imgfile/"; //이미지는 저장할 폴더를 지정
			File f = new File(path);
			if(!f.exists()) f.mkdirs();
			if(!upload.isEmpty()) {	//업로드될 파일을 저장할 File 객체 지정
				File file= new File(path, upload.getOriginalFilename());
				try {
					upload.transferTo(file);	//업로드 파일 생성
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			String fileName =request.getServletContext().getContextPath()+"/item/imgfile/" +upload.getOriginalFilename();
			model.addAttribute("fileName",fileName);
			model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
			return "ckedit";
		}
		
		@PostMapping("delete")
		public ModelAndView delete(int item_no) {
			ModelAndView mav = new ModelAndView("item/update");
			service.itemDelete(item_no);
			mav.setViewName("redirect:/sns/main.shop");
			return mav;
		}
	
}

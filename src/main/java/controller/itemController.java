package controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
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
		
		@RequestMapping("*") // /item/*.shop
		public ModelAndView detail(Integer item_no,HttpServletRequest request) {
			ModelAndView mav =new ModelAndView();
			Item item=null;
			try {
				if(item_no == null) {
					item =new Item();
				}else {
					boolean readcntable=false;
					if(request.getRequestURI().contains("detail.shop"))
						readcntable=true;
					item=service.getItem(item_no,readcntable);
				}
			mav.addObject("item",item);
		}catch(IndexOutOfBoundsException e) {
			throw new ItemEmptyException("존재하지 않는 상품입니다.","list.shop");
		}
			
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
	
}

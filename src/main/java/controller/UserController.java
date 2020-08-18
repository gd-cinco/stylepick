package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import exception.LoginException;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private ShopService service;
	
	@RequestMapping("*")
	public String entryform(Model model) {
		model.addAttribute(new User());
		return null;
	}
	
	@RequestMapping("/confirmid")
	@ResponseBody
	public String confirm(String id) {
		int result = service.joincompare("userid",id);
		if(result>0)
			return "true";
		else
			return "false";
	}
	
	@RequestMapping("/confirmnickname")
	@ResponseBody
	public String confirm2(String nickname) {
		int result = service.joincompare("nickname",nickname);
		if(result>0)
			return "true";
		else
			return "false";
	}
	
	
	@PostMapping("userEntry")
	public ModelAndView add(@Valid User user,BindingResult bresult,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/userEntry");
		if(bresult.hasErrors()) {
			bresult.reject("error.input.user");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			int maxno = service.getmaxno();
			user.setNo(++maxno);
			service.userInsert(user);
			mav.setViewName("redirect:welcome.shop");
		}catch (DataIntegrityViolationException e) {
			e.printStackTrace();
			bresult.reject("error.input.user");
			mav.getModel().putAll(bresult.getModel());
		}
		return mav;
		
	}
	
	@PostMapping("login")
	public ModelAndView login(@Valid User user,BindingResult bresult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			bresult.reject("error.input.user");
			return mav;
		}
		try {
			User dbUser = service.getUser(user.getUserid());
			if(user.getPassword().equals(dbUser.getPassword())) {
				session.setAttribute("loginUser",dbUser);
				mav.setViewName("redirect:../sns/main.shop");
			}else {
				bresult.reject("error.login.password");
			}
		}catch (EmptyResultDataAccessException e) {
			bresult.reject("error.login.id");
		}catch (IndexOutOfBoundsException e) {
			bresult.reject("error.login.id");
		}
		return mav;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../sns/main.shop";
	}
	
	@GetMapping(value = {"update","delete"}) //sellerEntry
	public ModelAndView checkview(String id,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.getUser(id);
		mav.addObject("user",user);
		return mav;
	}
	@PostMapping("update")
	public ModelAndView checkupdate(@Valid User user,BindingResult bresult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			bresult.reject("error.input.user");
			return mav;
		}
		User loginUser = (User)session.getAttribute("loginUser");
		try {
			service.userUpdate(user);
			mav.setViewName("redirect:../sns/mypage.shop"); //admin이아닐땐 가능
			if(loginUser.getUserid().equals(user.getUserid())) {
				session.setAttribute("loginUser", user);
			}
		}catch (Exception e) {
			e.printStackTrace();
			bresult.reject("error.user.update");
		}
		return mav;
	}
	
	@PostMapping("sellerEntry")
	public ModelAndView checksellerEntry(User user,BindingResult bresult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			bresult.reject("error.input.user");
			return mav;
		}
		try {
			service.sellerEntry(user);
			mav.setViewName("redirect:../sns/mypage.shop"); 
		}catch (Exception e) {
			e.printStackTrace();
			bresult.reject("error.user.sellerEntry");
		}
		return mav;
	}

	@PostMapping("delete")
	public ModelAndView delete(String userid,String password,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("loginUser");
		if(userid.equals("admin")) {
			throw new LoginException("관리자 탈퇴는 불가능합니다.","main.shop");
		}
		if(loginUser.getPassword().equals(password)) {
			try {
				service.delete(userid);				
			}catch (Exception e) {
				e.printStackTrace();
				throw new LoginException("회원탈퇴시 오류가 발생했습니다.", "delete.shop?id="+userid);
			}
			if(loginUser.getUserid().equals("admin")) {
				mav.setViewName("redirect:main.shop");
			}else {
				session.invalidate();
				throw new LoginException(userid+"님 탈퇴되었습니다.", "login.shop");
			}
		}else {
			throw new LoginException("비밀번호가 틀립니다.", "delete.shop?id="+userid);
		}
		return mav;
	}
	
}

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
				mav.setViewName("redirect:main.shop");
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
		return "redirect:login.shop"; //TODO 메인페이지
	}
	@RequestMapping("main") //login이 되어야 실행가능함, loginXXX로 지정
	public String loginCheckmain(HttpSession session) {
		return null;
	}
	/*
	 * AOP 설정하기
	 * 1. UserController의 check로 시작하는 메서드에 매개변수가
	 *    id,session인 경우
	 *    -로그인 안된경우 : 로그인하세요. =>login.shop 페이지 이동
	 *    -admin이 아니면서, 다른아이디 정보 조회시. 본인 정보만 조회가능
	 *    					=>main.shop 페이지 이동
	 * 
	 * 
	 */
	
	@GetMapping(value = {"update","delete","mypage"}) 
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
	/*
	 * 회원탈퇴
	 *   1. 비밀번호 검증 불일치 : "비밀번호 오류메세지 출력. delete.shop이동
	 *   2. 비밀번호 검증 일치 
	 *        회원db에서 delete하기
	 *        회원인경우 : logout하고. login.shop
	 * 		   관리자인 경우 : main.shop으로 페이지 이동
	 */
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

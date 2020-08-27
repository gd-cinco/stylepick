package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.Reply;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("board")
public class BoardController {

	@Autowired
	private ShopService service;
	
	@GetMapping("*")
	public ModelAndView getBoard(Integer no, String t, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = null;
		
		if (no == null) {
			board = new Board();
			String title = "";
			int seq = 0;
			if (t != null) {
				switch (t) {
				case "n": title = "공지사항"; seq = 1; break;
				case "q": title = "QnA"; seq = 2; break;
				case "f": title = "FAQ"; seq = 3; break;
				}
				mav.addObject("title", title);
				mav.addObject("seq", seq);
				List<String> list = service.getCategoryList();
				mav.addObject("category", list);
			}
		} else {
			boolean readcntable = false;
			if (request.getRequestURI().contains("detail.shop")) {
				readcntable = true;
			}
			board = service.getBoard(no, readcntable);
			
			Map<String, String> map = new HashMap<String, String>();
			switch (board.getSeq()) {
			case 1: map.put("title", "공지사항"); map.put("uri", "notice.shop"); break;
			case 2: map.put("title", "QnA"); map.put("uri", "qna.shop"); break;
			case 3: map.put("title", "FAQ"); map.put("uri", "faq.shop"); break;
			}

			List<Reply> reply = service.getReply(no);
			
			mav.addObject("type", map);
			mav.addObject("reply", reply);
		}
		
		mav.addObject("board", board);
		
		return mav;
	}

	@PostMapping("add")
	public ModelAndView write(Board board, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		service.boardWrite(board, request);
		mav.setViewName("redirect:support.shop");
	
		return mav;
	}
	
	@PostMapping("update")
	public ModelAndView update(Board board, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		service.boardUpdate(board, request);
		mav.setViewName("redirect:detail.shop?no=" + board.getNo());
		
		return mav;
	}

	@RequestMapping("delete")
	public ModelAndView delete(Board board) {
		ModelAndView mav = new ModelAndView();

		service.boardDelete(board.getNo());
		mav.setViewName("redirect:support.shop");

		return mav;
	}
	
	@PostMapping("regreply")
	public ModelAndView regreply(Reply reply, int bno, int seq, String author, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		User loginUser = (User)session.getAttribute("loginUser");
		if (loginUser == null) {
			mav.setViewName("redirect:/user/login.shop");
			return mav;
		}
		if (seq == 2) {
			if (loginUser.getUserid().equals("admin")) {
				service.boardStatComplete(bno);
			} else if (loginUser.getUserid().equals(author)) {
				service.boardStatWait(bno);
			}
		}
		reply.setAuthor(loginUser.getUserid());
		reply.setBno(bno);
		
		service.regReply(reply, request);
		mav.setViewName("redirect:detail.shop?no=" + bno);
	
		return mav;
	}
}
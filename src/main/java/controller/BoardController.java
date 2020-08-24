package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.ShopService;

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
			if (t != null) {
				switch (t) {
				case "n": title = "공지사항"; break;
				case "q": title = "QnA"; break;
				case "f": title = "FAQ"; break;
				default : System.out.println("unkown BoardType!!");
				}
				mav.addObject("title", title);
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
			default: System.out.println("unkown BoardType!!");
			}

			mav.addObject("type", map);
		}
		
		mav.addObject("board", board);
		
		return mav;
	}

	@PostMapping("write")
	public ModelAndView write(Board board, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		service.boardWrite(board, request);
		mav.setViewName("redirect:support.shop");
		
		return mav;
	}
}
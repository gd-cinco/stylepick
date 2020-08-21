package controller;

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
	public ModelAndView getBoard(Integer no, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = null;
		
		if (no == null) {
			board = new Board();
		} else {
			boolean readcntable = false;
			if (request.getRequestURI().contains("detail.shop")) {
				readcntable = true;
			}
			board = service.getBoard(no, readcntable);
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
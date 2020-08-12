package controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import logic.Board;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@RequestMapping("*")
	public String testing() {
		return null;
	}
	
}
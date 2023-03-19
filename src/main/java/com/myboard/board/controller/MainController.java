package com.myboard.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myboard.board.service.BoardService;

@Controller
public class MainController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String mainScreen(@RequestParam(defaultValue = "1") int reqPage, Model model) {
		Map<String, Object> boardInfoMap = boardService.getBoardListPagination(reqPage, "", "");
		
		model.addAttribute("boardList", boardInfoMap.get("boardList"));
		model.addAttribute("pagination", boardInfoMap.get("pagination"));
		model.addAttribute("totalBoard", boardInfoMap.get("totalBoard"));
		
		return "main";
	}
}

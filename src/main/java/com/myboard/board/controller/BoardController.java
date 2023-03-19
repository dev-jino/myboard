package com.myboard.board.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myboard.board.dto.BoardDTO;
import com.myboard.board.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/board_write", method = RequestMethod.GET)
	public String boardWrite() {
		return "board/board_write";
	}
	
	@RequestMapping(value = "/board_write", method = RequestMethod.POST)
	public String boardWrite(@ModelAttribute BoardDTO boardDTO) {
		boardService.addBoard(boardDTO);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/board_detail", method = RequestMethod.GET)
	public String boardDetail(@RequestParam int idx, HttpSession session, Model model) {
		BoardDTO boardDTO = boardService.getBoardIdx(idx);

		boardDTO.setContent(boardDTO.getContent().replace("\n", "<br>"));
		model.addAttribute("boardIdx", boardDTO);
		
		return "board/board_detail";
	}
	
	@RequestMapping(value = "/board_modify", method = RequestMethod.GET)
	public String boardModify(@RequestParam int idx ,Model model) {
		model.addAttribute("boardIdx", boardService.getBoardIdx(idx));
		
		return "board/board_modify";
	}

	@RequestMapping(value = "/board_modify", method = RequestMethod.POST)
	public String boardModify(@ModelAttribute BoardDTO boardDTO) {
		boardService.modifyBoard(boardDTO);
		
		return "redirect:/board_detail?idx="+ boardDTO.getIdx();
	}
	
	@RequestMapping(value = "/board_remove", method = RequestMethod.GET)
	public String boardRemove(@RequestParam int idx) {
		boardService.removeBoard(idx);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/board_search", method = RequestMethod.GET)
	public String boardSearch(@RequestParam(defaultValue = "1") int reqPage,
								@RequestParam String searchType, 
								@RequestParam String searchName, Model model) {

		Map<String, Object> boardInfoMap = boardService.getBoardListPagination(reqPage, searchType, searchName);
		
		model.addAttribute("boardList", boardInfoMap.get("boardList"));
		model.addAttribute("pagination", boardInfoMap.get("pagination"));
		model.addAttribute("totalBoard", boardInfoMap.get("totalBoard"));
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchName", searchName);
		
		return "board/board_search";
	}
}

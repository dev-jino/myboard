package com.myboard.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboard.board.dao.BoardDAO;
import com.myboard.board.dto.BoardDTO;
import com.myboard.board.util.Pagination;

@Service
public class BoardServiceImpl implements BoardService  {
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public Map<String, Object> getBoardListPagination(int reqPage, String searchType, String searchName) {
		int pageSize = 5;
		int blockSize = 5;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType", searchType);
		map.put("searchName", searchName);
		
		int totalBoard = boardDAO.selectBoardCount(map);
		
		Pagination pagination = new Pagination(reqPage, totalBoard, pageSize, blockSize);
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("startRow", pagination.getStartRow());
		pageMap.put("endRow", pagination.getEndRow());
		pageMap.put("searchType", searchType);
		pageMap.put("searchName", searchName);
		
		List<BoardDTO> boardList = boardDAO.selectBoardListPagination(pageMap);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("boardList", boardList);
		returnMap.put("pagination", pagination);
		returnMap.put("totalBoard", totalBoard);
		returnMap.put("searchType", searchType);
		returnMap.put("searchName", searchName);
		
		return returnMap;
	}

	@Override
	public void addBoard(BoardDTO boardDTO) {
		boardDAO.insertBoard(boardDTO);
	}

	@Override
	public BoardDTO getBoardIdx(int idx) {
		boardDAO.updateBoardHit(idx);
		
		return boardDAO.selectBoardIdx(idx);
	}

	@Override
	public void modifyBoard(BoardDTO boardDTO) {
		boardDAO.updateBoard(boardDTO);
	}

	@Override
	public void removeBoard(int idx) {
		boardDAO.deleteBoard(idx);
	}
}

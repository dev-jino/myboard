package com.myboard.board.service;

import java.util.Map;

import com.myboard.board.dto.BoardDTO;

public interface BoardService {
	Map<String, Object> getBoardListPagination(int reqPage, String searchType, String searchName);
	void addBoard(BoardDTO boardDTO);
	BoardDTO getBoardIdx(int idx);
	void modifyBoard(BoardDTO boardDTO);
	void removeBoard(int idx);
}

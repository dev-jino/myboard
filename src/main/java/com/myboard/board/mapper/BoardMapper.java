package com.myboard.board.mapper;

import java.util.List;
import java.util.Map;

import com.myboard.board.dto.BoardDTO;

public interface BoardMapper {
	List<BoardDTO> selectBoardListPagination(Map<String, Object> paginationMap);
	int insertBoard(BoardDTO boardDTO);
	BoardDTO selectBoardIdx(int idx);
	int updateBoard(BoardDTO boardDTO);
	int deleteBoard(int idx);
	int selectBoardCount(Map<String, Object> map);
	int updateBoardHit(int idx);
}

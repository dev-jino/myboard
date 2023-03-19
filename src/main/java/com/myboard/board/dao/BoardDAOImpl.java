package com.myboard.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myboard.board.dto.BoardDTO;
import com.myboard.board.mapper.BoardMapper;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> selectBoardListPagination(Map<String, Object> paginationMap) {
		return sqlSession.getMapper(BoardMapper.class).selectBoardListPagination(paginationMap);
	}

	@Override
	public int insertBoard(BoardDTO boardDTO) {
		return sqlSession.getMapper(BoardMapper.class).insertBoard(boardDTO);
	}

	@Override
	public BoardDTO selectBoardIdx(int idx) {
		return sqlSession.getMapper(BoardMapper.class).selectBoardIdx(idx);
	}

	@Override
	public int updateBoard(BoardDTO boardDTO) {
		return sqlSession.getMapper(BoardMapper.class).updateBoard(boardDTO);
	}

	@Override
	public int deleteBoard(int idx) {
		return sqlSession.getMapper(BoardMapper.class).deleteBoard(idx);
	}

	@Override
	public int selectBoardCount(Map<String, Object> map) {
		return sqlSession.getMapper(BoardMapper.class).selectBoardCount(map);
	}

	@Override
	public int updateBoardHit(int idx) {
		return sqlSession.getMapper(BoardMapper.class).updateBoardHit(idx);
	}
}

package com.myboard.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myboard.board.dto.RecommendDTO;
import com.myboard.board.mapper.RecommendMapper;

@Repository
public class RecommendDAOImpl implements RecommendDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectRecommendCountBoardIdx(int boardIdx) {
		return sqlSession.getMapper(RecommendMapper.class).selectRecommendCountBoardIdx(boardIdx);
	}
	
	@Override
	public int selectIsRecommend(RecommendDTO recommendDTO) {
		return sqlSession.getMapper(RecommendMapper.class).selectIsRecommend(recommendDTO);
	}

	@Override
	public int insertRecommend(RecommendDTO recommendDTO) {
		return sqlSession.getMapper(RecommendMapper.class).insertRecommend(recommendDTO);
	}

	@Override
	public int deleteRecommend(RecommendDTO recommendDTO) {
		return sqlSession.getMapper(RecommendMapper.class).deleteRecommend(recommendDTO);
	}
}

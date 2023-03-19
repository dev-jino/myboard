package com.myboard.board.dao;

import com.myboard.board.dto.RecommendDTO;

public interface RecommendDAO {
	int selectRecommendCountBoardIdx(int boardIdx);
	int selectIsRecommend(RecommendDTO recommendDTO);
	int insertRecommend(RecommendDTO recommendDTO);
	int deleteRecommend(RecommendDTO recommendDTO);
}

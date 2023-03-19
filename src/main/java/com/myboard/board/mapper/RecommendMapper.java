package com.myboard.board.mapper;

import com.myboard.board.dto.RecommendDTO;

public interface RecommendMapper {
	int selectRecommendCountBoardIdx(int boardIdx);
	int selectIsRecommend(RecommendDTO recommendDTO);
	int insertRecommend(RecommendDTO recommendDTO);
	int deleteRecommend(RecommendDTO recommendDTO);
}

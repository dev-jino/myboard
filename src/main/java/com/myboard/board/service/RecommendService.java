package com.myboard.board.service;

import com.myboard.board.dto.RecommendDTO;

public interface RecommendService {
	int getIsRecommend(RecommendDTO recommendDTO);
	int addRecommend(RecommendDTO recommendDTO);
	int removeRecommend(RecommendDTO recommendDTO);
}

package com.myboard.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboard.board.dao.RecommendDAO;
import com.myboard.board.dto.RecommendDTO;

@Service
public class RecommendServiceImpl implements RecommendService {
	@Autowired
	private RecommendDAO recommendDAO;
	
	@Override
	public int getIsRecommend(RecommendDTO recommendDTO) {
		return recommendDAO.selectIsRecommend(recommendDTO);
	}

	@Override
	public int addRecommend(RecommendDTO recommendDTO) {
		recommendDAO.insertRecommend(recommendDTO);
		
		return recommendDAO.selectRecommendCountBoardIdx(recommendDTO.getBoardIdx());
	}

	@Override
	public int removeRecommend(RecommendDTO recommendDTO) {
		recommendDAO.deleteRecommend(recommendDTO);
		
		return recommendDAO.selectRecommendCountBoardIdx(recommendDTO.getBoardIdx());
	}
}

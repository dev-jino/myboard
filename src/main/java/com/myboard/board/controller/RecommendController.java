package com.myboard.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myboard.board.dto.MemberDTO;
import com.myboard.board.dto.RecommendDTO;
import com.myboard.board.service.RecommendService;

@Controller
public class RecommendController {
	@Autowired
	private RecommendService recommendService;
	
	@RequestMapping(value = "/board_recommend", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> boardRecommend(@RequestParam int boardIdx, HttpSession session) {
		RecommendDTO recommendDTO = new RecommendDTO();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("loginMember");

		recommendDTO.setMemberId(memberDTO.getId());
		recommendDTO.setBoardIdx(boardIdx);
		int isRecommend = recommendService.getIsRecommend(recommendDTO);
		int boardRecommendCount = 0;
		String alertMsg = "";

		if (isRecommend == 0) {
			boardRecommendCount = recommendService.addRecommend(recommendDTO);
			alertMsg = "추천하셨습니다.";
		} else {
			boardRecommendCount = recommendService.removeRecommend(recommendDTO);
			alertMsg = "추천 취소하셨습니다.";
		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("boardRecommendCount", boardRecommendCount);
		returnMap.put("alertMsg", alertMsg);

		return returnMap;
	}
}


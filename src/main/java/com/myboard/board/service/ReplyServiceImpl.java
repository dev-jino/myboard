package com.myboard.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboard.board.dao.ReplyDAO;
import com.myboard.board.dto.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDAO replyDAO;

	@Override
	public Map<String, Object> getReplyList(Map<String, Object> map) {	
		Map<String, Object> replyInfo = new HashMap<String, Object>();
		int replyCount = replyDAO.selectReplyCountBoardIdx(Integer.parseInt(map.get("boardIdx").toString()));
		List<ReplyDTO> replyList = replyDAO.selectReplyList(map);
		
		System.out.println("replyListCount : " + replyList.size());
		
		replyInfo.put("replyCount", replyCount);
		replyInfo.put("replyList", replyList);
		
		return replyInfo;
	}

	@Override
	public void addReply(ReplyDTO replyDTO) {
		replyDAO.insertReply(replyDTO);
	}

	@Override
	public void modifyReply(ReplyDTO replyDTO) {
		replyDAO.updateReply(replyDTO);
	}

	@Override
	public void removeReply(int idx) {
		replyDAO.deleteReply(idx);
	}

	@Override
	public int getReplyCountBoardIdx(int BoardIdx) {
		return replyDAO.selectReplyCountBoardIdx(BoardIdx);
	}

}

package com.myboard.board.service;

import java.util.Map;

import com.myboard.board.dto.ReplyDTO;

public interface ReplyService {
	Map<String, Object> getReplyList(Map<String, Object> map);
	void addReply(ReplyDTO replyDTO);
	void modifyReply(ReplyDTO replyDTO);
	void removeReply(int idx);
	int getReplyCountBoardIdx(int BoardIdx);
}

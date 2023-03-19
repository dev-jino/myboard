package com.myboard.board.dao;

import java.util.List;
import java.util.Map;

import com.myboard.board.dto.ReplyDTO;

public interface ReplyDAO {
	List<ReplyDTO> selectReplyList(Map<String, Object> map);
	int insertReply(ReplyDTO replyDTO);
	int updateReply(ReplyDTO replyDTO);
	int deleteReply(int idx);
	int selectReplyCountBoardIdx(int BoardIdx);
}

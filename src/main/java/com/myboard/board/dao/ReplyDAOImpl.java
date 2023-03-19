package com.myboard.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myboard.board.dto.ReplyDTO;
import com.myboard.board.mapper.ReplyMapper;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReplyDTO> selectReplyList(Map<String, Object> map) {
		return sqlSession.getMapper(ReplyMapper.class).selectReplyList(map);
	}

	@Override
	public int insertReply(ReplyDTO replyDTO) {
		return sqlSession.getMapper(ReplyMapper.class).insertReply(replyDTO);
	}

	@Override
	public int updateReply(ReplyDTO replyDTO) {
		return sqlSession.getMapper(ReplyMapper.class).updateReply(replyDTO);
	}

	@Override
	public int deleteReply(int idx) {
		return sqlSession.getMapper(ReplyMapper.class).deleteReply(idx);
	}

	@Override
	public int selectReplyCountBoardIdx(int BoardIdx) {
		return sqlSession.getMapper(ReplyMapper.class).selectReplyCountBoardIdx(BoardIdx);
	}

}

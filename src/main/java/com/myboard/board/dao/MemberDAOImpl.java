package com.myboard.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myboard.board.dto.MemberDTO;
import com.myboard.board.mapper.MemberMapper;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MemberDTO> selectMemberList() {
		return sqlSession.getMapper(MemberMapper.class).selectMemberList();
	}

	@Override
	public int updateMember(MemberDTO memberDTO) {
		return sqlSession.getMapper(MemberMapper.class).updateMember(memberDTO);
	}

	@Override
	public int insertMember(MemberDTO memberDTO) {
		return sqlSession.getMapper(MemberMapper.class).insertMember(memberDTO);
	}

	@Override
	public MemberDTO selectMemberId(String id) {
		return sqlSession.getMapper(MemberMapper.class).selectMemberId(id);
	}

	@Override
	public int selectMemberFindCount(MemberDTO memberDTO) {
		return sqlSession.getMapper(MemberMapper.class).selectMemberFindCount(memberDTO);
	}

	@Override
	public MemberDTO selectMemberFind(MemberDTO memberDTO) {
		return sqlSession.getMapper(MemberMapper.class).selectMemberFind(memberDTO);
	}

	@Override
	public int updateMemberPassword(MemberDTO memberDTO) {
		return sqlSession.getMapper(MemberMapper.class).updateMemberPassword(memberDTO);
	}

}

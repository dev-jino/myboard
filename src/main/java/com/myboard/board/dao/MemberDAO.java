package com.myboard.board.dao;

import java.util.List;

import com.myboard.board.dto.MemberDTO;

public interface MemberDAO {
	List<MemberDTO> selectMemberList();
	int updateMember(MemberDTO memberDTO);
	int insertMember(MemberDTO memberDTO);
	MemberDTO selectMemberId(String id);
	int selectMemberFindCount(MemberDTO memberDTO);
	MemberDTO selectMemberFind(MemberDTO memberDTO);
	int updateMemberPassword(MemberDTO memberDTO);
}

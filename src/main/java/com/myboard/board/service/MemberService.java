package com.myboard.board.service;

import java.util.List;

import com.myboard.board.dto.MemberDTO;
import com.myboard.board.exception.LoginAuthFailException;

public interface MemberService {
	List<MemberDTO> getMemberList();
	void modifyMember(MemberDTO memberDTO);
	void addMember(MemberDTO memberDTO);
	void loginAuth(MemberDTO memberDTO) throws LoginAuthFailException;
	MemberDTO getMemberId(String id);
	boolean getMemberFindCount(MemberDTO memberDTO);
	MemberDTO getMemberFind(MemberDTO memberDTO);
	void modifyMemberPassword(MemberDTO memberDTO);
}

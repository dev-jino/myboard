package com.myboard.board.service;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboard.board.dao.MemberDAO;
import com.myboard.board.dto.MemberDTO;
import com.myboard.board.exception.LoginAuthFailException;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List<MemberDTO> getMemberList() {
		return memberDAO.selectMemberList();
	}

	@Override
	public void modifyMember(MemberDTO memberDTO) {
		memberDAO.updateMember(memberDTO);
	}

	@Override
	public void addMember(MemberDTO memberDTO) {
		memberDTO.setPwd(BCrypt.hashpw(memberDTO.getPwd(), BCrypt.gensalt()));
		memberDAO.insertMember(memberDTO);
	}

	@Override
	public void loginAuth(MemberDTO memberDTO) throws LoginAuthFailException {
		MemberDTO authMember = memberDAO.selectMemberId(memberDTO.getId());
		
		if (authMember == null || authMember.getStatus() == 0 || !BCrypt.checkpw(memberDTO.getPwd(), authMember.getPwd())) {
			throw new LoginAuthFailException("아이디 또는 비밀번호를 잘못 입력하셨습니다.<br>입력하신 내용을 다시 확인해주세요.", memberDTO.getId());
		}
	}

	@Override
	public MemberDTO getMemberId(String id) {
		return memberDAO.selectMemberId(id);
	}

	@Override
	public boolean getMemberFindCount(MemberDTO memberDTO) {
		int resultCount;
		
		resultCount = memberDAO.selectMemberFindCount(memberDTO);
		
		if (resultCount == 1) {
			return true;
		}
		
		return false;
	}

	@Override
	public MemberDTO getMemberFind(MemberDTO memberDTO) {

		return memberDAO.selectMemberFind(memberDTO);
	}

	@Override
	public void modifyMemberPassword(MemberDTO memberDTO) {
		memberDTO.setPwd(BCrypt.hashpw(memberDTO.getPwd(), BCrypt.gensalt()));
		memberDAO.updateMemberPassword(memberDTO);
	}

}

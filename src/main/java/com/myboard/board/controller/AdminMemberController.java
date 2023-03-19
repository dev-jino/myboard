package com.myboard.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myboard.board.dto.MemberDTO;
import com.myboard.board.service.MemberService;

@Controller
public class AdminMemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/admin_member", method = RequestMethod.GET)
	public String adminMember(Model model) {
		
		model.addAttribute("memberList", memberService.getMemberList());
		
		return "admin/admin_member";
	}
	
	@RequestMapping(value = "/admin_member", method = RequestMethod.POST)
	public String adminMember(@ModelAttribute MemberDTO memberDTO, Model model) {
		memberService.modifyMember(memberDTO);
		
		model.addAttribute("memberList", memberService.getMemberList());
		
		return "admin/admin_member";
	}
}

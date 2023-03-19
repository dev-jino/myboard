package com.myboard.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myboard.board.dto.MemberDTO;
import com.myboard.board.exception.LoginAuthFailException;
import com.myboard.board.service.MemberService;
import com.myboard.board.util.MailSender;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MailSender mailSender;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute MemberDTO memberDTO) {
		memberService.addMember(memberDTO);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/join/id_check", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam String id) {
		int idCheckValue;
		
		if (memberService.getMemberId(id) == null) {
			idCheckValue = 1;
		} else {
			idCheckValue = 0;
		}
		return idCheckValue;
	}
	
	@RequestMapping(value = "/join/email_auth", method = RequestMethod.GET)
	@ResponseBody
	public String emailAuth(@RequestParam String email) {
		System.out.println("이메일 인증요청 : " + email);
		
		return mailSender.makeAuthEmail(email);
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpSession session) {
		session.setAttribute("prevPage", request.getHeader("referer"));
		
		return "member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) throws LoginAuthFailException {
		memberService.loginAuth(memberDTO);
		session.setAttribute("loginMember", memberService.getMemberId(memberDTO.getId()));
		String prevPage = (String)session.getAttribute("prevPage");
		
        int startIndex = prevPage.indexOf("board") + 6;
        String prevPageURI = prevPage.substring(startIndex);
        
        if (prevPageURI.equals("")) {
        	prevPageURI = "/";
        }

		return "redirect:" + prevPageURI;
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/find_id", method = RequestMethod.GET)
	public String findId() {
		return "member/find_id";
	}
	
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public String findId(@ModelAttribute MemberDTO memberDTO, Model model) {
		MemberDTO getMemberDTO = memberService.getMemberFind(memberDTO);
				
		model.addAttribute("id", getMemberDTO.getId());
		model.addAttribute("name", getMemberDTO.getName());
		
		return "member/find_id_result";
	}

	@RequestMapping(value = "/join/email_auth_find", method = RequestMethod.GET)
	@ResponseBody
	public String emailAuthFind(@ModelAttribute MemberDTO memberDTO) {
		boolean nameEmailExist = memberService.getMemberFindCount(memberDTO);
		
		if (nameEmailExist == false) {
			
			return null;
		}
		
		return mailSender.makeAuthEmail(memberDTO.getEmail());
	}
	
	@RequestMapping("/find_id_result")
	public String findIdResult() {
		return "member/find_id_result";
	}
	
	@RequestMapping(value = "/find_password", method = RequestMethod.GET)
	public String findPassword() {
		return "member/find_password";
	}

	@RequestMapping(value = "/find_password", method = RequestMethod.POST)
	public String findPassword(@ModelAttribute MemberDTO memberDTO, Model model) {
		MemberDTO getMemberDTO = memberService.getMemberFind(memberDTO);
		
		model.addAttribute("id", getMemberDTO.getId());
		model.addAttribute("name", getMemberDTO.getName());
		
		return "member/find_password_input";
	}

	@RequestMapping(value = "/find_password_change", method = RequestMethod.POST)
	public String findPasswordChange(@ModelAttribute MemberDTO memberDTO, Model model) {
		memberService.modifyMemberPassword(memberDTO);
		
		model.addAttribute("msg", "비밀번호가 변경되었습니다.");
		model.addAttribute("url", "/board");
		
		return "util/alert";
	}
	
	@ExceptionHandler
	public String exceptionHandler(LoginAuthFailException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("id", exception.getId());
		
		return "member/login";
	}
	
}

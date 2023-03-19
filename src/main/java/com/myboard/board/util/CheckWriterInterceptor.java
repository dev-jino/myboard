package com.myboard.board.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.myboard.board.dto.BoardDTO;
import com.myboard.board.dto.MemberDTO;
import com.myboard.board.service.BoardService;

public class CheckWriterInterceptor implements HandlerInterceptor {
	@Autowired
	private BoardService boardService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		int boardIdx = Integer.parseInt(request.getParameter("idx"));
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("loginMember");
		String loginMember = memberDTO.getId();
		BoardDTO currentBoardInfo = boardService.getBoardIdx(boardIdx);
		
		if (!loginMember.equals(currentBoardInfo.getMemberId())) {
			request.getRequestDispatcher("user_error").forward(request, response);
			
			return false;
		}
		
		return true;
	}
}

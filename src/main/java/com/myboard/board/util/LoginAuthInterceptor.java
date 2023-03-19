package com.myboard.board.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginAuthInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String ajaxCheck = request.getHeader("x-requested-with");
		
		if (session.getAttribute("loginMember") == null) {
			if ("XMLHttpRequest".equals(ajaxCheck)) {
				response.sendError(999);
				
				return false;
			}
			response.sendRedirect("login");
			
			return false;
		}
		
		return true;
	}
}


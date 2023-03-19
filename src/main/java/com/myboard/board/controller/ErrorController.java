package com.myboard.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
	@RequestMapping("/user_error")
	public String userError() {
		
		return "error/user_error";
	}
}

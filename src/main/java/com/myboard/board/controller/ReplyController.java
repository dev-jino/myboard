package com.myboard.board.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myboard.board.dto.ReplyDTO;
import com.myboard.board.service.ReplyService;

@Controller
public class ReplyController {
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping(value = "/reply_list", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replyList(@RequestParam Map<String, Object> replyIndexParam/*int boardIdx*/) {
		Map<String, Object> indexParam = new HashMap<String, Object>();
				
		indexParam.put("boardIdx", replyIndexParam.get("boardIdx"));
		indexParam.put("start", replyIndexParam.get("start"));
		indexParam.put("end", replyIndexParam.get("end"));
		
		Map<String, Object> replyInfo = replyService.getReplyList(indexParam);

		return replyInfo;
	}
	
	@RequestMapping(value = "/reply_write", method = RequestMethod.POST)
	@ResponseBody
	public void replyWrite(@ModelAttribute ReplyDTO replyDTO) {
		replyService.addReply(replyDTO);
	}
	
	@RequestMapping(value = "/reply_modify", method = RequestMethod.POST)
	@ResponseBody
	public void replyModify(@ModelAttribute ReplyDTO replyDTO) {
		replyService.modifyReply(replyDTO);
	}
	
	@RequestMapping(value = "/reply_remove", method = RequestMethod.POST)
	@ResponseBody
	public void replyRemove(@RequestParam int idx) {
		replyService.removeReply(idx);
	}
}

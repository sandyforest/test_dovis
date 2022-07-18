package com.smhrd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.domain.Chat;
import com.smhrd.service.ChatService;

@RestController 
public class ChatRestController {
	
	@Autowired
	ChatService service;
	
	// 일정 내역이 적힌 채팅 디비에 등록
	// void여도 페이지 이동을 하려고 하니까 잡아줘야 함 
	// @ResponseBody 안 넣는 건 여기가 RestController이기 때문에
	@RequestMapping("/insertChatLog.do")
	public void insertChatLog(Chat vo) {		
		service.insertChatLog(vo);
	}

}

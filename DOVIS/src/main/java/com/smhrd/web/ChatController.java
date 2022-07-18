package com.smhrd.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.domain.Chat;
import com.smhrd.mapper.ChatMapper;
import com.smhrd.service.ChatService;

@Controller
public class ChatController {

	@Autowired
	ChatService service;
	// ChatMapper mapper;

	@RequestMapping("/chat.do")
	public String goChat() {
		return "chat";
	}

	// 일정 내역이 적힌 채팅 디비에 등록
	// void여도 페이지 이동을 하려고 하니까 잡아줘야 함
//	@ResponseBody
//	@RequestMapping("/insertChatLog.do")
//	public void insertChatLog(Chat vo) {
//		System.out.println("채팅로그화자: " +vo.getTalker());
//		System.out.println("채팅로그등록전: " +vo.getTalk());
//		System.out.println("채팅 로그 등록");		
//		mapper.insertChatLog(vo);
//		System.out.println("채팅로그등록후: " +vo.getTalk());
//	}


}

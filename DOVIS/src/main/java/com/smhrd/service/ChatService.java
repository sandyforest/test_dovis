package com.smhrd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.smhrd.domain.Chat;
import com.smhrd.mapper.ChatMapper;

@Service
public class ChatService {

	@Autowired
	ChatMapper mapper;

	// 일정 내역이 적힌 채팅 디비에 등록
	public void insertChatLog(Chat vo) {
	
		System.out.println("채팅접속자: " + vo.getTalker());
		System.out.println("채팅로그등록: " + vo.getTalk());
		System.out.println("채팅 로그 등록");
		mapper.insertChatLog(vo);
		
	}

}

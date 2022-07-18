package com.smhrd.mapper;

import com.smhrd.domain.Chat;

public interface ChatMapper {

	// 일정 대화만 저장하기
	public int insertChatLog(Chat chat);

}

package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;


@Data // 기본 메소드(Getter/Setter/toString)생성
@AllArgsConstructor // 모든 필드를 요소로 갖는 생성자 생성
@NoArgsConstructor // 디폴트 생성자 생성
@RequiredArgsConstructor // 필요한 필드만 요소로 갖는 생성자 생성
public class Chat {
	
	private int cd_seq;
	private int room_seq;
	
	@NonNull
	private String talker;
	
	@NonNull
	private String talk; // Members 테이블 private String mem_id 혹은 mem_name
	private String chat_time;
	
	private String chat_title;
	private String chat_opendate;
	private int chat_limit;
	private String mem_id;

}

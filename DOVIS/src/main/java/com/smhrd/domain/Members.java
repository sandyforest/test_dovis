package com.smhrd.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;


@Data // 기본 메소드(Getter/Setter/toString)생성
@AllArgsConstructor // 모든 필드를 요소로 갖는 생성자 생성
@NoArgsConstructor // 디폴트 생성자 생성
public class Members {
	
	// private int member_no;
	
	@NonNull
	private String mem_id;
	
	private String mem_pw;
		
	private String mem_name;
	
	private String mem_dept;
	
	private String mem_position;


}

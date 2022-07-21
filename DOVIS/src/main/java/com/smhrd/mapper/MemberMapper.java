package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.Members;

public interface MemberMapper {

	// 회원가입
	public int insertMember(Members member);

	// 로그인 기능
	public Members selectMember(Members member);

	// 조회 기능
	public List<Members> memberList();

	// 프로필 조회 기능
	public List<Members> checkMember(Members member);

}

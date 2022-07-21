package com.smhrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smhrd.domain.Members;
import com.smhrd.mapper.MemberMapper;

@Service
public class MemberService {

	// 컨트롤러 대신 로직 짜는 공간
	@Autowired
	MemberMapper mapper;

	// 회원가입
	public void insertMember(Members member) {
		mapper.insertMember(member);
	}

	// 로그인 기능
	public Members selectMember(Members member) {

		Members loginVO = mapper.selectMember(member);

		return loginVO;
	}

	// 조회 기능
	public List<Members> memberList() {

		List<Members> mlist = mapper.memberList();

		return mlist;
	}

	// 멤버 프로필 조회
	// 프로필 조회
	public List<Members> checkMember(Members members) {
		List<Members> checkP = mapper.checkMember(members);
		return checkP;
	}

}

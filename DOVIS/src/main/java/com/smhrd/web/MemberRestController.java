package com.smhrd.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.smhrd.domain.Members;
import com.smhrd.mapper.MemberMapper;
import com.smhrd.service.MemberService;

@RestController
public class MemberRestController {

	@Autowired
	MemberService service;
	// MemberMapper mapper;

//	@RequestMapping("/selectMember.do")
//	public Member selectMember(Model model, Member member) {
//		
//		Member loginVO = service.selectMember(member);
//		
//		System.out.println(loginVO.getId());
//		
//		model.addAttribute("loginVO", loginVO);
//		
//		return loginVO;
//		
//	}

	@RequestMapping("/memberList.do")
	public List<Members> memberList() {
		// @ResponseBody
		// 이 데이터를 응답 해 주겠다
		// 이때 페이지 이동 x

		// 글 데이터 가져오기
		List<Members> mlist = service.memberList();

		// 리턴이 값을 돌려주는 게 아니라, forward 방식으로 이동
		// ajax는 페이지 이동x

		// jackson databind 라이브러리
		// 객체를 리턴 --> json
		return mlist;
	}

	// 프로필 조회
	@RequestMapping("/check.do")
	public List<Members> checkMember(Members members) {
		List<Members> checkP = service.checkMember(members);
		return checkP;
	}

}

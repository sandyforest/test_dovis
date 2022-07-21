package com.smhrd.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.smhrd.domain.Members;
import com.smhrd.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;

	// start.jsp로 이동(로그인)
	@RequestMapping("/")
	public String base() {
		// WEB-INF/view/base.jsp
		return "start";
	}
	
	// 메인페이지로 이동
	@RequestMapping("/dovis.do")
	public String dovis() {
		return "main";
	}
	
	// home.jsp로 이동(to do list)
	@RequestMapping("/home.do")
	public String home() {
		return "home";
	}
	
	// 캘린더 페이지로 이동
	@RequestMapping("/calendar.do")
	public String calendar() {
		return "calendar";
	}
	
	// 정보수정 페이지로 이동
	@RequestMapping("/setting.do")
	public String setting() {
		return "setting";
	}
	
	// 로그인 페이지 이동
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}

	// 로그인 기능
	@RequestMapping("/selectMember.do")
	public String selectMember(Members member, HttpSession session) {

		Members loginVO = service.selectMember(member);

		System.out.println(loginVO.getMem_id());

		// 회원 인증 여부를 체크
		if (loginVO != null) { // 성공
			// 객체바인딩(중요)
			session.setAttribute("loginVO", loginVO); // JS->${loginVO}
			// 세션이 스프링 세큐리티보다 쉬워서
		}

		return "redirect:/dovis.do";
	}

	// 로그아웃 기능
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loginVO");

		return "redirect:/";
	}

}

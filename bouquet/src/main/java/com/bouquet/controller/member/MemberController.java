package com.bouquet.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bouquet.domain.member.MemberDTO;
import com.bouquet.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="/member/*")
public class MemberController {
	@Inject
	private MemberService service;
	
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberDTO mDto, HttpSession session) {
		log.info("AJAX : 회원인지 확인");
		boolean result = service.login(mDto, session);
		String flag = "-1";
		if(result) flag = "1";
		return flag;
	}
	
	
	@RequestMapping(value = "/constract", method = RequestMethod.GET)
	public String constract() {
		log.info(">>>>> 회원가입 동의");
		return "member/constract";
	}
	
	// 회원가입 페이지 출력
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String createView() {
		log.info(">>>>> 회원가입 페이지 출력");
		return "member/member_join";
	}
	
	// DB를 통한 회원가입 액션
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPlay(MemberDTO mDto) {
		log.info(">>>>> DB를 통한 회원가입 액션");
		
		int result = service.create(mDto);
		
		if( result > 0 ) {
			log.info("회원가입 성공");
			return "redirect:/";
		} else {
			log.info("회원가입 실패");
			return "/member/constract";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public int idcheck(String id) {
		log.info("AJAX : ID 중복 체크");
		
		return service.idCheck(id);
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete() {
		log.info(">>>>> 회원삭제");
		return "";
	}
}
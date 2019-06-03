package com.bouquet.controller.member;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bouquet.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="/member/*")
public class MemberController {
	@Inject
	private MemberService service;
	
	@RequestMapping(value = "/constract", method = RequestMethod.GET)
	public String constract() {
		log.info(">>>>> 회원가입 동의");
		return "member/constract";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create() {
		log.info(">>>>> 회원가입 페이지 출력");
		return "member/member_join";
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

package com.bouquet.service.member;

import javax.servlet.http.HttpSession;

import com.bouquet.domain.member.MemberDTO;

public interface MemberService {
	// AJAX : ID 중복 체크
	public int idCheck(String id);
	// 회원가입
	public int create(MemberDTO mDto);
	// 회원확인
	public boolean login(MemberDTO mDto, HttpSession session);
}

package com.bouquet.service.member;

import javax.servlet.http.HttpSession;

import com.bouquet.domain.member.MemberDTO;

public interface MemberService {
	// AJAX : ID 중복 체크
	public int idCheck(String id);
	// 회원가입
	public int create(MemberDTO mDto);
	// 로그인
	public boolean login(MemberDTO mDto, HttpSession session);
	// 로그아웃
	public void logout(HttpSession session);
	// 회원정보 1건 검색
	public MemberDTO viewMember(HttpSession session);
	// 회원정보 수정
	public void update(MemberDTO mDto, HttpSession session);
	// 비밀번호 일치여부 확인
	public String pwCheck(MemberDTO mDto);
	// 비밀번호 수정
	public void pwUpdate(MemberDTO mDto);
	// 회원 탈퇴
	public void delete(String bid, HttpSession session);
	
	
}

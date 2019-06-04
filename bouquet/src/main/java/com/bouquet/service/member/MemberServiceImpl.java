package com.bouquet.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.bouquet.domain.member.MemberDTO;
import com.bouquet.persistence.member.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO mDao;
	
	@Override
	public int idCheck(String id) {
		
		return mDao.idCheck(id);
	}

	@Override
	public int create(MemberDTO mDto) {
		// 비즈니스 로직을 처리하는 부분
		// 비즈니스 로직 : 회원가입
		// 회원가입을 하기 위해서는 DB를 사용해야함
		return mDao.create(mDto);
	}

	@Override
	public boolean login(MemberDTO mDto, HttpSession session) {
		// 비즈니스 로직
		// : 1) DB에 ID와 PW가 매칭되는지 확인
		// : 2) 매칭이 되면 session에 담음
		// : 3) 매칭이 실패하면 modal창 경고메시지 출력
		String name = mDao.login(mDto);
		boolean result = false;
		if(name != null) { // 로그인 성공
			session.setAttribute("bid", mDto.getBid());
			session.setAttribute("bname", name);
			result = true;
		}
		
		return result;
	}
	
}

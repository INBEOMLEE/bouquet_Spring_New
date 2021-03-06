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
			session.removeAttribute("bid");
			session.removeAttribute("bname");
			session.setAttribute("bid", mDto.getBid());
			session.setAttribute("bname", name);
			result = true;
		}
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public MemberDTO viewMember(HttpSession session) {
		String bid = (String) session.getAttribute("bid");
		return mDao.viewMember(bid);
	}
	
	@Override
	public void update(MemberDTO mDto, HttpSession session) {
		int result = mDao.update(mDto);
		
		if(result > 0) {
			log.info("회원정보 수정 완료");
			session.removeAttribute("bname");
			session.setAttribute("bname", mDto.getBname());
		} else {
			log.info("회원정보 수정 실패");
		}
	}

	@Override
	public String pwCheck(MemberDTO mDto) {
		// DB에서 가져온 현재 비밀번호와 사용자가 입력한 현재 비밀번호가 같은지 체크해서
		// 같으면 1, 틀리면 -1을 view 단으로 전송
		String bname = mDao.login(mDto);
		String result = "-1";
		if( bname != null ) result = "1";
		
		
		return result;
	}

	@Override
	public void pwUpdate(MemberDTO mDto) {
		
		int result = mDao.pwUpdate(mDto); 
		
		if(result > 0) {
			log.info("비밀번호 수정 완료");
		} else {
			log.info("비밀번호 수정 실패");
		}
	}

	@Override
	public void delete(String bid, HttpSession session) {
		int result = mDao.delete(bid);
		
		if(result > 0) {
			log.info("회원탈퇴 완료");
			session.invalidate();
		} else {
			log.info("회원탈퇴 실패");
		}
	}

}

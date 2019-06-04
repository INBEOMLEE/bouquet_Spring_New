package com.bouquet.persistence.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bouquet.domain.member.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int idCheck(String id) {
		return sqlSession.selectOne("member.idCheck", id);
	}

	@Override
	public int create(MemberDTO mDto) {
		return sqlSession.insert("member.create", mDto);
	}

	@Override
	public String login(MemberDTO mDto) {
		return sqlSession.selectOne("member.login", mDto);
	}

}
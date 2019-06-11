package com.bouquet.persistence.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bouquet.domain.board.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject
	private SqlSession session;

	@Override
	public List<ReplyDTO> list(int bno) {
		return session.selectList("reply.list", bno);
	}

	@Override
	public void create(ReplyDTO rDto) {
		
	}

	@Override
	public void delete(ReplyDTO rDto) {
		
	}
}

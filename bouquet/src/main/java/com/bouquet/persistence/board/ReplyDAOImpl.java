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
	public int create(ReplyDTO rDto) {
		return session.insert("reply.create", rDto);
	}

	@Override
	public int delete(int rno) {
		return session.delete("reply.delete", rno);
	}

	/*
	 * @Override public int selectOne(int bno) { return
	 * session.selectOne("reply.selectOne", bno); }
	 */
}

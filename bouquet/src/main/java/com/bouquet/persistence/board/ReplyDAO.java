package com.bouquet.persistence.board;

import java.util.List;

import com.bouquet.domain.board.ReplyDTO;

public interface ReplyDAO {
	public List<ReplyDTO> list(int bno); // 댓글 목록
	public int create(ReplyDTO rDto);   // 댓글 등록
	public int delete(int rno);   // 댓글 삭제
	/*
	 * public int selectOne(int bno); // 1개의 게시글 댓글 수 조회
	 */}

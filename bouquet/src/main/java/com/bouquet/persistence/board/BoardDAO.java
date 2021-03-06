package com.bouquet.persistence.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.bouquet.domain.board.BoardDTO;
import com.bouquet.domain.board.ReplyDTO;

public interface BoardDAO {
	public void create(BoardDTO bDto);      // 게시글 등록
	public void update(BoardDTO bDto);      // 게시글 수정
	public void delete(int bno);            // 게시글 삭제
	public BoardDTO read(int bno);          // 상세 게시글
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end);        // 게시글 목록 (페이지 나누기, 검색기능 포함)
	public void increaseViewCnt(int bno);      // 조회수 증가 처리
	public int countArticle(String search_option, String keyword);  // 레코드 개수 계산
	/* public int replyCntUpdate(int bno, int replycnt); */
	public void updateReplyCnt(HashMap<String, Object> map);
}

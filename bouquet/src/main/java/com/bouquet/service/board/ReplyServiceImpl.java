package com.bouquet.service.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.bouquet.domain.board.ReplyDTO;
import com.bouquet.persistence.board.BoardDAO;
import com.bouquet.persistence.board.ReplyDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO rDao;
	@Inject
	private BoardDAO bDao;

	@Override
	public List<ReplyDTO> list(int bno) {
		return rDao.list(bno);
	}

	@Override
	public void create(ReplyDTO rDto) {
		
		/*
		 * int result = rDao.create(rDto);
		 * 
		 * if(result > 0) { log.info(">>>>> 댓글 등록 성공"); int bno = rDto.getBno();
		 * 
		 * int replycnt= rDao.selectOne(bno); int code = bDao.replyCntUpdate(bno,
		 * replycnt); if(code > 0) log.info(">>>>> 게시글 테이블의 댓글 수 수정 완료"); }
		 */
		
		rDao.create(rDto);
		HashMap<String, Object> map = new HashMap<>();
		map.put("flag", "plus");
		map.put("bno", rDto.getBno());
		bDao.updateReplyCnt(map);
	}

	@Override
	public void delete(ReplyDTO rDto) {
		
		/*
		 * int result = rDao.delete(rDto); if(result > 0) { log.info(">>>>> 댓글 삭제 성공");
		 * int bno = rDto.getBno();
		 * 
		 * int replycnt= rDao.selectOne(bno); int code = bDao.replyCntUpdate(bno,
		 * replycnt); if(code > 0) log.info(">>>>> 게시글 테이블의 댓글 수 수정 완료"); }
		 */
		
		rDao.delete(rDto.getRno());
		HashMap<String, Object> map = new HashMap<>();
		map.put("flag", "minus");
		map.put("bno", rDto.getBno());
		bDao.updateReplyCnt(map);
	}
}

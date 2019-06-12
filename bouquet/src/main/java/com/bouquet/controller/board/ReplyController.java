package com.bouquet.controller.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bouquet.domain.board.ReplyDTO;
import com.bouquet.service.board.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("reply/*")
public class ReplyController {
	
	@Inject
	private ReplyService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listAll(int bno, Model model) {
		log.info(">>>>> 댓글 목록 출력");
		
		List<ReplyDTO> list = service.list(bno);
		model.addAttribute("replyList", list);
		
		return "/board/commentlist";
	}
	
	@ResponseBody
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public void create(ReplyDTO rDto) {
		log.info(">>>>> 댓글 등록 구현");
		
		service.create(rDto);
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void delete(ReplyDTO rDto) {
		log.info(">>>>> 댓글 삭제 구현");
		
		service.delete(rDto);
	}
	
}

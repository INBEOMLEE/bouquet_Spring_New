package com.bouquet.controller.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bouquet.domain.board.BoardDTO;
import com.bouquet.service.board.BoardService;
import com.bouquet.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board/*")
@Slf4j
public class BoardController {
	
	@Inject
	private BoardService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(
			@RequestParam(defaultValue = "new") String sort_option,
			@RequestParam(defaultValue = "all") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage ) {
		log.info(">>>>> 게시글 목록 출력");
		
		// 레코드 개수 계산
		int count = service.countArticle(search_option, keyword);
		
		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		// 페이지에 출력할 게시글 목록
		List<BoardDTO> list = service.listAll(sort_option, search_option, keyword, start, end);
		
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		mav.setViewName("board/list");
		mav.addObject("map", map);
		
		return mav;
	}
	
	// 게시글 1건 (상세 게시글) 출력
	@RequestMapping (value = "/view", method = RequestMethod.GET)
	public String view(int bno, Model model, HttpSession session) {
		log.info(">>>>> 상세 게시글 출력");
		// 조회수 증가처리
		service.increaseViewCnt(bno, session);
		
		BoardDTO bDto = service.read(bno);
		model.addAttribute("bDto", bDto);
		
		return "/board/view";
	}
	
	// 게시글 등록 페이지 이동
	@RequestMapping (value = "/create", method = RequestMethod.GET)
	public String createView() {
		log.info(">>>>> 게시글 등록 페이지 출력");
		
		return "/board/register";
	}
	
	// 게시글 등록 페이지 이동
	@RequestMapping (value = "/create", method = RequestMethod.POST)
	public String createPlay(BoardDTO bDto) {
		log.info(">>>>> 게시글 등록 구현");
		
		service.create(bDto);
		
		return "redirect:/board/view?bno=" + bDto.getBno();
	}
	
	// 게시글 수정 페이지 이동
	@RequestMapping (value = "/update", method = RequestMethod.GET)
	public String updateView(int bno, Model model, HttpServletRequest request, HttpSession session) {
		log.info(">>>>> 게시글 페이지 출력");
		BoardDTO bDto = service.read(bno);
		model.addAttribute("bDto", bDto);
		
		session.removeAttribute("URI");
		session.setAttribute("URI", request.getHeader("referer"));
		
		return "/board/modify";
	}
	
	// 게시글 수정 기능 구현
	@RequestMapping (value = "/update", method = RequestMethod.POST)
	public String updatePlay(BoardDTO bDto, HttpServletRequest request, HttpSession session) {
		log.info(">>>>> 게시글 수정 기능 구현");
		service.update(bDto);
		
		return "redirect:" + session.getAttribute("URI");
	}
	
	// 게시글 삭제 기능 구현
	@RequestMapping (value = "/delete", method = RequestMethod.GET)
	public String deleteView(int bno) {
		log.info(">>>>> 게시글 삭제 기능 구현");
		service.delete(bno);
		
		return "redirect:/";
	}
	
}

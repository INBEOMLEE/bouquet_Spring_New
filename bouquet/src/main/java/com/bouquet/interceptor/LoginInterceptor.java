package com.bouquet.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	
	// 메인액션 실행되기 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session 체크, 값이 있으면 통과 
		//              값이 없으면 돌려보냄 ( 원래 페이지로 돌아가서 모달창 키고 에러메시지 출력 )
		HttpSession session = request.getSession();
		
		if(session.getAttribute("bid") == null) {
			log.info("Interceptor : 로그인이 되어있지 않습니다.");
			String referer = request.getHeader("referer");
			String uri = request.getRequestURI();
			
			// /board/create
			int index = referer.lastIndexOf("/"); // 6
			int length = referer.length(); // 12
			String url = referer.substring(index, length);
			log.info("수정된 URL : " + url);
			
			if(url.equals("/create")) {
				response.sendRedirect(request.getContextPath() + "/board/list");
				return false;
			}
			
			
			
			// Login 페이지로 이동
			FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
			flashMap.put("message", "nologin");
			flashMap.put("uri", uri);
			log.info(">>>>> URI : " + uri);
			
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			
			
			
			return false;
		} else {
			log.info("Interceptor : 로그인 확인 완료");
			return true;
		}
		// return true  → 통과
		// return false → 통과하지 못함
	}                                                       
	
	// 메인액션 실행 된 후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
}

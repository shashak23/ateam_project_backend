/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-16
 * 내용: 기존 접속되어 있던 url 불러온다. 
 */
package com.ktdsuniversity.edu.beans;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class NextUrlInterceptor implements HandlerInterceptor {

	private Logger logger = LoggerFactory.getLogger(NextUrlInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
//		Enumeration<String> headerNames = request.getHeaderNames();
//		while(headerNames.hasMoreElements()) {
//			String headerName = headerNames.nextElement();
//			logger.debug("Header: {}", headerName);
//			logger.debug("Value: {}", request.getHeader(headerName));
//		}
		
		String method = request.getMethod();
		if (method.equalsIgnoreCase("get")) {
			String referer = request.getHeader("referer");
			modelAndView.addObject("next", referer);
		}
		
		
	}
	
}

package com.ktdsuniversity.edu.beans;

import java.util.Enumeration;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.member.vo.MemberVO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CheckSessionInterceptor implements HandlerInterceptor{
	@Override 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("_LOGIN_USER_");
		if(memberVO == null) {
			String method = request.getMethod().toLowerCase();
			if(method.equals("get")) {
				String requestURI = request.getRequestURI();
				String queryString = getQueryString(request);
				request.setAttribute("next",requestURI+queryString);
			}
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/member/memberlogin.jsp");
			rd.forward(request, response);
			return false;
		}
		return true;
	}
	private String getQueryString(HttpServletRequest request) {
		String queryString = "";
		
		Enumeration<String> parameterNames = request.getParameterNames();
		String parameterName = null;
		while(parameterNames.hasMoreElements()) {
			parameterName = parameterNames.nextElement();
			
			if(queryString.equals("")) {
				queryString="?";
			}
			else {
				queryString +="&";
			}
			queryString += parameterName+ "=" +
							request.getParameter(parameterName);
		}
		return queryString;
	}
	
}

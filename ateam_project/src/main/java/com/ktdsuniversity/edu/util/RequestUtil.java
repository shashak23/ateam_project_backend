package com.ktdsuniversity.edu.util;

import java.util.Arrays;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RequestUtil {

	public static HttpServletRequest getRequest() {
		return ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
	}
	
	public static HttpServletResponse getResponse() {
		return ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getResponse();
	}
	
	public static void addCookie(String key, String value) {
		Cookie cookie = new Cookie(key, value);
		cookie.setMaxAge(60*60*24); //쿠키 유효 기간: 하루로 설정(60초 * 60분 * 24시간)
	    cookie.setPath("/"); //모든 경로에서 접근 가능하도록 설정
	    getResponse().addCookie(cookie);
	}
	
	public static String getCookieValue(String cookieName) {
		HttpServletRequest request = getRequest();
		return Arrays.asList(request.getCookies())
					 .stream()
					 .filter(cookie -> cookie.getName().equals(cookieName))
					 .map(cookie -> cookie.getValue())
					 .findFirst()
					 .orElse(null);
	}
	
	public static void removeCookie(String cookieName) {
		Cookie cookie = new Cookie(cookieName, null); // 삭제할 쿠키에 대한 값을 null로 지정
		cookie.setPath("/"); //모든 경로에서 접근 가능하도록 설정
	    cookie.setMaxAge(0); // 유효시간을 0으로 설정해서 바로 만료시킨다.
	    getResponse().addCookie(cookie); // 응답에 추가해서 없어지도록 함
	}
}

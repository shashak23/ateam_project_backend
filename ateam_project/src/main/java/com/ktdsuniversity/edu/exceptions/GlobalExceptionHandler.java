/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 공통예외 처리를 총 관리합니다.
 */

package com.ktdsuniversity.edu.exceptions;

//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalExceptionHandler {

	private Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);
	
	@ExceptionHandler(PageNotFoundException.class)
	public String viewErrorPage(PageNotFoundException runtimeException, Model model) {
		logger.error(runtimeException.getMessage(), runtimeException);
		model.addAttribute("message", runtimeException.getMessage());
		return "error/404";
	}
	
	@ExceptionHandler(AjaxPageNotFoundException.class)
	@ResponseBody
	public Map<String, Object> viewErrorPage(AjaxPageNotFoundException runtimeException) {
		logger.error(runtimeException.getMessage(), runtimeException);
		Map<String, Object> errorMessage = new HashMap<>();
		errorMessage.put("message", runtimeException.getMessage());
		return errorMessage;
	}
	
	@ExceptionHandler({FileNotExistsException.class
		             , MakeXlsxFileException.class
		             , RuntimeException.class})
	public String viewErrorPage(RuntimeException runtimeException, Model model) {
		logger.error(runtimeException.getMessage(), runtimeException);
		model.addAttribute("message", runtimeException.getMessage());
		return "error/500";
	}
	
	@ExceptionHandler(AlreadyUseException.class)
	public String viewMemberRegistErrorPage(AlreadyUseException exception, Model model) {
		logger.error(exception.getMessage(), exception);
		model.addAttribute("memberVO", exception.getMemberVO());
		return "member/membersignup";
	}
	
	@ExceptionHandler(UserIdentityNotMatchException.class)
	public String viewUserIdentityNotMatchExceptionErrorPage(
			                    UserIdentityNotMatchException exception
			                  , Model model) {
		logger.error(exception.getMessage(), exception);
		model.addAttribute("memberVO", exception.getMemberVO());
		model.addAttribute("message", exception.getMessage());
		return "member/memberlogin";
	}
	
	@ExceptionHandler(MethodArgumentNotValidException.class)
	public String viewMethodArgumentNotValidExceptionErrorPage(
			  MethodArgumentNotValidException runtimeException
			, Model model) {
		logger.error(runtimeException.getMessage(), runtimeException);
		model.addAttribute("message", runtimeException.getMessage());
		return "error/404";
	}
}

/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: MethodArgumentNotValidException를 공통예외 처리합니다.
 */

package com.ktdsuniversity.edu.exceptions;

public class MethodArgumentNotValidException extends RuntimeException {

	private static final long serialVersionUID = -1145423445617022971L;

	public MethodArgumentNotValidException(String message) {
		super(message);
	}
}

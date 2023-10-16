/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: FileNotExistsException를 공통예외 처리합니다.
 */

package com.ktdsuniversity.edu.exceptions;

public class FileNotExistsException extends RuntimeException {

	private static final long serialVersionUID = 3592331898318964334L;

	public FileNotExistsException(String message) {
		super(message);
	}
}

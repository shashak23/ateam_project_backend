/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: MakeXlsxFileException를 공통예외 처리합니다.
 */

package com.ktdsuniversity.edu.exceptions;

public class MakeXlsxFileException extends RuntimeException {

	private static final long serialVersionUID = -2024398098979428921L;

	public MakeXlsxFileException(String message) {
		super(message);
	}
}

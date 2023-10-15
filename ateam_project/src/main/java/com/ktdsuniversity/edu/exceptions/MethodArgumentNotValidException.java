package com.ktdsuniversity.edu.exceptions;

public class MethodArgumentNotValidException extends RuntimeException {

	private static final long serialVersionUID = -1145423445617022971L;

	public MethodArgumentNotValidException(String message) {
		super(message);
	}
}

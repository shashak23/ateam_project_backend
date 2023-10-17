/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: AlreadyUseException를 공통예외 처리합니다.
 */

package com.ktdsuniversity.edu.exceptions;

import com.ktdsuniversity.edu.member.vo.MemberVO;

public class AlreadyUseException extends RuntimeException {

	private static final long serialVersionUID = 6062148073962465674L;

	private MemberVO memberVO;
	
	public AlreadyUseException(MemberVO memberVO, String message) {
		super(message);
		this.memberVO = memberVO;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}
	
	
}

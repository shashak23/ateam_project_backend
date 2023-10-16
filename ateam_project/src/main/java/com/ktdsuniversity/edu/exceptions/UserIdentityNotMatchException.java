/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: UserIdentityNotMatchException를 공통예외 처리합니다.
 */

package com.ktdsuniversity.edu.exceptions;

import com.ktdsuniversity.edu.member.vo.MemberVO;

public class UserIdentityNotMatchException extends RuntimeException {

	private static final long serialVersionUID = -6927515684879098948L;

	private MemberVO memberVO;
	
	public UserIdentityNotMatchException(MemberVO memberVO, String message) {
		super(message);
		this.memberVO = memberVO;
	}
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
}

package com.ktdsuniversity.edu.admin.service;

public interface MailService {
	
	/**
	 * 기업회원이 등록한 이메일로 회원가입승인여부 발송
	 * @param 통지 대상이 되는 기업회원
	 * @return 
	 */
	public void sendMail();

}

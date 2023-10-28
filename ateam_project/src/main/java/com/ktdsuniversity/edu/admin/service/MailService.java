package com.ktdsuniversity.edu.admin.service;

import com.ktdsuniversity.edu.companymember.vo.CompanyListVO;
import com.ktdsuniversity.edu.companymember.vo.CompanyVO;

public interface MailService {
	
	/**
	 * 
	 * @return 모든 기업회원 목록 및 명수
	 */
	public CompanyListVO getAllCompanyMember();
	
	
	/**
	 * 기업회원이 등록한 이메일로 회원가입승인메일 발송
	 * @param companyVO 통지 대상이 되는 기업회원
	 * @return 
	 */
	public void sendApprovalMail(CompanyVO companyVO);
	
	/**
	 * 기업회원이 등록한 이메일로 회원가입거부메일 발송
	 * @param companyVO 통지 대상이 되는 기업회원
	 * @return
	 */
	public void sendRefuseMail(CompanyVO companyVO);
	
	/**
	 * 기업회원가입처리 여부 변경
	 * @param companyEmail 회원가입처리된 기업회원
	 * @return
	 */
	public boolean doCompleteCompanyMemberRegistrationYn(String companyEmail);

}

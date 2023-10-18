package com.ktdsuniversity.edu.member.service;

import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.CompanyVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface MemberService {
	public boolean createNewMember(GeneralMemberVO generalMemberVO);
	public boolean checkAvailableEmail(String email);
	public boolean checkAvailableNickname(String nickname);
	
	public MemberVO getMember(MemberVO memberVO);
	
	/**
	 * 기업회원가입 처리
	 * @param companyVO 사용자가 작성한 사용자 정보
	 * @return 기업회원가입 정상처리 여부 확인
	 */
	public boolean createNewCompanyMemeber(CompanyVO companyVO);
	
	/**
	 * 파라미터로 전달 된 이메일이 사용가능한지 확인
	 * @param email 사용자가 가입 요청한 이메일
	 * @return 사용가능한 이메일인지 여부 (true: 사용가능한 이메일)
	 */
	public boolean checkAvailableCompanyEmail(String email);
}

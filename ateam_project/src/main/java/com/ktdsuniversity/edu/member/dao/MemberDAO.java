package com.ktdsuniversity.edu.member.dao;

import com.ktdsuniversity.edu.companymember.vo.CompanyVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface MemberDAO {
	/**
	 * 회원가입 
	 */
	public int getEmailCount(String email);
	public int getNicknameCount(String nickname);
	public int createNewMember(MemberVO memberVO);
	
	/**
	 * 로그인
	 */
	public String getSalt(String email);
	public MemberVO getMember(MemberVO memberVO);
	/**
	 * 파일 조회
	 */
	public MemberVO getOneFile(String email);
	/**
	 * 파일
	 */
	public int updateOneFile(MemberVO memberVO);
	
	/**
	 * 회원탈퇴
	 */
	public int updateWithdrawMember(MemberVO memberVO);
	
	/**
	 * 기업회원가입
	 */
//	public int createNewCompanyMember(MemberVO memberVO);
	
}

/*
 * 수정자: 장보늬(2023-10-20)
 * */
package com.ktdsuniversity.edu.member.dao;

import java.util.List;

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
	 * 기업회원 비밀번호 수정
	 * @param memberVO 수정 요청한 사용자 정보
	 * @return DB에 update한 데이터의 수
	 */
	public int updateCompanyPassword(MemberVO memberVO);
	
	/**
	 * 기업회원가입
	 */
//	public int createNewCompanyMember(MemberVO memberVO);
	
	public List<MemberVO> searchMember(String memberType);
}

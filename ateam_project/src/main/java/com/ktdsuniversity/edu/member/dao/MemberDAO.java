/**
 * 작성자: 김광원
 * 수정자: 장보늬(2023-10-23)
 * 작성일자: 2023-10-19
 * 내용: 일반회원 비밀번호 수정 및 닉네임 수정
 */
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
	 * 파일생성
	 */
	public int createNewFile(MemberVO memberVO);
	
	/**
	 * 로그인
	 */
	public String getSalt(String email);
	public MemberVO getMember(MemberVO memberVO);
	
	
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
	/**
	 * 회원 조회
	 */
	public MemberVO selectMemberinfo(String email);
	
	/**
	 * 회원 닉네임수정
	 */
	public int updateMemberNickname(MemberVO memberVO);
	/**
	 * 회원 비밀번호 수정 
	 */
	public int updateMemberPW(MemberVO memberVO);
	/**
	 * 파일 조회
	 */
	public MemberVO getOneFile(String email);
	/**
	 * 파일 수정
	 */
	public int updateOneFile(MemberVO memberVO);
	/**
	 * 파일 삭제
	 */
	public int deleteProfile(String email);
	
}

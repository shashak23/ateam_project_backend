package com.ktdsuniversity.edu.member.dao;

import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface MemberDAO {
	public int getEmailCount(String email);
	public int getNicknameCount(String nickname);
	public int createNewMember(MemberVO memberVO);
	
	//로그인
	public String getSalt(String email);
	public MemberVO getMember(MemberVO memberVO);
	
	/**
	 * member 조회
	 */
	public MemberVO getSelectMember(String email);
	/**
	 * 마이 프로필 수정
	 */
	public int updateMyprofilePic(MemberVO memberVO);
}

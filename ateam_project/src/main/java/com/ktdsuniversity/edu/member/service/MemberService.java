package com.ktdsuniversity.edu.member.service;

import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface MemberService {
	public boolean createNewMember(GeneralMemberVO generalMemberVO);
	public boolean checkAvailableEmail(String email);
	public boolean checkAvailableNickname(String nickname);
	
	public MemberVO getMember(MemberVO memberVO);
	
	/**
	 * member 조회
	 */
	public MemberVO getSelectMember(String email);
	/**
	 * 일반회원 프로필사진 수정
	 */
	public boolean updateMyprofilePic(MemberVO memberVO, MultipartFile file);
}

package com.ktdsuniversity.edu.member.service;

import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface MemberService {
	/**
	 * 회원가입
	 */
	public boolean createNewMember(GeneralMemberVO generalMemberVO);
	public boolean checkAvailableEmail(String email);
	public boolean checkAvailableNickname(String nickname);
	/**
	 * 로그인
	 */
	public MemberVO getMember(MemberVO memberVO);
	/**
	 * 프로필사진 조회 
	 */
	public MemberVO getOneFile(String email);
	/**
	 * 파일 수정
	 */
	public boolean updateOneFile(MemberVO memberVO, MultipartFile file);
}

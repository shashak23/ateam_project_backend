package com.ktdsuniversity.edu.generalmember.service;

import java.util.List;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface GeneralMemberService {
	/**
	 * 경력 조회
	 */
	public List<CareerVO> getAllCareerListByMemberEmail(String generalMemberEmail);
	
	/**
	 * 일반회원 리스트
	 */
	public List<GeneralMemberVO> getAllGeeralMemberList(String generalMemberEmail);
	/**
	 * 회원 닉네임 조회
	 */
	public MemberVO getSelectNickname(String generalMemberEmail);
	
	/**
	 * 일반회원 조회
	 */
	public GeneralMemberVO getSelectGeneralMember(String generalMemberEmail);
	/**
	 * 주소 수정
	 */
	public boolean updateOneAddress(GeneralMemberVO generalMemberVO);
	/**
	 * 주소 삭제
	 */
	public boolean deleteOneAddress(String generalMemberEmail);
	
	/**
	 * SNS 수정
	 */
	public boolean updateSns(GeneralMemberVO generalMemberVO);
	/**
	 * GITHUB_URL 삭제
	 */
	public boolean deleteGithub(String generalMemberEmail);
	/**
	 * EMAIL_URL 삭제
	 */
	public boolean deleteEmail(String generalMemberEmail);
	/**
	 * BLOG_URL 삭제
	 */
	public boolean deleteBlog(String generalMemberEmail);
	
	/**
	 * 자기소개 수정
	 */
	public boolean updateselfIntro(GeneralMemberVO generalMemberVO);
	/**
	 * 자기소개 삭제
	 */
	public boolean deleteSelfIntro(String generalMemberEmail);
	
}

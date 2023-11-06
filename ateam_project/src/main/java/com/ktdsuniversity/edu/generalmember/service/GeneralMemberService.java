/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-24
 * 수정일자 : 2023-10-25 수정자(김광원)
 * 내용 : 일반회원을 위한 Service입니다.
 */
package com.ktdsuniversity.edu.generalmember.service;

import java.util.List;
import java.util.Map;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.education.vo.EducationVO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberListVO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.techstack.vo.TechstackVO;

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
	 * 학력 리스트
	 */
	public List<EducationVO> getAllEducationList(String generalMemberEmail); 
	/**
	 * 회원 닉네임 조회
	 */
	public MemberVO getSelectNickname(String generalMemberEmail);
	/**
	 * 회원 기술스택 조회
	 */
	public List<CommonCodeVO> getSelectCommonCode(String generalMemberEmail);
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
	
	/**
	 * 회원의 커뮤니티 활동 내역 조회
	 * @param generalMemberEmail 커뮤니티 활동을 조회하고자 하는 회원의 이메일
	 * @return
	 */
	public List<Map<String, Object>> getSelectMemberActivityLog(String generalMemberEmail);
	
	/**
	 * 스코어 상위 10위까지의 회원 목록 조회
	 * @return
	 */
	public GeneralMemberListVO getSelectTopTenScoreMemberList();
	
}

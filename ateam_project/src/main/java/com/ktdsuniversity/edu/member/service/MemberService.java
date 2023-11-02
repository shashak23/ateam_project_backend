/**
 * 작성자: 김광원
 * 수정자: 김광원(2023-10-20)
 * 수정자: 장보늬(2023-10-23)
 * 수정자: 김태현(2023-10-27)
 * 수정자: 김태현(2023-10-31)
 * 작성일자: 2023-10-19
 * 내용: 일반회원 비밀번호 수정 및 닉네임 수정
 */
package com.ktdsuniversity.edu.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;
import com.ktdsuniversity.edu.companymember.vo.CompanyVO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberListVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.member.vo.SocialVO;

public interface MemberService {
	
	
	/**
	 * 일반회원가입
	 */
	public boolean createNewMember(GeneralMemberVO generalMemberVO);
	public boolean checkAvailableEmail(String email);
	public boolean checkAvailableNickname(String nickname);
	/**
	 * 파일생성
	 */
//	public boolean createNewFile(MemberVO memberVO,MultipartFile file );
	/**
	 * 로그인
	 */
	public MemberVO getGeneralMember(MemberVO memberVO);
	
	/**
	 * 로그인
	 */
	public MemberVO getCompanyMember(MemberVO memberVO);
	/**
	 * 프로필사진 조회 
	 */
	public MemberVO getOneFile(String email);
	/**
	 * 프로필사진 수정
	 */
	public boolean updateOneFile(MemberVO memberVO, MultipartFile file);
	/**
	 * 프로필사진 삭제
	 */
	public boolean deleteProfile(String email);
	/**
	 * 회원 탈퇴
	 * @param memberVO 탈퇴할 사용자의 사용자 정보
	 * @return 탈퇴 정상처리 여부 확인
	 */
	public boolean withdrawMember(MemberVO memberVO);
	
	
	/**
	 * 기업회원가입
	 * @param companyVO 사용자가 작성한 사용자 정보
	 * @param file 사용자가 업로드한 파일
	 * @return 기업회원가입 정상처리 여부 확인
	 */
	public boolean createNewCompanyMember(CompanyVO companyVO
										, MultipartFile file);
	
	/**
	 * 파라미터로 전달 된 이메일이 사용가능한지 확인
	 * @param email 사용자가 가입 요청한 이메일
	 * @return 사용가능한 이메일인지 여부 (true: 사용가능한 이메일)
	 */
	public boolean checkAvailableCompanyEmail(String companyEmail);
	
	/**
	 * 회원 조회
	 */
	public MemberVO selectMemberinfo(String email);
	
	/**
	 * 회원 닉네임 수정
	 */
	public boolean updateMemberNickname(MemberVO memberVO);

	/**
	 * 회원 비밀번호 수정
	 */
	public boolean updateMemberPW(MemberVO memberVO);
	
	// 회원유형구분해서 회원찾기
	public List<MemberVO> searchMember(String memberType);
	
	/**
	 * 일반 타입 회원 목록 조회
	 * @return 일반 타입 회원 리스트
	 */
	public List<MemberVO> searchGemeralTypeMemberList();
	
	/**
	 * 기업 타입 회원 목록 조회
	 * @return 기업 타입 회원 리스트
	 */
	public List<MemberVO> searchCompanyTypeMemberList();
	
	// 통합검색
	public MemberListVO searchAllMemberByKeyword(AbstractSearchVO abstractSearchVO);
	/**
	 * kakao토큰 받아오기
	 */
	public String getAccessToken (String authorizeCode);
	/**
	 * kakao 유저정보 
	 */
	public SocialVO getUserInfo(String accessToken);
	/**
	 * 카카오 로그아웃 
	 */
	public void kakaoLogout(String accessToken);
}
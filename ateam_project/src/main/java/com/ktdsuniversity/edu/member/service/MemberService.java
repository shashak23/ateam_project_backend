package com.ktdsuniversity.edu.member.service;

import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.companymember.vo.CompanyVO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface MemberService {
	
	/**
	 * 일반회원가입
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
}

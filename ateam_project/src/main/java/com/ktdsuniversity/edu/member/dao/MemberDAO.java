/**
 * 작성자: 김광원
 * 수정자: 장보늬(2023-10-23)
 * 수정자: 김태현(2023-10-27)
 * 수정자: 김태현(2023-10-31)
 * 작성일자: 2023-10-19
 * 내용: 일반회원 비밀번호 수정 및 닉네임 수정
 */
package com.ktdsuniversity.edu.member.dao;

import java.util.HashMap;
import java.util.List;

import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.member.vo.SocialVO;

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
	
	/**
	 * 일반 회원 조회
	 * @param memberVO 일반 회원의 이메일을 받는다. 
	 * @return 일반 회원의 정보를 반환한다.
	 */
	public MemberVO getGeneralMember(MemberVO memberVO);
	
	/**
	 * 기업 회원 조회
	 * @param memberVO 기업 회원의 이메일을 받는다.
	 * @return 기업 회원의 정보를 반환한다.
	 */
	public MemberVO getCompanyMember(MemberVO memberVO);
	
	
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
	
	// 회원유형구분해서 회원찾기
	public List<MemberVO> searchMember(String memberType);
	
	/**
	 * 관리를 위한 일반 회원 목록 조회
	 * @return 일반 회원들의 리스트
	 */
	public List<MemberVO> searchGemeralTypeMemberList();
	
	/**
	 * 관리를 위한 기업 목록 조회
	 * @return 일반 기업들의 리스트
	 */
	public List<MemberVO> searchCompanyTypeMemberList();
	
	// 통합검색
	public List<MemberVO> searchAllMemberByKeyword(AbstractSearchVO abstractSearchVO);
	
	/**
	 * 카카오 로그인
	 */
	public int kakaoinsert(HashMap<String, Object> userInfo);
	/**
	 * 네이버 로그인
	 */
	public int naverinsert(HashMap<String, Object> userInfo);
	/**
	 * 구글 로그인
	 */
	public int googleinsert(HashMap<String, Object> userInfo);
	
	/**
	 * 소셜 아이디조회
	 */
	public SocialVO findSocial(HashMap<String, Object> userInfo);
	
	/**
	 * 엑셀 추출용 일반 회원 조회
	 * @return 일반 회원들의 웬만한 정보
	 */
	public List<MemberVO> exportGeneralMember();
	
	/**
	 * 엑셀 추출용 기업 회원 조회
	 * @return 기업 회원들의 웬만한 정보
	 */
	public List<MemberVO> exportCompanyMember();
}

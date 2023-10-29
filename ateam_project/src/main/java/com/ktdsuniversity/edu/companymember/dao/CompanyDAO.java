/**
 * 작성장: 김시하
 * 작성일자: 2023-10-23
 * 내용: 기업 채용을 위한 DAO
 */
package com.ktdsuniversity.edu.companymember.dao;

import java.util.List;

import com.ktdsuniversity.edu.companymember.vo.CompanyVO;

public interface CompanyDAO {
	
	/**
	 * 파라미터로 전달된 이메일이 DB에 몇 건 존재하는지 확인한다.
	 * @param email 사용자가 가입 요청한 이메일
	 * @return 동일한 이메일로 등록된 회원의 수
	 */
	public int getCompanyEmailCount(String companyEmail);
	
	/**
	 * 기업회원가입 쿼리를 실행한다.
	 * @param companyVO 사용자가 입력한 회원 정보
	 * @return DB에 Insert한 회원의 수
	 */
	public int createNewCompanyMember(CompanyVO companyVO);
	
	/**
	 * 모든 기업회원 명수 조회
	 * @return 모든 기업회원 명수
	 */
	public int companyMemberAllCount();
	
	/**
	 * 모든 기업회원 목록 조회
	 * @return 모든 기업회원 목록 
	 */
	public List<CompanyVO> CompanyMemberAllList();

	/**
	 * 기업회원가입 처리여부 변경
	 * @param companyVO
	 * @return
	 */
	public int CompleteCompanyMemberRegistrationYn(String companyEmail);

}
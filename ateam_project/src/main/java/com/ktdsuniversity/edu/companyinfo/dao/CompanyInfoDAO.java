/**
 * 수정자: 김태현(2023-11-02)
 */

package com.ktdsuniversity.edu.companyinfo.dao;

import com.ktdsuniversity.edu.companyinfo.vo.CompanyInfoVO;
import com.ktdsuniversity.edu.companymember.vo.CompanyVO;

public interface CompanyInfoDAO {
	
	/**
	 * 담당자 이름 수정
	 * @param companyVO 수정 요청한 사용자 정보
	 * @return DB에 update한 데이터의 수
	 */
	public int updateCompanyContactName(CompanyVO companyVO);
	
	/**
	 * 담당자 연락처 수정
	 * @param companyVO 수정 요청한 사용자 정보
	 * @return DB에 update한 데이터의 수
	 */
	public int updateCompanyContactNumber(CompanyVO companyVO);
	
	/**
	 * 기업회원 비밀번호 수정
	 * @param companyVO 수정 요청한 사용자 정보
	 * @return DB에 update한 데이터의 수
	 */
	public int updateCompanyPassword(CompanyVO companyVO);
	
	/**
	 * 이메일로 해당하는 기업의 정보 조회
	 * @param email 조회하려는 기업의 이메일
	 * @return 기업의 정보
	 */
	public CompanyInfoVO getOneCompanyInfo(String email);
	
	/**
	 * 이메일로 해당 기업의 사업자 등록증 조회
	 * @param email 조회하려는 기업의 이메일
	 * @return 기업의 사업자 등록증
	 */
	public CompanyInfoVO getOneLicense(String email);
}

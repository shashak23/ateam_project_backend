package com.ktdsuniversity.edu.companyinfo.dao;

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
}

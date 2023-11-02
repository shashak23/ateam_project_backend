/**
 * 수정자: 김태현(2023-11-02)
 */

package com.ktdsuniversity.edu.companyinfo.service;

import com.ktdsuniversity.edu.companyinfo.vo.CompanyInfoVO;
import com.ktdsuniversity.edu.companymember.vo.CompanyVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface CompanyInfoService {
	
	public boolean updateCompanyContactNumber(CompanyVO companyVO);
	
	public boolean updateCompanyPassword(MemberVO memberVO);
	
	public CompanyInfoVO getOneCompanyInfo(String email); 
	
	public CompanyInfoVO getOneLicense(String email);
}

package com.ktdsuniversity.edu.companyinfo.service;

import com.ktdsuniversity.edu.companymember.vo.CompanyVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface CompanyInfoService {
	
	public boolean updateCompanyContactNumber(CompanyVO companyVO);
	
	public boolean updateCompanyPassword(MemberVO memberVO);
}

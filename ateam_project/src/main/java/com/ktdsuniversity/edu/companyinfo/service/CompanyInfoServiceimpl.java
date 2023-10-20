package com.ktdsuniversity.edu.companyinfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.companyinfo.dao.CompanyInfoDAO;
import com.ktdsuniversity.edu.companymember.vo.CompanyVO;
import com.ktdsuniversity.edu.member.dao.MemberDAO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Service
public class CompanyInfoServiceimpl implements CompanyInfoService {
	
	@Autowired
	private CompanyInfoDAO companyInfoDAO;
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public boolean updateCompanyContactName(CompanyVO companyVO) {
		int updateCompanyContactNameCount = companyInfoDAO.updateCompanyContactName(companyVO);
		return updateCompanyContactNameCount > 0;
	}

	@Override
	public boolean updateCompanyContactNumber(CompanyVO companyVO) {
		int updateCompanyContactNumberCount = companyInfoDAO.updateCompanyContactNumber(companyVO);
		return updateCompanyContactNumberCount > 0;
	}

	@Override
	public boolean updateCompanyPassword(MemberVO memberVO) {
		int updateCompanyPasswordCount = memberDAO.updateCompanyPassword(memberVO);
		return updateCompanyPasswordCount > 0;
	}
	

}

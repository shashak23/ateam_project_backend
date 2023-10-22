package com.ktdsuniversity.edu.companymypost.service;

import java.util.List;

import com.ktdsuniversity.edu.companymypost.vo.CompanyMyPostVO;
import com.ktdsuniversity.edu.companymypost.vo.SearchCompanyMyPostVO;

public interface CompanyMyPostService {

	public int getBoardAllCount();
	
	public List<CompanyMyPostVO> getAllCompanyPost();
	
	public boolean updateOneCompanyPost(CompanyMyPostVO companyMyPostVO);
	
	public boolean deleteOneCompanyPost(String companyEmail);
	
	public CompanyMyPostVO getOneCompanyPost(String companyEmail);
	
	public List<CompanyMyPostVO> searchAllCompanyMyPost(SearchCompanyMyPostVO searchCompanyMyPostVO);
}

package com.ktdsuniversity.edu.companynews.service;

import com.ktdsuniversity.edu.companynews.vo.CompanyNewsListVO;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsVO;

public interface CompanyNewsService {
	
	// 기업소식 게시글 목록과 게시글의 건수를 모두 조회한다.
	public CompanyNewsListVO getAllCompanyNews();

	public boolean createNewCompanyNews(CompanyNewsVO companyNewsVO);
	
	public CompanyNewsVO getOneNews(String companyNewsPostId, boolean isIncrease);
	
	public boolean updateOneCompanyNews(CompanyNewsVO companyNewsVO);
	
	public boolean deleteOneCompanyNews(CompanyNewsVO companyNewsVO);
}

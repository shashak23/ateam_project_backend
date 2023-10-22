package com.ktdsuniversity.edu.companymypost.service;

<<<<<<< HEAD:ateam_project/src/main/java/com/ktdsuniversity/edu/companymypost/service/companyMyPostService.java
import java.util.List;
=======
public interface CompanyMyPostService {
>>>>>>> main:ateam_project/src/main/java/com/ktdsuniversity/edu/companymypost/service/CompanyMyPostService.java

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

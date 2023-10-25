/**
 * 작성자: 김시하
 * 수정자: 김시하(2023-10-25)
 * 작성일자: 2023-10-23
 * 내용: 기업 채용을 위한 Service
 */
package com.ktdsuniversity.edu.companyrecruit.service;

import com.ktdsuniversity.edu.companyrecruit.vo.CompanyRecruitListVO;
import com.ktdsuniversity.edu.companyrecruit.vo.CompanyRecruitVO;

import jakarta.validation.Valid;

public interface CompanyRecruitService {

	public CompanyRecruitListVO getAllBoard();

	public boolean createNewBoard(CompanyRecruitVO companyRecruitVO);

	public CompanyRecruitVO getOneRecruitBoard(String companyRecruitPostId);

	public boolean updateOneRecruitBoard(CompanyRecruitVO companyRecruitVO);

	public boolean deleteOneRecruitBoard(String companyRecruitPostId);

	
}

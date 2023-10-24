/**
 * 작성자: 김시하
 * 작성일자: 2023-10-23
 * 내용: 기업 채용을 위한 ServiceImpl
 */
package com.ktdsuniversity.edu.companyrecruit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.companyrecruit.dao.CompanyRecruitDAO;
import com.ktdsuniversity.edu.companyrecruit.vo.CompanyRecruitListVO;
import com.ktdsuniversity.edu.companyrecruit.vo.CompanyRecruitVO;

@Service
public class CompanyRecruitServiceImpl implements CompanyRecruitService{

	@Autowired
	private CompanyRecruitDAO companyRecruitDAO;
	
	@Override
	public CompanyRecruitListVO getAllBoard() {
		CompanyRecruitListVO companyRecruitListVO = new CompanyRecruitListVO();
		companyRecruitListVO.setBoardCnt(companyRecruitDAO.getBoardAllCount());
		companyRecruitListVO.setCompanyRecruitVO(companyRecruitDAO.getAllBoard());
		
		return null;
	}

	@Override
	public boolean createNewBoard(CompanyRecruitVO companyRecruitVO) {
		return false;
	}

}

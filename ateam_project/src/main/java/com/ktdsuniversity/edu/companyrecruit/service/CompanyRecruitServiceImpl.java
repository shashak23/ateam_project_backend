/**
 * 작성자: 김시하
 * 작성일자: 2023-10-23
 * 내용: 기업 채용을 위한 ServiceImpl
 */
package com.ktdsuniversity.edu.companyrecruit.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.companyrecruit.dao.CompanyRecruitDAO;
import com.ktdsuniversity.edu.companyrecruit.vo.CompanyRecruitListVO;
import com.ktdsuniversity.edu.companyrecruit.vo.CompanyRecruitVO;
import com.ktdsuniversity.edu.generalpost.web.FreePostController;

@Service
public class CompanyRecruitServiceImpl implements CompanyRecruitService{

	@Autowired
	private CompanyRecruitDAO companyRecruitDAO;
	
	private Logger log = LoggerFactory.getLogger(FreePostController.class);

	
	@Transactional
	@Override
	public CompanyRecruitListVO getAllBoard() {
		CompanyRecruitListVO companyRecruitListVO = new CompanyRecruitListVO();
		companyRecruitListVO.setBoardCnt(companyRecruitDAO.getBoardCount());
		companyRecruitListVO.setCompanyRecruitList(companyRecruitDAO.getAllBoard());
		
		return companyRecruitListVO;
	}

	@Transactional
	@Override
	public boolean createNewBoard(CompanyRecruitVO companyRecruitVO) {
		int boardCount = companyRecruitDAO.createNewBoard(companyRecruitVO);
		return boardCount > 0;
	}
	@Transactional
	@Override
	public CompanyRecruitVO getOneRecruitBoard(String companyRecruitPostId) {
		CompanyRecruitVO result = null;
		result = companyRecruitDAO.getOneRecruitBoard(companyRecruitPostId);
		return result;
	}
	@Transactional
	@Override
	public boolean updateOneRecruitBoard(CompanyRecruitVO companyRecruitVO) {
		log.debug("--2--SERVICE 도착------------------------------");
		int updateCount = companyRecruitDAO.updateOneRecruitBoard(companyRecruitVO);
		return updateCount > 0;
	}

}

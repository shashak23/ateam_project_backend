package com.ktdsuniversity.edu.companynews.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.companynews.dao.CompanyNewsDAO;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsListVO;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsVO;

@Service
public class CompanyNewsServiceImpl implements CompanyNewsService {

	@Autowired
	private CompanyNewsDAO companyNewsDAO;
	
	@Override
	public CompanyNewsListVO getAllCompanyNews() {
		CompanyNewsListVO companyNewsListVO = new CompanyNewsListVO();
		companyNewsListVO.setCompanyNewsCnt(companyNewsDAO.getCompanyNewsAllCount());
		companyNewsListVO.setCompanyNewsList(companyNewsDAO.getAllCompanyNews());
		return companyNewsListVO;
	}

	@Override
	public boolean createNewCompanyNews(CompanyNewsVO companyNewsVO) {
		int createCount = companyNewsDAO.createNewCompanyNews(companyNewsVO);
		return createCount > 0;	
	}

	@Override
	public CompanyNewsVO getOneNews(String companyNewsPostId, boolean isIncrease) {
		if (isIncrease) {
			int updateCount = companyNewsDAO.increaseViewCount(companyNewsPostId);
			if(updateCount == 0) {
				throw new IllegalArgumentException("잘못된 접근입니다.");
			}	
		}
		// 예외가 발생하지 않았다면, 게시글 정보를 조회한다.
		CompanyNewsVO companyNewsVO = companyNewsDAO.getOneCompanyNews(companyNewsPostId);
		if (companyNewsVO == null) {
			// 파라미터로 전달받은 companyPostId 값이 DB에 존재하지 않을 경우
			// 잘못된 접근입니다. 라고 사용자에게 예외 메시지를 보내준다.
			throw new IllegalArgumentException("잘못된 접근입니다.");
		}
		return companyNewsVO;
	}

	@Override
	public boolean updateOneCompanyNews(CompanyNewsVO companyNewsVO) {
		int updateCount = companyNewsDAO.updateOneCompanyNews(companyNewsVO);
		return updateCount > 0;
	}

	@Override
	public boolean deleteOneCompanyNews(CompanyNewsVO companyNewsVO) {
		int deleteCount = companyNewsDAO.deleteOneCompanyNews(companyNewsVO);
		return deleteCount > 0;
	}
	
	

	
	
	

}

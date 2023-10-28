/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 기업소식 게시판의 CRUD 실행결과를 저장합니다.
 */

package com.ktdsuniversity.edu.companynews.service;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.beans.FileHandler;
import com.ktdsuniversity.edu.beans.FileHandler.StoredFile;
import com.ktdsuniversity.edu.common.vo.AbstractCompanyPostVO;
import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;
import com.ktdsuniversity.edu.companynews.dao.CompanyNewsDAO;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsListVO;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsVO;
import com.ktdsuniversity.edu.companynews.vo.SearchCompanyNewsVO;
import com.ktdsuniversity.edu.exceptions.PageNotFoundException;

@Service
public class CompanyNewsServiceImpl implements CompanyNewsService {

	private Logger logger = LoggerFactory.getLogger(CompanyNewsServiceImpl.class);
	
	@Autowired
	private FileHandler fileHandler;
	
	@Autowired
	private CompanyNewsDAO companyNewsDAO;
	
	@Override
	public CompanyNewsListVO getAllCompanyNews(SearchCompanyNewsVO searchCompanyNewsVO) {
		CompanyNewsListVO companyNewsListVO = new CompanyNewsListVO();
		companyNewsListVO.setCompanyNewsCnt(companyNewsDAO.getCompanyNewsAllCount(searchCompanyNewsVO));
		if(searchCompanyNewsVO == null) {
			companyNewsListVO.setCompanyNewsList(companyNewsDAO.getAllCompanyNews());
		}
		else {
			companyNewsListVO.setCompanyNewsList(companyNewsDAO.searchAllCompanyNews(searchCompanyNewsVO));
		}
		return companyNewsListVO;
	}

	@Transactional
	@Override
	public boolean createNewCompanyNews(CompanyNewsVO companyNewsVO, MultipartFile file) {
		StoredFile storedFile = fileHandler.storeFile(file);
		
		logger.debug("FileName: " + storedFile.getFileName());
		logger.debug("RealFileName: " + storedFile.getRealFileName());
		logger.debug("FileSize: " + storedFile.getFileSize());
		logger.debug("RealFilePath: " + storedFile.getRealFilePath());

		companyNewsVO.setFileName(storedFile.getRealFileName());
		companyNewsVO.setOriginFileName(storedFile.getFileName());
		
		int createCount = companyNewsDAO.createNewCompanyNews(companyNewsVO);
		return createCount > 0;	
	}

	@Override
	public CompanyNewsVO getOneCompanyNews(String companyNewsPostId, boolean isIncrease) {
		if (isIncrease) {
			int updateCount = companyNewsDAO.increaseViewCount(companyNewsPostId);
			if(updateCount == 0) {
				throw new PageNotFoundException("잘못된 접근입니다.");
			}	
		}
		// 예외가 발생하지 않았다면, 게시글 정보를 조회한다.
		CompanyNewsVO companyNewsVO = companyNewsDAO.getOneCompanyNews(companyNewsPostId);
		if (companyNewsVO == null) {
			// 파라미터로 전달받은 companyPostId 값이 DB에 존재하지 않을 경우
			// 잘못된 접근입니다. 라고 사용자에게 예외 메시지를 보내준다.
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		return companyNewsVO;
	}

	@Transactional
	@Override
	public boolean updateOneCompanyNews(CompanyNewsVO companyNewsVO, MultipartFile file) {
		
		// 파일을 업로드 했는지 확인.
		if (file != null && !file.isEmpty()) {
			// 변경되기 전의 게시글 정보 가져오기
			CompanyNewsVO originCompanyNewsVO = 
					companyNewsDAO.getOneCompanyNews(companyNewsVO.getCompanyNewsPostId());
			if (originCompanyNewsVO != null && originCompanyNewsVO.getFileName() != null) {
				// 변경되기 전의 게시글이 파일이 업로드된 게시글일 경우
				File originFile = 
						fileHandler.getStoredFile(originCompanyNewsVO.getFileName());
				// 파일이 있는지 확인하고 삭제한다.
				if (originFile.exists() && originFile.isFile()) {
					originFile.delete();
				}
			}
			StoredFile storedFile = fileHandler.storeFile(file);
			companyNewsVO.setFileName(storedFile.getRealFileName());
			companyNewsVO.setOriginFileName(storedFile.getFileName());
		}
		
		int updateCount = companyNewsDAO.updateOneCompanyNews(companyNewsVO);
		return updateCount > 0;
	}

	@Transactional
	@Override
	public boolean deleteOneCompanyNews(String companyNewsPostId) {
		int deleteCount = companyNewsDAO.deleteOneCompanyNews(companyNewsPostId);
		return deleteCount > 0;
	}
	
	// 기업회원 내 게시글 조회
	@Override
	public CompanyNewsListVO getCompanyMyPost(AbstractCompanyPostVO abstractCompanyPostVO) {
		CompanyNewsListVO companyNewsListVO = new CompanyNewsListVO();
		companyNewsListVO.setCompanyNewsList(companyNewsDAO.getCompanyMyPost(abstractCompanyPostVO));
		return companyNewsListVO;
	}
	
	// 통합검색
	@Override
	public CompanyNewsListVO searchAllCompanyNewsByKeyword(AbstractSearchVO abstractSearchVO) {
		
		if (abstractSearchVO == null || abstractSearchVO.getSearchKeyword() == null || abstractSearchVO.getSearchKeyword().length() == 0) {
			return new CompanyNewsListVO();
		}
		CompanyNewsListVO companyNewsListVO = new CompanyNewsListVO();
		companyNewsListVO.setCompanyNewsList(companyNewsDAO.searchAllCompanyNewsByKeyword(abstractSearchVO));
		return companyNewsListVO;
	}
}

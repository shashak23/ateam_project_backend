///**
// * 작성자: 남현욱
// * 작성일자: 2023-10-23
// * 내용: 기업회원 내 게시글 serviceImpl입니다
// */
//
//
//package com.ktdsuniversity.edu.companymypost.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
//import com.ktdsuniversity.edu.companymypost.dao.CompanyMyPostDAO;
//import com.ktdsuniversity.edu.companymypost.vo.CompanyMyPostVO;
//import com.ktdsuniversity.edu.companymypost.vo.SearchCompanyMyPostVO;
//import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
//
//@Service
//public class CompanyMyPostServiceImpl implements CompanyMyPostService {
//
//	@Autowired
//	private CompanyMyPostDAO companyMyPostDAO;
//
//	@Override
//	public int getBoardAllCount() {
//		
//		return 0;
//	}
//
//	@Override
//	public boolean createNewAlgorithmQuestion(AlgorithmQuestionVO algorithmQuestionVO) {
//		
//		algorithmQuestionVO.setMainAlgorithmCategoryId(algorithmQuestionVO.getAlgorithmCategoryIdList().get(0));
//		int createCount = algorithmQuestionDAO.createNewAlgorithmQuestion(algorithmQuestionVO);
//	
//		if (createCount > 0) {
//			int createCategoryCount = algorithmQuestionDAO.createNewAlgorithmQuestionCategory(algorithmQuestionVO);
//			logger.debug("{}: Insert Category Count: {}", algorithmQuestionVO.getCompanyAlgorithmQuestionId(), createCategoryCount);
//		}
//		
//		return createCount > 0;
//	}
//	
//	@Override
//	public AlgorithmQuestionVO getAllCompanyPost(String companyEmail,boolean isIncrease) {
//		if(isIncrease) {
//			int updateCount = algorithmQuestionDAO.increaseViewCount(companyAlgorithmQuestionId);
//			if(updateCount == 0) {
//				throw new PageNotFoundException("잘못된 접근입니다.");
//			}
//		}
//		AlgorithmQuestionVO algorithmQuestionVO = algorithmQuestionDAO.getOneAlgorithmQuestion(companyAlgorithmQuestionId);
//		if(algorithmQuestionVO == null) {
//			throw new PageNotFoundException("잘못된 접근입니다.");
//		}
//		return algorithmQuestionVO;
//	}
//
//	@Override
//	public CompanyMyPostVO getOneCompanyPost(String companyEmail,boolean isIncrease) {
//		if(isIncrease) {
//			int updateCount = algorithmQuestionDAO.increaseViewCount(companyAlgorithmQuestionId);
//			if(updateCount == 0) {
//				throw new PageNotFoundException("잘못된 접근입니다.");
//			}
//		}
//		AlgorithmQuestionVO algorithmQuestionVO = algorithmQuestionDAO.getOneAlgorithmQuestion(companyAlgorithmQuestionId);
//		if(algorithmQuestionVO == null) {
//			throw new PageNotFoundException("잘못된 접근입니다.");
//		}
//		return algorithmQuestionVO;
//	}
//
//	
//	
//

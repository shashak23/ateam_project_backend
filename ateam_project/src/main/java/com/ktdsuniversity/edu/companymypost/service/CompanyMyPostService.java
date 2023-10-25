///**
// * 작성자: 남현욱
// * 작성일자: 2023-10-23
// * 내용: 기업회원 내 게시글 service입니다
// */
//
//package com.ktdsuniversity.edu.companymypost.service;
//
//import java.util.List;
//
//import com.ktdsuniversity.edu.companymypost.vo.CompanyMyPostVO;
//import com.ktdsuniversity.edu.companymypost.vo.SearchCompanyMyPostVO;
//
//public interface CompanyMyPostService {
//
//	//게시판 당 갯수
//	public int getCompanyNewsAllCount();
//	
//	public int getAlgorithmExplanationAllCount();
//	
//	public int getAlgorithmQuestionAllCount();
//	
//	public int getCompanyRecruitAllCount();
//	
//	//게시판 목록 조회
//	public List<CompanyMyPostVO> getAllCompanyPost();
//	
//	public List<AlgorithmQuestion>
//	
//	//게시글 삭제
//	public boolean deleteOneCompanyPost(String companyEmail);
//	
//	//게시글 단건 조회
//	public CompanyMyPostVO getOneCompanyPost(String companyEmail);
//	
//	//검색
//	public List<CompanyMyPostVO> searchAllCompanyMyPost(SearchCompanyMyPostVO searchCompanyMyPostVO);
//}

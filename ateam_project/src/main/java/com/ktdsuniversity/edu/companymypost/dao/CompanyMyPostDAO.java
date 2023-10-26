///**
// * 작성자: 남현욱
// * 작성일자: 2023-10-23
// * 내용: 기업회원 내 게시글 DAO입니다
// */
//
//
//package com.ktdsuniversity.edu.companymypost.dao;
//
//import java.util.List;
///**
// * 수정은 아예 상세 페이지에서 수행, 삭제만 바로 수행
// */
//
//import com.ktdsuniversity.edu.companymypost.vo.CompanyMyPostVO;
//import com.ktdsuniversity.edu.companymypost.vo.SearchCompanyMyPostVO;
//
//public interface CompanyMyPostDAO {
//	//파라미터에 각 게시판 PK로 할지 CompanyEmail
//	//모든 게시글 수 조회
//	public int getBoardAllCount();
//	//게시글 전체 조회
//	public List<CompanyMyPostVO> getAllCompanyPost();
//	//게시글 단건 조회
//	public CompanyMyPostVO getOneCompanyPost(String companyEmail);
//	//게시글 검색
//	public List<CompanyMyPostVO> searchAllCompanyMyPost(SearchCompanyMyPostVO searchCompanyMyPostVO);
//	
//	//게시글 삭제
//	public int deleteOneCompanyPost(String companyEmail);
//}

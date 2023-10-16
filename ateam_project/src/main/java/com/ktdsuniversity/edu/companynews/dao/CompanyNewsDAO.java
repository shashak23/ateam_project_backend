/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 기업소식 게시판의 CRUD 쿼리를 수행합니다.
 */

package com.ktdsuniversity.edu.companynews.dao;

import java.util.List;

import com.ktdsuniversity.edu.companynews.vo.CompanyNewsVO;

public interface CompanyNewsDAO {
	
	// DB에 저장된 모든 기업소식 게시글의 수를 조회
	public int getCompanyNewsAllCount();
	
	// DB에 저장된 모든 기업소식 게시글의 목록을 조회
	public List<CompanyNewsVO> getAllCompanyNews();
	
	// DB에 새로운 기업소식 게시글을 등록한다.
	public int createNewCompanyNews(CompanyNewsVO companyNewsVO);
	
	// 파라미터로 전달받은 기업소식 게시글 ID의 조회수를 1 증가 시킨다.
	public int increaseViewCount(String companyNewsPostId);
	
	// 파라미터로 전달받은 기업소식 게시글 ID의 게시글 정보를 조회한다.
	public CompanyNewsVO getOneCompanyNews(String companyNewsPostId);
	
	public int updateOneCompanyNews(CompanyNewsVO companyNewsVO);
	
	public int deleteOneCompanyNews(String companyNewsPostId);

}

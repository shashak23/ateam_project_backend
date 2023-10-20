/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-18
 * 내용 : 기술스택 Service
 */
package com.ktdsuniversity.edu.techstack.service;

import java.util.List;

import com.ktdsuniversity.edu.techstack.vo.TechstackVO;

public interface TechstackService {
	/**
	 * 기술스택 생성 
	 */
	public boolean createNewTechstack(TechstackVO techstackVO);
	/**
	 * 기술스택 조회
	 */
	public List<TechstackVO> getAllTechstack(String email);
	/**
	 * 기술스택 한건조회
	 */
	public TechstackVO getOneTechstack(String email);
	
	/**
	 * 기술스택 삭제생성
	 */
	public boolean deleteUpTechstack(TechstackVO techstackVO);
	
	public List<TechstackVO> techSearch(String id);
}

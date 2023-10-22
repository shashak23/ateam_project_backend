/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-18
 * 내용 : 기술스택 생성 수정 삭제를 위한 DAO
 */
package com.ktdsuniversity.edu.techstack.dao;

import java.util.List;

import com.ktdsuniversity.edu.techstack.vo.TechstackVO;

public interface TechstackDAO {
	/**
	 * 기술스택 생성 
	 */
	public int createNewTechstack(TechstackVO techstackVO);
	/**
	 * 기술스택 조회
	 */
	public List<TechstackVO> getAllTechstack(String email);
	/**
	 * 기술스택 한건조회
	 */
	public TechstackVO getOneTechstack(String email);
	/**
	 * 기술스택 지웠다가 생성할 쿼리
	 */
	public int deleteTechstack(String email);
	public int insertTechstack(TechstackVO techstackVO);	
	public List<TechstackVO> techSearch(String id);

}



/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-18
 * 내용 : 기술스택 ServiceImpl
 */
package com.ktdsuniversity.edu.techstack.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
import com.ktdsuniversity.edu.techstack.dao.TechstackDAO;
import com.ktdsuniversity.edu.techstack.vo.TechstackVO;
@Service
public class TechstackServiceImpl implements TechstackService{
	@Autowired
	private TechstackDAO techstackDAO;
	/**
	 * 기술스택 생성 
	 */
	@Override
	public boolean createNewTechstack(TechstackVO techstackVO) {
		int createCount = techstackDAO.createNewTechstack(techstackVO);
		return createCount>0;
	}
	
	/**
	 * 기술스택 조회
	 */
	@Override
	public List<TechstackVO> getAllTechstack(String email) {
		return techstackDAO.getAllTechstack(email);
	}
	/**
	 * 기술스택 한건조회
	 */
	@Override
	public TechstackVO getOneTechstack(String email) {
		TechstackVO techstackVO = techstackDAO.getOneTechstack(email);
		if(techstackVO == null) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		return techstackVO;
	}
	
	/**
	 * 기술스택 수정 삭제
	 */
	@Transactional
	@Override
	public boolean deleteUpTechstack(TechstackVO techstackVO) {
		int deleteCount= techstackDAO.deleteTechstack(techstackVO.getEmail());
		
		int insertCount = 0;
		List<String> hashtagList = techstackVO.getHashtagList();
		for (String hashtagId : hashtagList) {
			techstackVO.setHashtagId(hashtagId);
			insertCount += techstackDAO.insertTechstack(techstackVO);
		}
		
		return deleteCount>0 && insertCount>0;
	}

	@Override
	public List<TechstackVO> techSearch(String id) {
		return techstackDAO.techSearch(id);
	}

}

/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-13
 * 내용 : 경력 전체 목록 ServiceImpl입니다.
 */
	package com.ktdsuniversity.edu.education.service;
	
	
	import org.springframework.beans.factory.annotation.Autowired;

	import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.education.dao.EducationDAO;
    import com.ktdsuniversity.edu.education.vo.EducationVO;
    @Service
	public class EducationServiceImpl implements EducationService{
		@Autowired
		private EducationDAO educationDAO;
		@Transactional
		@Override
		public boolean createNewEducation(EducationVO educationVO) {
			int createCount = educationDAO.createNewEducation(educationVO);
			return createCount>0;
		}
	
		@Override
		public EducationVO getOneEducation(String educationId) {
			EducationVO educationVO = educationDAO.getOneEducation(educationId);
			return educationVO;
		}
		@Transactional
		@Override
		public boolean updateOneEducation(EducationVO educationVO) {
			int updateCount = educationDAO.updateOneEducation(educationVO);
			return updateCount>0;
		}
		@Transactional
		@Override
		public boolean deleteOneEducation(String educationId) {
			int deleteCount = educationDAO.deleteOneEducation(educationId);
			return deleteCount>0;
		}
	
	
	}

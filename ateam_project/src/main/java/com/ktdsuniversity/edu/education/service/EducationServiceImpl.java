	package com.ktdsuniversity.edu.education.service;
	
	
	import org.springframework.beans.factory.annotation.Autowired;

	import org.springframework.stereotype.Service;
	import com.ktdsuniversity.edu.education.dao.EducationDAO;
    import com.ktdsuniversity.edu.education.vo.EducationVO;
    /**
     * 작성자 : 김광원
     * 작성일자 : 2023-10-13
     * 내용 : 경력 전체 목록 ServiceImpl입니다.
     */
    @Service
	public class EducationServiceImpl implements EducationService{
		@Autowired
		private EducationDAO educationDAO;
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
		@Override
		public boolean updateOneEducation(EducationVO educationVO) {
			int updateCount = educationDAO.updateOneEducation(educationVO);
			return updateCount>0;
		}
		@Override
		public boolean deleteOneEducation(String educationId) {
			int deleteCount = educationDAO.deleteOneEducation(educationId);
			return deleteCount>0;
		}
	
	
	}

/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-25
 * 내용 : 학력  DAOImpl입니다.
 */
package com.ktdsuniversity.edu.education.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.ktdsuniversity.edu.education.vo.EducationVO;
@Repository
public class EducationDAOImpl extends SqlSessionDaoSupport implements EducationDAO {
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	@Override
	public int createNewEducation(EducationVO educationVO) {
		return getSqlSession().insert("createNewEducation",educationVO);
	}
	@Override
	public EducationVO getOneEducation(String educationId) {
		return getSqlSession().selectOne("getOneEducation", educationId);
	}
	@Override
	public int updateOneEducation(EducationVO educationVO) {
		return getSqlSession().update("updateOneEducation", educationVO);
	}
	@Override
	public int deleteOneEducation(String educationId) {
		return getSqlSession().delete("deleteOneEducation",educationId);
	}
	

}

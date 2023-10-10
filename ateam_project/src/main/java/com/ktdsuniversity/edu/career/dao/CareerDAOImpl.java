package com.ktdsuniversity.edu.career.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.career.vo.CareerVO;
@Repository
public class CareerDAOImpl extends SqlSessionDaoSupport implements CareerDAO {
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		// TODO Auto-generated method stub
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	@Override
	public int createNewCareer(CareerVO careerVO) {
		return getSqlSession().insert("createNewCareer",careerVO );
	}

}

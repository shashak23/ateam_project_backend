package com.ktdsuniversity.edu.algorithmcategorylist.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.algorithmcategorylist.vo.AlgorithmCategoryListVO;

@Repository
public class AlgorithmCategoryListDAOImpl extends SqlSessionDaoSupport implements AlgorithmCategoryListDAO{

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	
	@Override
	public List<AlgorithmCategoryListVO> categorySearch(String postId) {
		return getSqlSession().selectList("categorySearch", postId);
	}

}

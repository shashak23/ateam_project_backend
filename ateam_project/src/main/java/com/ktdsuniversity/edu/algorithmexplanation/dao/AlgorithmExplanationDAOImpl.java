/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 알고리즘해설 게시판의 CRUD 쿼리를 수행합니다.
 */

package com.ktdsuniversity.edu.algorithmexplanation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationVO;

@Repository
public class AlgorithmExplanationDAOImpl extends SqlSessionDaoSupport implements AlgorithmExplanationDAO {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public int getAlgorithmExplanationAllCount() {
		return getSqlSession().selectOne("getAlgorithmExplanationAllCount");
	}

	@Override
	public List<AlgorithmExplanationVO> getAllAlgorithmExplanation() {
		return getSqlSession().selectList("getAllAlgorithmExplanation");
	}

	@Override
	public int createNewAlgorithmExplanation(AlgorithmExplanationVO algorithmExplanationVO) {
		return getSqlSession().insert("createNewAlgorithmExplanation", algorithmExplanationVO);
	}

	@Override
	public int increaseViewCount(String companyAlgorithmExplanationId) {
		return getSqlSession().update("com.ktdsuniversity.edu.algorithmexplanation.dao.AlgorithmExplanationDAO.increaseViewCount", companyAlgorithmExplanationId);
	}

	@Override
	public AlgorithmExplanationVO getOneAlgorithmExplanation(String companyAlgorithmExplanationId) {
		return getSqlSession().selectOne("getOneAlgorithmExplanation", companyAlgorithmExplanationId);
	}

	@Override
	public int updateOneAlgorithmExplanation(AlgorithmExplanationVO algorithmExplanationVO) {
		return getSqlSession().update("updateOneAlgorithmExplanation", algorithmExplanationVO);
	}

	@Override
	public int deleteOneAlgorithmExplanation(String companyAlgorithmExplanationId) {
		return getSqlSession().update("deleteOneAlgorithmExplanation", companyAlgorithmExplanationId);
	}

}

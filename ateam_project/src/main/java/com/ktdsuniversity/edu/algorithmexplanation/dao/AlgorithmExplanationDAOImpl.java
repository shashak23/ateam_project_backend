/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 수정자: 장보늬(2023-10-28)
 * 내용: 알고리즘해설 게시판의 CRUD 쿼리를 수행합니다.
 */

package com.ktdsuniversity.edu.algorithmexplanation.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationVO;
import com.ktdsuniversity.edu.algorithmexplanation.vo.SearchAlgorithmExplanationVO;
import com.ktdsuniversity.edu.common.vo.AbstractCompanyPostVO;
import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;

@Repository
public class AlgorithmExplanationDAOImpl extends SqlSessionDaoSupport implements AlgorithmExplanationDAO {

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public int getAlgorithmExplanationAllCount(SearchAlgorithmExplanationVO searchAlgorithmExplanationVO) {
		return getSqlSession().selectOne("getAlgorithmExplanationAllCount", searchAlgorithmExplanationVO);
	}

	@Override
	public List<AlgorithmExplanationVO> getAllAlgorithmExplanation() {
		return getSqlSession().selectList("getAllAlgorithmExplanation");
	}

	@Override
	public int getAlgorithmExplanationCount(String algorithmCategoryId) {
		return getSqlSession().selectOne("getAlgorithmExplanationCount", algorithmCategoryId);
	}

	@Override
	public List<AlgorithmExplanationVO> getAlgorithmExplanationByCategory(String algorithmCategoryId) {
		return getSqlSession().selectList("getAlgorithmExplanationByCategory", algorithmCategoryId);
	}

	@Override
	public List<AlgorithmExplanationVO> searchAllAlgorithmExplanation(
			SearchAlgorithmExplanationVO searchAlgorithmExplanationVO) {
		return getSqlSession().selectList("searchAllAlgorithmExplanation", searchAlgorithmExplanationVO);
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
	
	// 기원회원 내 게시글 조회
	@Override
	public List<AlgorithmExplanationVO> getCompanyMyPost(AbstractCompanyPostVO abstractCompanyPostVO) {
		return getSqlSession().selectList("com.ktdsuniversity.edu.algorithmexplanation.dao.AlgorithmExplanationDAO.getCompanyMyPost", abstractCompanyPostVO);
	}

	// 통합검색
	@Override
	public List<AlgorithmExplanationVO> searchAllAlgorithmExplanationByKeyword(AbstractSearchVO abstractSearchVO) {
		return getSqlSession().selectList("searchAllAlgorithmExplanationByKeyword", abstractSearchVO);
	}

	
}

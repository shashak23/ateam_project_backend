package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;

@Repository
public class GeneralPostDAOImpl extends SqlSessionDaoSupport
								implements GeneralPostDAO{

	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	@Override
	public int getBoardAllCount() {
		return getSqlSession().selectOne("getBoardAllCount");
	}

	@Override
	public List<GeneralPostVO> getAllBoard() {
		return getSqlSession().selectList("getAllBoard");
	}

	@Override
	public int createNewBoard(GeneralPostVO generalVO) {
		return getSqlSession().insert("createNewBoard", generalVO);
	}

	@Override
	public int increaseViewCount(int likeCnt) {
		return getSqlSession().update("com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO.increaseViewCount", likeCnt);
	}

	@Override
	public GeneralPostVO getOneBoardVO(int generalPostId) {
		return getSqlSession().selectOne("getOneBoardVO", generalPostId);
	}

	@Override
	public int updateOneBoard(GeneralPostVO generaVO) {
		return getSqlSession().update("updateOneBoard", generaVO);
	}

	@Override
	public int deleteOnBoard(int generalPostId) {
		return getSqlSession().delete("deleteOneBoard", generalPostId);
	}

}

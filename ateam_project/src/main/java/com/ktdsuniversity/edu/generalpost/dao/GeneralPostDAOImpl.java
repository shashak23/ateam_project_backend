package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.generalpost.vo.GenaralPostVO;

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
	public List<GenaralPostVO> getAllBoard() {
		return getSqlSession().selectList("getAllBoard");
	}

	@Override
	public int createNewBoard(GenaralPostVO generalVO) {
		return getSqlSession().insert("createNewBoard", generalVO);
	}

	@Override
	public int increaseViewCount(int likeCnt) {
		return getSqlSession().update("increaseViewCount", likeCnt);
	}

	@Override
	public GenaralPostVO getOneBoardVO(int likeCnt) {
		return getSqlSession().selectOne("getOneBoardVO", likeCnt);
	}

	@Override
	public int updateOneBoard(GenaralPostVO generaVO) {
		return getSqlSession().update("updateOneBoard", generaVO);
	}

	@Override
	public int deleteOnBoard(int boardId) {
		return getSqlSession().delete("deleteOneBoard", boardId);
	}

}

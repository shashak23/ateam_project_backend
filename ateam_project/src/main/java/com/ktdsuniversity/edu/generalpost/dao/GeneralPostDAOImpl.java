package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Repository
public class GeneralPostDAOImpl extends SqlSessionDaoSupport
								implements GeneralPostDAO{

	@Autowired
	private SqlSession sqlSession;
	
	private Logger log = LoggerFactory.getLogger(FreePostController.class);

	
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
	public int createNewBoard(GeneralPostVO generalPostVO) {
		return getSqlSession().insert("createNewBoard", generalPostVO);
	}

	@Override
	public GeneralPostVO getOneBoard(String generalPostId) {
		return getSqlSession().selectOne("getOneBoard", generalPostId);
	public int increaseViewCount(int likeCnt) {
		return getSqlSession().update("com.ktdsuniversity.edu.generalpost.dao.GeneralPostDAO.increaseViewCount", likeCnt);
	}

	@Override
	public int increaseViewCount(String generalPostId) {
		return getSqlSession().update("increaseViewCount", generalPostId);
	}
	
	@Override
	public int updateOneBoard(GeneralPostVO generalPostVO) {
		return getSqlSession().update("updateOneBoard", generalPostVO);
	}
	
	@Override
	public int deleteOneBoard (int generalPostId) {
		return getSqlSession().delete("deleteOneBoard", generalPostId);
	}
	
	
	
	
//	@Override
//	public int increaseViewCount(int likeCnt) {
//		return getSqlSession().update("increaseViewCount", likeCnt);
//	}
}

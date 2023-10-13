package com.ktdsuniversity.edu.generalmember.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;


@Repository
public class GeneralMemberDAOImpl extends SqlSessionDaoSupport implements GeneralMemberDAO {
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	@Override
	public int createNewGeneralMember(GeneralMemberVO generalMemberVO) {
		return getSqlSession().insert("createNewGeneralMember", generalMemberVO);
	}
	@Override
	public List<CareerVO> getAllCareerListByMemberEmail(String generalMemberEmail) {
		return getSqlSession().selectList("getAllCareerListByMemberEmail", generalMemberEmail);
	}
	@Override
	public GeneralMemberVO getOneAddress(String generalMemberEmail) {
		return getSqlSession().selectOne("getOneAddress",generalMemberEmail);
	}
	@Override
	public int updateOneAddress(GeneralMemberVO generalMemberVO) {
		return getSqlSession().update("updateOneAddress", generalMemberVO);
	}

}

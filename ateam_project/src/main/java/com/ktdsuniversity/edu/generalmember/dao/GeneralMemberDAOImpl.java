package com.ktdsuniversity.edu.generalmember.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;


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
	public List<GeneralMemberVO> getAllGeeralMemberList(String generalMemberEmail) {
		return getSqlSession().selectList("getAllGeeralMemberList",generalMemberEmail);
	}
	@Override
	public MemberVO getSelectNickname(String generalMemberEmail) {
		return getSqlSession().selectOne("getSelectNickname",generalMemberEmail);
	}
	@Override
	public GeneralMemberVO getSelectGeneralMember(String generalMemberEmail) {
		return getSqlSession().selectOne("getSelectGeneralMember",generalMemberEmail);
	}
	@Override
	public int updateOneAddress(GeneralMemberVO generalMemberVO) {
		return getSqlSession().update("updateOneAddress", generalMemberVO);
	}
	@Override
	public int deleteOneAddress(String generalMemberEmail) {
		return getSqlSession().update("deleteOneAddress",generalMemberEmail);
	}
	@Override
	public int updateSns(GeneralMemberVO generalMemberVO) {
		return getSqlSession().update("updateSns",generalMemberVO);
	}
	@Override
	public int deleteGithub(String generalMemberEmail) {
		return getSqlSession().update("deleteGithub",generalMemberEmail);
	}
	@Override
	public int deleteEmail(String generalMemberEmail) {
		return getSqlSession().update("deleteEmail",generalMemberEmail);
	}
	@Override
	public int deleteBlog(String generalMemberEmail) {
		return getSqlSession().update("deleteBlog",generalMemberEmail);
	}
	@Override
	public int updateselfIntro(GeneralMemberVO generalMemberVO) {
		return getSqlSession().update("updateselfIntro",generalMemberVO);
	}
	@Override
	public int deleteSelfIntro(String generalMemberEmail) {
		return getSqlSession().update("deleteSelfIntro",generalMemberEmail);
	}
	

}

package com.ktdsuniversity.edu.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.member.vo.MemberVO;

@Repository
public class MemberDAOImpl extends SqlSessionDaoSupport implements MemberDAO{
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	@Override
	public int getEmailCount(String email) {
		return getSqlSession().selectOne("getEmailCount",email);
	}
	@Override
	public int getNicknameCount(String nickname) {
		return getSqlSession().selectOne("getNicknameCount",nickname);
	}

	@Override
	public int createNewMember(MemberVO memberVO) {
		return getSqlSession().insert("createNewMember",memberVO);
	}
	@Override
	public String getSalt(String email) {
		return getSqlSession().selectOne("getSalt",email);
	}
	@Override
	public MemberVO getMember(MemberVO memberVO) {
		return getSqlSession().selectOne("getMember",memberVO);
	}

}

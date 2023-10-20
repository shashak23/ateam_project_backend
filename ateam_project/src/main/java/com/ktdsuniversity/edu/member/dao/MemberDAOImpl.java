package com.ktdsuniversity.edu.member.dao;

import java.util.List;

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
	/**
	 * 파일조회
	 */
	@Override
	public MemberVO getOneFile(String email) {
		return getSqlSession().selectOne("getOneFile",email);
	}
	/**
	 * 파일수정
	 */
	@Override
	public int updateOneFile(MemberVO memberVO) {
		return getSqlSession().update("updateOneFile",memberVO );
	}
	
	/**
	 * 회원탈퇴
	 */
	@Override
	public int updateWithdrawMember(MemberVO memberVO) {
		return getSqlSession().update("updateWithdrawMember", memberVO);
	}
	
	/**
	 * 기업회원 비밀번호 수정
	 */
	@Override
	public int updateCompanyPassword(MemberVO memberVO) {
		return getSqlSession().update("updateCompanyPassword", memberVO);
	}
	
	/**
	 * 기업회원가입
	 */
//	@Override
//	public int createNewCompanyMember(MemberVO memberVO) {
//		return getSqlSession().insert("createNewCompanyMember", memberVO);
//	}
	
	@Override
	public List<MemberVO> searchMember(String memberType) {
		return getSqlSession().selectList("searchMember", memberType);
	}
}

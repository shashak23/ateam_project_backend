/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-24
 * 수정일자 : 2023-10-25 수정자(김광원)
 * 내용 : 일반회원을 위한 DAOImpl입니다.
 */
package com.ktdsuniversity.edu.generalmember.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.education.vo.EducationVO;
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
	public List<EducationVO> getAllEducationList(String generalMemberEmail) {
		return getSqlSession().selectList("getAllEducationList",generalMemberEmail);
	}
	@Override
	public List<CommonCodeVO> getSelectCommonCode(String generalMemberEmail) {
		return getSqlSession().selectList("getSelectCommonCode",generalMemberEmail);
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
	@Override
	public int updateTierId(GeneralMemberVO generalMemberVO) {
		return getSqlSession().update("updateTierId", generalMemberVO);
	}
	@Override
	public int updateTierDate(GeneralMemberVO generalMemberVO) {
		return getSqlSession().update("updateTierDate", generalMemberVO);
	}
	@Override
	public List<Map<String, Object>> selectMemberActivityLog(String generalMemberEmail) {
		return getSqlSession().selectList("selectMemberActivityLog", generalMemberEmail);
	}
	@Override
	public List<GeneralMemberVO> selectTopTenScoreMemberList() {
		return getSqlSession().selectList("selectTopTenScoreMemberList");
	}

}

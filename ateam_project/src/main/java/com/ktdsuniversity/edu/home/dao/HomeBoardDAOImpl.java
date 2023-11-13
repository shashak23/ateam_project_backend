/**
 * 작성자: 김태현
 * 작성일: 2023-10-23
 * 내용: 홈 화면에서 쓸 쿼리를 만듭니다.
 */
package com.ktdsuniversity.edu.home.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.home.vo.HomeBoardVO;
import com.ktdsuniversity.edu.home.vo.HomeNickNameVO;
import com.ktdsuniversity.edu.home.vo.HomecommentCntVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Repository
public class HomeBoardDAOImpl extends SqlSessionDaoSupport implements HomeBoardDAO {
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public List<GeneralPostVO> getAllGeneralPost() {
		return getSqlSession().selectList("getAllGeneralPost");
	}
		
	@Override
	public List<HomecommentCntVO> getAllGeneralCommentCnt() {
		return getSqlSession().selectList("getAllGeneralCommentCnt");
	}
	
	@Override
	public List<HomeNickNameVO> getNicknameList() {
		return getSqlSession().selectList("getNicknameList");
	}
	
	@Override
	public List<GeneralPostVO> getWeeklyRanking(String date) {
		return getSqlSession().selectList("getWeeklyRanking", date);
	}
	
	@Override
	public List<HomeBoardVO> getHashtag(String postId) {
		return getSqlSession().selectList("getHashtag", postId);
	}
	
	@Override
	public MemberVO getMemberProfilePic(String email) {
		return getSqlSession().selectOne("getMemberProfilePic", email);
	}

	@Override
	public int freeboardCreateByMain(GeneralPostVO generalPostVO) {
		return getSqlSession().insert("freeboardCreateByMain", generalPostVO);
	}

	@Override
	public int qnaboardCreateByMain(GeneralPostVO generalPostVO) {
		return getSqlSession().insert("qnaboardCreateByMain", generalPostVO);
	}
}

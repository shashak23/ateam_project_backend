/**
 * 작성자: 김태현
 * 작성일: 2023-10-23
 * 내용: 홈화면에서 실행할 쿼리 수행 결과를 받아오는 클래스입니다.
 */
package com.ktdsuniversity.edu.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.generalpost.dao.GeneralPostHashtagDAO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;
import com.ktdsuniversity.edu.home.dao.HomeBoardDAO;
import com.ktdsuniversity.edu.home.vo.HomeBoardVO;
import com.ktdsuniversity.edu.home.vo.HomeNickNameVO;
import com.ktdsuniversity.edu.home.vo.HomecommentCntVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Service
public class HomeBoardServiceImpl implements HomeBoardService {
	@Autowired
	private HomeBoardDAO homeBoardDAO;
	@Autowired
	private GeneralPostHashtagDAO generalPostHashtagDAO;
	
	@Override
	public List<GeneralPostVO> getAllGeneralPost() {
		return homeBoardDAO.getAllGeneralPost();
	}
	
	@Override
	public List<HomecommentCntVO> getAllGeneralCommentCnt() {
		return homeBoardDAO.getAllGeneralCommentCnt();
	}
	
	@Override
	public List<HomeNickNameVO> getNicknameList() {
		return homeBoardDAO.getNicknameList();
	}
	
	@Override
	public List<GeneralPostVO> getWeeklyRanking(String date) {
		return homeBoardDAO.getWeeklyRanking(date);
	}

	@Override
	public List<HomeBoardVO> getHashtag(String postId) {
		return homeBoardDAO.getHashtag(postId);
	}
	
	@Override
	public MemberVO getMemberProfilePic(String email) {
		return homeBoardDAO.getMemberProfilePic(email);
	}

	@Override
	public boolean freeboardCreateByMain(GeneralPostVO generalPostVO) {
		return homeBoardDAO.freeboardCreateByMain(generalPostVO) > 0;
	}

	@Transactional
	@Override
	public boolean qnaboardCreateByMain(GeneralPostVO generalPostVO) {
		int tagCount = 0;
		List<HashtagVO> hashtagList = generalPostVO.getHashtagListVO();
		GeneralPostVO post = homeBoardDAO.qnaboardCreateByMain(generalPostVO);
		if (post == null) {
			return false;
		}
		for (HashtagVO hashtagVO : hashtagList) {
			hashtagVO.setGeneralPostId(post.getGeneralPostId());
			tagCount += generalPostHashtagDAO.createPostHashtag(hashtagVO);
		}
		return tagCount == hashtagList.size();
	}
}

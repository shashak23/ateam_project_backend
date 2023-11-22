package com.ktdsuniversity.edu.home.dao;

import java.util.List;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.home.vo.HomeBoardVO;
import com.ktdsuniversity.edu.home.vo.HomeNickNameVO;
import com.ktdsuniversity.edu.home.vo.HomecommentCntVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface HomeBoardDAO {
	public List<GeneralPostVO> getAllGeneralPost(int skip);
	public HomecommentCntVO getAllGeneralCommentCnt(String generalPostId);
	public HomeNickNameVO getNicknameList(String generalPostId);
	public List<GeneralPostVO> getWeeklyRanking(String date);
	public List<GeneralPostVO> getWeeklyRankingInQnaBoard(String date);
	public List<HomeBoardVO> getHashtag(String postId);
	public MemberVO getMemberProfilePic(String email);
	public int freeboardCreateByMain(GeneralPostVO generalPostVO);
	public GeneralPostVO qnaboardCreateByMain(GeneralPostVO generalPostVO);
}

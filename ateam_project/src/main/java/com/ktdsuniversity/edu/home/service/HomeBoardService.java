package com.ktdsuniversity.edu.home.service;

import java.util.List;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.home.vo.HomeBoardVO;
import com.ktdsuniversity.edu.home.vo.HomeNickNameVO;
import com.ktdsuniversity.edu.home.vo.HomecommentCntVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface HomeBoardService {
	public List<GeneralPostVO> getAllGeneralPost(int skip);
	public HomecommentCntVO getAllGeneralCommentCnt(String generalPostId);
	public HomeNickNameVO getNicknameList(String generalPostId);
	public List<GeneralPostVO> getWeeklyRanking(String date); 
	public List<GeneralPostVO> getWeeklyRankingInQnaBoard(String date); 
	public List<HomeBoardVO> getHashtag(String postId);
	public MemberVO getMemberProfilePic(String email);
	public boolean freeboardCreateByMain(GeneralPostVO generalPostVO);
	public boolean qnaboardCreateByMain(GeneralPostVO generalPostVO);
}

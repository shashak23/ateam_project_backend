package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;
import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;

public interface GeneralCommentDAO {

	//모든 댓글 조회
	public List<GeneralCommentVO> getAllComments(String generalPostId);
	public GeneralCommentVO getOneComment(String generalCommentId);
	//댓글 작성
	public int createNewComment(GeneralCommentVO generalCommentVO);
	//댓글 삭제
	public int deleteOneComment(String generalCommentId);
	//댓글 수정
	public int modifyOneComment(GeneralCommentVO generalCommentVO);
	//댓글 좋아요
	public int recommendOneComment(String generalCommentId);
	//댓글 신고
	public int reportOneComment(String generalCommentId);	
}

/**
 * 작성자: 남현욱
수정자:장윤경
 * 작성일자: 2023-10-16
 * 내용: 질문 답변 게시판 댓글을 위한 DAO입니다.
 */
package com.ktdsuniversity.edu.generalpost.dao;

import java.util.List;
import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;

public interface GeneralCommentDAO {

	public List<GeneralCommentVO> getAllComments(String generalPostId);
	public GeneralCommentVO getOneComment(String generalCommentId);
	public int createNewComment(String gemeralPostId,GeneralCommentVO generalCommentVO);
	public int doUpdateComment(GeneralCommentVO generalCommentVO);
	public int deleteOneComment(String generalCommentId);
	public int likeOneComment(String generalCommentId);
	public int reportOneComment(String generalCommentId);
	

	
}

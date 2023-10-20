/**
 * 작성자: 남현욱
 * 작성일자: 2023-10-16
 * 내용: 질문 답변 게시판 댓글을 위한 service입니다.
 */
package com.ktdsuniversity.edu.generalpost.service;

import java.util.List;

import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;

public interface GeneralCommentService {

	public List<GeneralCommentVO> getAllComments(String generalPostId);
	public boolean createNewComment(GeneralCommentVO generalCommentVO);
	public boolean deleteOneComment(String generalCommentId,String commentWriter);
	public boolean updateOneComment(GeneralCommentVO generalCommentVO);
	public boolean likeOneComment(String generalCommentId, String commentWriter);
	//public boolean reportOneComment(String generalCommentId, String commentWriter);
	
}

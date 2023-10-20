/**
 * 작성자: 남현욱
*수정자 :장윤경
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
	public boolean modifyOneComment(GeneralCommentVO generalCommentVO);//update로 통일 하기로 했는데 왜 여기는 modify인지?
	public boolean recommendOneComment(String generalCommentId, String commentWriter);//노션에는 따로 recommend가 없는데 왜 있는건지?
	//public boolean reportOneComment(String generalCommentId, String commentWriter);
	
}

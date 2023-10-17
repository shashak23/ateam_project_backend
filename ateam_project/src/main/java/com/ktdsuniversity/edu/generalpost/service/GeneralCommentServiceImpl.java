/**
 * 작성자: 남현욱
 * 작성일자: 2023-10-16
 * 내용: 질문 답변 게시판 댓글을 위한 ServiceImpl입니다.
 */
package com.ktdsuniversity.edu.generalpost.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
import com.ktdsuniversity.edu.generalpost.dao.GeneralCommentDAO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;

@Service
public class GeneralCommentServiceImpl implements GeneralCommentService{

	@Autowired
	private GeneralCommentDAO generalCommentDAO;
	
	@Override
	public List<GeneralCommentVO> getAllComments(String generalPostId){
		return generalCommentDAO.getAllComments(generalPostId);
	}
	
	@Override
	public boolean createNewComment(GeneralCommentVO generalCommentVO) {
		int insertCount = generalCommentDAO.createNewComment(generalCommentVO);
		return insertCount > 0;
	}
	
	@Override
	public boolean deleteOneComment(String generalCommentId, String commentWriter) {
		GeneralCommentVO generalCommentVO = generalCommentDAO.getOneComment(generalCommentId);
		if(!commentWriter.equals(generalCommentVO.getCommentWriter())) {
				throw new PageNotFoundException("잘못된 접근입니다.");
		}
		return generalCommentDAO.deleteOneComment(generalCommentId) > 0;
	}
	@Override
	public boolean modifyOneComment(GeneralCommentVO generalCommentVO) {
		GeneralCommentVO originCommentVO = generalCommentDAO.getOneComment(generalCommentVO.getGeneralCommentId());
		if (!generalCommentVO.getCommentWriter().equals(originCommentVO.getCommentWriter())) {
		throw new PageNotFoundException("잘못된 접근입니다.");
		}
		return generalCommentDAO.modifyOneComment(generalCommentVO) > 0;
	}
	@Override
	public boolean recommendOneComment(String generalCommentId, String commentWriter) {
		GeneralCommentVO generalCommentVO = generalCommentDAO.getOneComment(generalCommentId);
		if(commentWriter.equals(generalCommentVO.getCommentWriter())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		return generalCommentDAO.recommendOneComment(generalCommentId) > 0;
	}
	
	@Override
	public boolean reportOneComment(String generalCommentId, String commentWriter) {
		GeneralCommentVO generalCommentVO = generalCommentDAO.getOneComment(generalCommentId);
		if(!commentWriter.equals(generalCommentVO.getCommentWriter())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
	}
	return generalCommentDAO.reportOneComment(generalCommentId) > 0;
}
	}


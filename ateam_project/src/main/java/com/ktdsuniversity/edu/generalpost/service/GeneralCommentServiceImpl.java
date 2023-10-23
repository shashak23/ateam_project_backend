/**
 * 작성자: 남현욱

 수정자 :장윤경
 * 작성일자: 2023-10-16
 * 내용: 질문 답변 게시판 댓글을 위한 ServiceImpl입니다.
 */
package com.ktdsuniversity.edu.generalpost.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.AteamProjectApplication;
import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
import com.ktdsuniversity.edu.generalpost.dao.GeneralCommentDAO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;

@Service
public class GeneralCommentServiceImpl implements GeneralCommentService{

	@Autowired
	private GeneralCommentDAO generalCommentDAO;
	
	private Logger log = LoggerFactory.getLogger(AteamProjectApplication.class);
	
	@Override
	public List<GeneralCommentVO> getAllComments(String generalPostId){
		return generalCommentDAO.getAllComments(generalPostId);
	}
	@Transactional
	@Override
	public boolean createNewComment(String generalPostId, GeneralCommentVO generalCommentVO) {
		int insertCount = generalCommentDAO.createNewComment(generalPostId, generalCommentVO);
		return insertCount > 0;
	}
	@Transactional
	@Override
	public boolean updateOneComment(String generalCommentId, GeneralCommentVO generalCommentVO) {
	    GeneralCommentVO originCommentVO = generalCommentDAO.getOneComment(generalCommentVO.getGeneralCommentId());
	    if (!generalCommentVO.getCommentWriter().equals(originCommentVO.getCommentWriter())) {
	        throw new PageNotFoundException("잘못된 접근입니다.");
	    }
	    int updateCount = generalCommentDAO.updateOneComment(generalCommentVO);
	    return updateCount > 0;
	}
	@Transactional
	@Override
	public boolean deleteOneComment(String generalCommentId, String commentWriter) {
		GeneralCommentVO generalCommentVO = generalCommentDAO.getOneComment(generalCommentId);
		if(!commentWriter.equals(generalCommentVO.getCommentWriter())) {
				throw new PageNotFoundException("잘못된 접근입니다.");
		}
		int deleteCount= generalCommentDAO.deleteOneComment(generalCommentId);
		return deleteCount > 0;
	}
	@Transactional
	@Override
	public boolean likeOneComment(String generalCommentId, String commentWriter) {
		GeneralCommentVO generalCommentVO = generalCommentDAO.getOneComment(generalCommentId);
		if(commentWriter.equals(generalCommentVO.getCommentWriter())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		return generalCommentDAO.likeOneComment(generalCommentId) > 0;
	}
	@Override
	public boolean doUpdateComment(String generalPostId, GeneralCommentVO generalCommentVO) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	
	
	}
	
	
	/*
	 * @Override public boolean reportOneComment(String generalCommentId, String
	 * commentWriter) { GeneralCommentVO generalCommentVO =
	 * generalCommentDAO.getOneComment(generalCommentId);
	 * if(!commentWriter.equals(generalCommentVO.getCommentWriter())) { throw new
	 * PageNotFoundException("잘못된 접근입니다."); } return
	 * generalCommentDAO.reportOneComment(generalCommentId) > 0; }
	 */
	

/**
 * 작성자: 남현욱
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
		  log.debug("--3----서비스----------------------------");

		return generalCommentDAO.getAllComments(generalPostId);
	}
	@Transactional
	@Override
	public boolean createNewComment(GeneralCommentVO generalCommentVO) {
		int insertCount = generalCommentDAO.createNewComment(generalCommentVO);
		return insertCount > 0;
	}
	@Transactional
	@Override
	public boolean deleteOneComment(String generalCommentId, String commentWriter) {
		GeneralCommentVO generalCommentVO = generalCommentDAO.getOneComment(generalCommentId);
		if(!commentWriter.equals(generalCommentVO.getCommentWriter())) {
				throw new PageNotFoundException("잘못된 접근입니다.");
		}
		int deleteCount= generalCommentDAO.deleteOneComment(generalCommentId);
		return generalCommentDAO.deleteOneComment(generalCommentId) > 0;
	}
	@Transactional
	@Override
	public boolean modifyOneComment(GeneralCommentVO generalCommentVO) {
		GeneralCommentVO originCommentVO = generalCommentDAO.getOneComment(generalCommentVO.getGeneralCommentId());
		if (!generalCommentVO.getCommentWriter().equals(originCommentVO.getCommentWriter())) {
		throw new PageNotFoundException("잘못된 접근입니다.");
		}
		int updateCount=generalCommentDAO.modifyOneComment(generalCommentVO);
		return generalCommentDAO.modifyOneComment(generalCommentVO) > 0;
	}
	@Transactional
	@Override
	public boolean recommendOneComment(String generalCommentId, String commentWriter) {
		GeneralCommentVO generalCommentVO = generalCommentDAO.getOneComment(generalCommentId);
		if(commentWriter.equals(generalCommentVO.getCommentWriter())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		return generalCommentDAO.recommendOneComment(generalCommentId) > 0;
	}
	
	/*
	 * @Override public boolean reportOneComment(String generalCommentId, String
	 * commentWriter) { GeneralCommentVO generalCommentVO =
	 * generalCommentDAO.getOneComment(generalCommentId);
	 * if(!commentWriter.equals(generalCommentVO.getCommentWriter())) { throw new
	 * PageNotFoundException("잘못된 접근입니다."); } return
	 * generalCommentDAO.reportOneComment(generalCommentId) > 0; }
	 */
	}


/**
 * 작성자: 남현욱
 * 작성일자: 2023-10-16
 * 내용: 질문 답변 게시판 댓글을 위한 Controller입니다.
 */
package com.ktdsuniversity.edu.generalpost.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.AteamProjectApplication;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.generalpost.service.GeneralCommentService;
import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;


@RestController
public class QnAPostCommentController {

	@Autowired
	private GeneralCommentService generalCommentService;
	
	private Logger log = LoggerFactory.getLogger(AteamProjectApplication.class);
	
	  @GetMapping("/qnaboard/comments/{generalPostId}") 
	  public Map<String,Object> getAllComments(@PathVariable String generalPostId) { 
	  List<GeneralCommentVO> commentList = generalCommentService.getAllComments(generalPostId);
	  Map<String, Object> resultMap = new HashMap<>(); 
	  log.debug("--1----컨트롤러----------------------------");
	  resultMap.put("count", commentList.size());
	  resultMap.put("comments", commentList); 
	  log.debug("--5----컨트롤러 댓글 리스트----------------------------");
	  return resultMap;
	  }

	@PostMapping("/qnaboard/comments/create/{generalPostId}")
	public Map<String, Object> doCreateNewComments(@PathVariable String generalPostId,
			@ModelAttribute GeneralCommentVO generalCommentVO,
			@SessionAttribute("_LOGIN_USER_") GeneralMemberVO generalMemberVO) {
		generalCommentVO.setGeneralPostId(generalPostId);
		generalCommentVO.setCommentWriter(generalMemberVO.getGeneralMemberEmail());
		boolean isSuccess = generalCommentService.createNewComment(generalPostId, generalCommentVO);

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}

	@PostMapping("/qnaboard/comments/delete/{generalCommentId}")
	public Map<String, Object> doDeleteComments(@PathVariable String generalCommentId,
			@SessionAttribute("_LOGIN_USER_") GeneralMemberVO generalMemberVO) {
		boolean isSuccess = generalCommentService.deleteOneComment(generalCommentId,
				generalMemberVO.getGeneralMemberEmail());
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}

	@PostMapping("/qnaboard/comments/update/{generalCommentId}")
	public Map<String, Object> doUpdateComments(@PathVariable String generalCommentId,
			@ModelAttribute GeneralCommentVO generalCommentVO,
			@SessionAttribute("_LOGIN_USER") GeneralMemberVO generalMemberVO) {
		generalCommentVO.setGeneralCommentId(generalCommentId);
		generalCommentVO.setCommentWriter(generalMemberVO.getGeneralMemberEmail());
		boolean isSuccess = generalCommentService.updateOneComment(generalCommentId, generalCommentVO);

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}

	@GetMapping("/qnaboard/comments/like/{generalCommentId}")
	public Map<String, Object> doLikeComments(@PathVariable String generalCommentId,
			@SessionAttribute("_LOGIN_USER_") GeneralMemberVO generalMemberVO) {
		boolean isSuccess = generalCommentService.deleteOneComment(generalCommentId,
				generalMemberVO.getGeneralMemberEmail());
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}

	// 댓글 신고
//	@PostMapping ("/qnaboard/comments/report/{generalCommentId}")
//	public Map<String,Object> doReportComment(@PathVariable String generalCommentId,
//											  @SessionAttribute("_LOGIN_USER_")GeneralMemberVO generalMemberVO){
//		

//	}
//
//	@PostMapping("/qnaboard/comments/delete/{generalCommentId}")
//	public Map<String, Object> doDeleteComments(@PathVariable String generalCommentId,
//			@SessionAttribute("_LOGIN_USER_") GeneralMemberVO generalMemberVO) {
//		boolean isSuccess = generalCommentService.deleteOneComment(generalCommentId,
//				generalMemberVO.getGeneralMemberEmail());
//		Map<String, Object> resultMap = new HashMap<>();
//		resultMap.put("result", isSuccess);
//		return resultMap;
//	}
//
//	@PostMapping("/qnaboard/comments/update/{generalCommentId}")
//	public Map<String, Object> doUpdateComments(@PathVariable String generalCommentId,
//			@ModelAttribute GeneralCommentVO generalCommentVO,
//			@SessionAttribute("_LOGIN_USER") GeneralMemberVO generalMemberVO) {
//		generalCommentVO.setGeneralCommentId(generalCommentId);
//		generalCommentVO.setCommentWriter(generalMemberVO.getGeneralMemberEmail());
//		boolean isSuccess = generalCommentService.updateOneComment(generalCommentVO);
//
//		Map<String, Object> resultMap = new HashMap<>();
//		resultMap.put("result", isSuccess);
//		return resultMap;
//	}
//
//	@GetMapping("/qnaboard/comments/like/{generalCommentId}")
//	public Map<String, Object> doLikeComments(@PathVariable String generalCommentId,
//			@SessionAttribute("_LOGIN_USER_") GeneralMemberVO generalMemberVO) {
//		boolean isSuccess = generalCommentService.deleteOneComment(generalCommentId,
//				generalMemberVO.getGeneralMemberEmail());
//		Map<String, Object> resultMap = new HashMap<>();
//		resultMap.put("result", isSuccess);
//		return resultMap;
//	}
//
//	// 댓글 신고
////	@PostMapping ("/qnaboard/comments/report/{generalCommentId}")
////	public Map<String,Object> doReportComment(@PathVariable String generalCommentId,
////											  @SessionAttribute("_LOGIN_USER_")GeneralMemberVO generalMemberVO){
////		
////	}
}

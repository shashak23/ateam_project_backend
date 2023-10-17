/**
 * 작성자: 남현욱
 * 작성일자: 2023-10-16
 * 내용: 질문 답변 게시판 댓글을 위한 Controller입니다.
 */
package com.ktdsuniversity.edu.generalpost.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.generalpost.service.GeneralCommentService;
import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;


@RestController
public class QnAPostCommentController {
	@Autowired
	private GeneralCommentService generalCommentService;
	
	// 전체조회
//	@GetMapping("/qnapost/comments/{generalPostId}")
//	public Map<String, Object> getAllComments(@PathVariable String generalPostId){
//		List<GeneralCommentVO> qnaCommentList = generalCommentService.getAllComments(generalPostId);
//		
//		Map<String, Object> resultMap = new HashMap<>();
//		resultMap.put("count", qnaCommentList.size());
//		resultMap.put("qnacomments", qnaCommentList);
//		return resultMap;
//	}
	
//	@RequestMapping("list.do")
//	public ModelAndView list(@RequestParam int bno)
//		List<GeneralCommentVO> list= GeneralComment.list(bno, start , end, session);
//		mav.setViewName("qnaboard/commentList");
//		mav.addObject("list",list);
//		return mav;
	
	@PostMapping("/qnapost/comments/create/{generalPostId}")
	public Map<String,Object> doCreateNewComments(@PathVariable String generalPostId,
							  @ModelAttribute GeneralCommentVO generalCommentVO,
							  @SessionAttribute("_LOGIN_USER_") GeneralMemberVO generalMemberVO){
		generalCommentVO.setGeneralPostId(generalPostId);
		generalCommentVO.setCommentWriter(generalMemberVO.getGeneralMemberEmail());
		boolean isSuccess = generalCommentService.createNewComment(generalCommentVO);
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("result",isSuccess);
		return resultMap;
	}
	
	@PostMapping("/qnapost/comments/delete/{generalCommentId}")
	public Map<String,Object> doDeleteComments(@PathVariable String generalCommentId,
							  @SessionAttribute("_OGIN_USER_") GeneralMemberVO generalMemberVO){
		boolean isSuccess = generalCommentService.deleteOneComment(generalCommentId, generalMemberVO.getGeneralMemberEmail());
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}
	
	@PostMapping("/qnapost/comments/modify/{generalCommentId}")
	public Map<String, Object> doModifyComments (@PathVariable String generalCommentId,
							   @ModelAttribute GeneralCommentVO generalCommentVO,
							   @SessionAttribute("_LOGIN_USER") GeneralMemberVO generalMemberVO){
		generalCommentVO.setGeneralCommentId(generalCommentId);
		generalCommentVO.setCommentWriter(generalMemberVO.getGeneralMemberEmail());
		boolean isSuccess = generalCommentService.modifyOneComment(generalCommentVO);
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}
	
	@GetMapping("/qnapost/comments/like/{generalCommentId}")
	public Map<String, Object> doRecommendComments(@PathVariable String generalCommentId,
												   @SessionAttribute("_LOGIN_USER_")GeneralMemberVO generalMemberVO){
		boolean isSuccess = generalCommentService.deleteOneComment(generalCommentId, generalMemberVO.getGeneralMemberEmail());
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}
	
	//댓글 신고
//	@PostMapping ("/qnapost/comments/report/{generalCommentId}")
//	public Map<String,Object> doReportComment(@PathVariable String generalCommentId,
//											  @SessionAttribute("_LOGIN_USER_")GeneralMemberVO generalMemberVO){
//		
//	}
}


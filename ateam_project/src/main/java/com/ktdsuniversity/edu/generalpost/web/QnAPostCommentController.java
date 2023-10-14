package com.ktdsuniversity.edu.generalpost.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.generalpost.service.GeneralCommentService;
import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;


@RestController
public class QnAPostCommentController {
	
//	 @GetMapping("/test")
//	    public String replyAjaxTest() {
//	        return "/reply/reply_test";
//	    }

	@Autowired
	private GeneralCommentService generalCommentService;
	
	@GetMapping("/test")
	public Map<String, Object> getAllComments(@PathVariable String GeneralPostId){
		List<GeneralCommentVO> qnaCommentList = generalCommentService.getAllComments(GeneralPostId);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("count", qnaCommentList.size());
		resultMap.put("qnacomments", qnaCommentList);
		return resultMap;
	}
	
	
	
	@PostMapping("/qnapost/comments/delete/{commentId}")
	public Map<String,Object> doDeleteComments(@PathVariable String generalCommentId,
							  @SessionAttribute("_LOGIN_USER_") GeneralMemberVO generalMemberVO){
		boolean isSuccess = generalCommentService.deleteOneComment(generalCommentId, generalMemberVO.getGeneralMemberEmail());
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}
	
	@PostMapping("/qnapost/comments/modify/{commentId}")
	public Map<String, Object> doModifyComments (@PathVariable String generalCommentId,
							   @ModelAttribute GeneralCommentVO generalCommentVO,
							   @SessionAttribute("_LOGIN_USER") GeneralMemberVO generalMemberVO){
		generalCommentVO.setGeneralCommentId(generalCommentId);
		generalCommentVO.setCommentWriterId(generalMemberVO.getGeneralMemberEmail());
		boolean isSuccess = generalCommentService.modifyOneComment(generalCommentVO);
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}
	
	@GetMapping("/qnapost/comments/like/{commentId}")
	public Map<String, Object> doRecommendComments(@PathVariable String generalCommentId,
												   @SessionAttribute("_LOGIN_USER_")GeneralMemberVO generalMemberVO){
		boolean isSuccess = generalCommentService.deleteOneComment(generalCommentId, generalMemberVO.getGeneralMemberEmail());
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}
	
	//댓글 신고
//	@PostMapping ("/qnapost/comments/report/{commentId}")
//	public Map<String, >
}


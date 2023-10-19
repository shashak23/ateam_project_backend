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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.AteamProjectApplication;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.generalpost.service.GeneralCommentService;
import com.ktdsuniversity.edu.generalpost.service.GeneralPostService;
import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;

@Controller
@RestController
public class QnAPostCommentController {
	@Autowired
	private GeneralPostService generalPostService;
	@Autowired
	private GeneralCommentService generalCommentService;
	
	private Logger log = LoggerFactory.getLogger(AteamProjectApplication.class);

	// CHAT-GPT
//	 @GetMapping("/qnapost/comments/list/{generalPostId}")
//	    public String showPostAndComments(@PathVariable String generalPostId, Model model) {
//	        // 게시물 정보 가져오기
//	        GeneralPostVO generalPostVO = generalPostService.getOneBoard(generalPostId);
//
//	        // 댓글 리스트 가져오기
//	        List<GeneralCommentVO> commentList = generalCommentService.getAllComments(generalPostId);
//
//	        // 모델에 데이터 추가
//	        model.addAttribute("generalPostVO", generalPostVO);
//	        model.addAttribute("commentList", commentList);
//
//	        // JSP 파일의 경로를 반환
//	        return "forum/qnacommentlist.jsp";
//	    }

//	// 전체조회
//		@GetMapping("/qnapost/comments/list/{generalPostId}")
//		public ModelAndView qnaCommentList(@PathVariable String generalPostId) {
//			List<GeneralCommentVO> commentList = generalCommentService.getAllComments(generalPostId);
//			ModelAndView modelAndView = new ModelAndView();
//			
//			modelAndView.setViewName("/forum/qnacommentlist");
//			modelAndView.addObject("commentList", commentList);
//			
//			return modelAndView;
//		}

	
	  @GetMapping("/qnapost/comments/{generalPostId}") public Map<String,Object>
	  getAllComments(@PathVariable String generalPostId) { 
		  List<GeneralCommentVO> commentList = generalCommentService.getAllComments(generalPostId);
	  Map<String, Object> resultMap = new HashMap<>(); 
	  log.debug("--1----컨트롤러----------------------------");
	  resultMap.put("count", commentList.size()); resultMap.put("commentList", commentList); 
	  return resultMap;
	  }

	@PostMapping("/qnapost/comments/create/{generalPostId}")
	public Map<String, Object> doCreateNewComments(@PathVariable String generalPostId,
			@ModelAttribute GeneralCommentVO generalCommentVO,
			@SessionAttribute("_LOGIN_USER_") GeneralMemberVO generalMemberVO) {
		generalCommentVO.setGeneralPostId(generalPostId);
		generalCommentVO.setCommentWriter(generalMemberVO.getGeneralMemberEmail());
		boolean isSuccess = generalCommentService.createNewComment(generalCommentVO);

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}

	@PostMapping("/qnapost/comments/delete/{generalCommentId}")
	public Map<String, Object> doDeleteComments(@PathVariable String generalCommentId,
			@SessionAttribute("_LOGIN_USER_") GeneralMemberVO generalMemberVO) {
		boolean isSuccess = generalCommentService.deleteOneComment(generalCommentId,
				generalMemberVO.getGeneralMemberEmail());
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}

	@PostMapping("/qnapost/comments/modify/{generalCommentId}")
	public Map<String, Object> doModifyComments(@PathVariable String generalCommentId,
			@ModelAttribute GeneralCommentVO generalCommentVO,
			@SessionAttribute("_LOGIN_USER") GeneralMemberVO generalMemberVO) {
		generalCommentVO.setGeneralCommentId(generalCommentId);
		generalCommentVO.setCommentWriter(generalMemberVO.getGeneralMemberEmail());
		boolean isSuccess = generalCommentService.modifyOneComment(generalCommentVO);

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}

	@GetMapping("/qnapost/comments/like/{generalCommentId}")
	public Map<String, Object> doRecommendComments(@PathVariable String generalCommentId,
			@SessionAttribute("_LOGIN_USER_") GeneralMemberVO generalMemberVO) {
		boolean isSuccess = generalCommentService.deleteOneComment(generalCommentId,
				generalMemberVO.getGeneralMemberEmail());

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}

	// 댓글 신고
//	@PostMapping ("/qnapost/comments/report/{generalCommentId}")
//	public Map<String,Object> doReportComment(@PathVariable String generalCommentId,
//											  @SessionAttribute("_LOGIN_USER_")GeneralMemberVO generalMemberVO){
//		
//	}
}

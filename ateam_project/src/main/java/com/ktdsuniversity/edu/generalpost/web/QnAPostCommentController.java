/***
 * 2023.10.19 장윤경
 */

package com.ktdsuniversity.edu.generalpost.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.generalpost.service.GeneralCommentService;
import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

import jakarta.websocket.server.PathParam;

@RestController
public class QnAPostCommentController {

	private Logger log = LoggerFactory.getLogger(QnAPostCommentController.class);

	@Autowired
	private GeneralCommentService generalCommentService;

	// 댓글 목록 조회
	@GetMapping("/qnaboard/view/comment/{generalPostId}")
	public ResponseEntity<Map<String, Object>> getCommentList(@PathVariable String generalPostId) {
		List<GeneralCommentVO> commentList = generalCommentService.getAllComments(generalPostId);
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("count", commentList.size());
		resultMap.put("comments", commentList);
		return ResponseEntity.ok(resultMap);
	}

	// 댓글 작성
	@PostMapping("/qnaboard/comment/write/{generalPostId}")
	public ResponseEntity<Map<String, Object>> createComment(
	    @PathVariable String generalPostId,
	     GeneralCommentVO generalCommentVO,
	    @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
	    generalCommentVO.setGeneralPostId(generalPostId);
	    generalCommentVO.setCommentWriter(memberVO.getEmail());   
	    boolean isSuccess = generalCommentService.createNewComment(generalPostId, generalCommentVO);
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("result", isSuccess);
	    return ResponseEntity.ok(resultMap);
	}

	// 댓글 수정
//	@PostMapping("/qnaboard/comment/update/{generalPostId}")
//	public ResponseEntity<Map<String, Object>> doUpdateComment(@PathVariable String generalPostId,
//	        @ModelAttribute GeneralCommentVO generalCommentVO, @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
//	    generalCommentVO.setGeneralPostId(generalPostId);
//	    generalCommentVO.setCommentWriter(memberVO.getEmail());
//    boolean isSuccess = generalCommentService.doUpdateComment(generalPostId, generalCommentVO);
//    System.out.println(".---------------------------------" + generalPostId + "fasdasdasdsadasd" +  memberVO.getEmail());
//	    Map<String, Object> resultMap = new HashMap<>();
//	    resultMap.put("result", isSuccess);
//	    return ResponseEntity.ok(resultMap);
//	}
//	
	//댓글 수정 교재
	@PostMapping("/qnaboard/comment/update/{generalCommentId}")
	public Map<String, Object> UpdateComment(@PathVariable String generalCommentId,
												@ModelAttribute GeneralCommentVO generalCommentVO,
												@SessionAttribute("_LOGIN_USER_") MemberVO memberVO){
		generalCommentVO.setGeneralCommentId(generalCommentId);
		generalCommentVO.setCommentWriter(memberVO.getEmail());	//generalMember?
		boolean isSuccess = generalCommentService.doUpdateComment(generalCommentId,generalCommentVO);	//service에 두 개 파라미터
		Map<String, Object> resultMap= new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}
	
	
	// 댓글 삭제
	@GetMapping("/qnaboard/comment/delete/{generalPostId}")
	public ResponseEntity<Map<String, Object>> deleteComment(@PathVariable String generalPostId,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		boolean isSuccess = generalCommentService.deleteOneComment(generalPostId, memberVO.getEmail());
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return ResponseEntity.ok(resultMap);
	}

	// 댓글 좋아요
	@GetMapping("/qnaboard/comment/like/{generalPostId}")
	public ResponseEntity<Map<String, Object>> likeOneComment(@PathVariable String generalPostId,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		boolean isSuccess = generalCommentService.likeOneComment(generalPostId, memberVO.getEmail());
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return ResponseEntity.ok(resultMap);
	}
}
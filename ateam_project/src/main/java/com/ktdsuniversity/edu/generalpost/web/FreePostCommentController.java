/***
 * 2023.10.19 장윤경
 */

package com.ktdsuniversity.edu.generalpost.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.generalpost.service.GeneralCommentService;
import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

import jakarta.websocket.server.PathParam;

@RestController
public class FreePostCommentController {
	
	@Autowired
	private GeneralCommentService generalCommentService;
	
	@GetMapping("/freeboard/comments/{commentId}")
	public Map<String, Object> getAllFreeBoardCommentList(@PathVariable String generalCommentId) {
		List<GeneralCommentVO> commentList = generalCommentService.getAllComments(generalCommentId);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("count", commentList.size());
		resultMap.put("comments", commentList);
		return resultMap;
	}
	
	@PostMapping("/freeboard/comments/{commentId}")
	public Map<String, Object>createFreeBoardComment(@PathVariable String generalCommentId,
	                                              @ModelAttribute GeneralCommentVO generalCommentVO,//컨트롤러 메소드의 파라미터로 사용되는 어노테이션 중 하나입니다
	                                              @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {//세션에서 값을 가져오거나 세션에 값을 저장하기 위해 사용되는 어노테이션 중 하나
		generalCommentVO.setGeneralPostId(generalCommentId);
		generalCommentVO.setCommentWriter(memberVO.getEmail());
		boolean isSuccess = generalCommentService.createNewComment(generalCommentVO);
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;	
	}
	@GetMapping("freeboard/comments/delete/{commentId}")
	public Map<String, Object> deleteFreeBoardComment(@PathVariable String generalCommentId,
													  @SessionAttribute("_LOGIN_USER_")MemberVO memberVO) {
		boolean isSuccess = generalCommentService.deleteOneComment(generalCommentId,memberVO.getEmail());
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}
//	@PostMapping("/freeboard/comments/update/{commentId}")
//	public Map<String, Object> updateFreeBoardComment(@PathVariable String generalCommentId,
//													  @ModelAttribute GeneralCommentVO generalCommentVO,
//													  @SessionAttribute("_LOGIN_USER_")MemberVO memberVO) {
//		generalCommentVO.setGeneralPostId(generalCommentId);
//		generalCommentVO.setCommentWriter(memberVO.getEmail());
//		Map<String,Object> resultMap = new HashMap<>();
//		resultMap.put("result", isSuccess);
//		return resultMap;
//	}
	
	
}
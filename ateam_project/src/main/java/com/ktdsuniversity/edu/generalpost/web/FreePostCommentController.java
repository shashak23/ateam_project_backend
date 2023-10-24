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
public class FreePostCommentController {

	private Logger log = LoggerFactory.getLogger(FreePostCommentController.class);

	@Autowired
	private GeneralCommentService generalCommentService;

	// 댓글 목록 조회
	@GetMapping("/freeboard/view/comment/{generalPostId}")
	public ResponseEntity<Map<String, Object>> getCommentList(@PathVariable String generalPostId) {
		List<GeneralCommentVO> commentList = generalCommentService.getAllComments(generalPostId);
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("count", commentList.size());
		resultMap.put("comments", commentList);
		return ResponseEntity.ok(resultMap);
	// return resultMap;
	}

	
	

	// 댓글 작성
	@PostMapping("/freeboard/comment/write/{generalPostId}")
	public ResponseEntity<Map<String, Object>> createComment(
	    @PathVariable String generalPostId,
	     GeneralCommentVO generalCommentVO,
	    @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {

	    generalCommentVO.setGeneralPostId(generalPostId);
	    generalCommentVO.setCommentWriter(memberVO.getEmail());
	    //int result = generalCommentService.createNewComment(generalCommentVO);
	    boolean isSuccess = generalCommentService.createNewComment(generalPostId, generalCommentVO);
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("result", isSuccess);
	    return ResponseEntity.ok(resultMap);
	    //return resultMap;
	}



	// 댓글 수정
	@PostMapping("/freeboard/comment/update/{generalPostId}")
	public ResponseEntity<Map<String, Object>> updateComment(@PathVariable String generalPostId,
	        @RequestBody GeneralCommentVO generalCommentVO, @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
	    generalCommentVO.setGeneralPostId(generalPostId); // generalpostid를 사용하여 게시물 ID 설정
	    generalCommentVO.setCommentWriter(memberVO.getEmail());   
    boolean isSuccess = generalCommentService.doUpdateComment(generalPostId, generalCommentVO); // 메서드 호출 시도
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("result", isSuccess);
	    return ResponseEntity.ok(resultMap);
	}
	// 댓글 삭제
	@GetMapping("/freeboard/comment/delete/{generalPostId}")
	public ResponseEntity<Map<String, Object>> deleteComment(@PathVariable String generalPostId,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		boolean isSuccess = generalCommentService.deleteOneComment(generalPostId, memberVO.getEmail());
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);

		return ResponseEntity.ok(resultMap);
	}

	// 댓글 좋아요
	@GetMapping("/freeboard/comment/like/{generalPostId}")
	public ResponseEntity<Map<String, Object>> likeOneComment(@PathVariable String generalPostId,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		boolean isSuccess = generalCommentService.likeOneComment(generalPostId, memberVO.getEmail());

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);

		return ResponseEntity.ok(resultMap);
	}
}
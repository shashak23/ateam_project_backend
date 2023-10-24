/**
 * 작성자: 김태현
 * 작성일: 2023-10-23
 * 내용: 북마크 정보들을 보내주고 관리할 API
 */
package com.ktdsuniversity.edu.bookmark.web;

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

import com.ktdsuniversity.edu.bookmark.service.BookmarkService;
import com.ktdsuniversity.edu.bookmark.vo.BookmarkListVO;
import com.ktdsuniversity.edu.bookmark.vo.BookmarkVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@RestController
public class BookmarkController {
	@Autowired
	private BookmarkService bookmarkService;
	
	@GetMapping("/bookmark/general-post")
	public Map<String, Object> getAllGeneralPostBookmark(@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		System.out.println("이메일: " + memberVO.getEmail());
		BookmarkListVO bookmarkListVO = bookmarkService.getAllBookmark(memberVO.getEmail());
		List<BookmarkVO> bookmarkList = bookmarkListVO.getBookmarkList();
		
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("count", bookmarkList.size());
		resultMap.put("bookmarkList", bookmarkList);
		
		return resultMap;
	}
	
	@PostMapping("/bookmark/general-post/")
	public Map<String, Object> doCreateGeneralPostBookmark(@SessionAttribute("_LOGIN_USER_") MemberVO memberVO,
														   @ModelAttribute BookmarkVO bookmarkVO) {
		bookmarkVO.setGeneralMemberEmail(memberVO.getEmail());
		boolean isSuccess = bookmarkService.createBookmark(bookmarkVO);
		
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}
	
	@GetMapping("/unbookmark/{postId}")
	public Map<String, Object> deleteBookmarkGeneralPostBookmark(@SessionAttribute("_LOGIN_USER_") MemberVO memberVO,
																 @PathVariable String postId) {
		
		BookmarkVO bookmarkVO = new BookmarkVO();
		bookmarkVO.setGeneralMemberEmail(memberVO.getEmail());
		boolean isSuccess = bookmarkService.deleteBookmark(postId);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}
	
}

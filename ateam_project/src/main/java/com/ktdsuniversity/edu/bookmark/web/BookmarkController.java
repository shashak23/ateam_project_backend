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
import com.ktdsuniversity.edu.bookmark.vo.BookmarkSearchVO;
import com.ktdsuniversity.edu.bookmark.vo.BookmarkVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@RestController
public class BookmarkController {
	@Autowired
	private BookmarkService bookmarkService;
	
	@GetMapping("/bookmark/general-post")
	public Map<String, Object> getAllGeneralPostBookmark(@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		BookmarkListVO bookmarkListVO = bookmarkService.getAllBookmark(memberVO.getEmail());
		List<BookmarkVO> bookmarkList = bookmarkListVO.getBookmarkList();
		
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("count", bookmarkList.size());
		resultMap.put("bookmarkList", bookmarkList);
		
		return resultMap;
	}
	
	// 메인화면 북마크 조회용
	@GetMapping("/bookmark/status/{email}/{postId}")
	public BookmarkVO getBookmarkStatus(@PathVariable String email,
										@PathVariable String postId) {
		BookmarkSearchVO bookmarkSearchVO = new BookmarkSearchVO();
		bookmarkSearchVO.setEmail(email);
		bookmarkSearchVO.setGeneralPostId(postId);
		
		return bookmarkService.getBookmarkStatus(bookmarkSearchVO);
	}
	
	// 자유게시판 북마크 조회용
	@GetMapping("/bookmark/freeboard-list/{email}")
	public List<BookmarkVO> getFreeBoardBookmarkList(@PathVariable String email) {
		return bookmarkService.getFreeboardBookmark(email);
	}
	
	// 질답게시판 북마크 조회용
	@GetMapping("/bookmark/qnaboard-list/{email}")
	public List<BookmarkVO> getQnaBoardBookmarkStatus(@PathVariable String email) {
		return bookmarkService.getQnaboardBookmark(email);
	}
	
	
	@PostMapping("/bookmark/general-post")
	public Map<String, Object> doCreateGeneralPostBookmark(@SessionAttribute("_LOGIN_USER_") MemberVO memberVO,
														   @ModelAttribute BookmarkVO bookmarkVO) {
		bookmarkVO.setGeneralMemberEmail(memberVO.getEmail());
		
		BookmarkSearchVO bookmarkSearchVO = new BookmarkSearchVO();
		bookmarkSearchVO.setEmail(bookmarkVO.getGeneralMemberEmail());
		bookmarkSearchVO.setGeneralPostId(bookmarkVO.getPostId());
		
		boolean isSuccess = bookmarkService.createBookmark(bookmarkVO, bookmarkSearchVO);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		String bookmarkId = bookmarkService.getBookmarkStatus(bookmarkSearchVO).getBookmarkId();
		
		resultMap.put("result", isSuccess);
		resultMap.put("bookmarkId", bookmarkId);
		return resultMap;
	}
	
	@PostMapping("/unbookmark")
	public Map<String, Object> unBookmarkGeneralPostBookmark(@SessionAttribute("_LOGIN_USER_") MemberVO memberVO,
															 @ModelAttribute BookmarkVO bookmarkVO) {
		

		boolean isSuccess = bookmarkService.toggleBookmark(bookmarkVO.getBookmarkId());
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}
	
}

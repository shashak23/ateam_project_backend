/**
 * 작성자: 김태현
 * 작성일: 2023-10-23
 * 내용: 북마크 쿼리와 관련 로직을 수행할 서비스 임플먼트
 */
package com.ktdsuniversity.edu.bookmark.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.bookmark.dao.BookmarkDAO;
import com.ktdsuniversity.edu.bookmark.vo.BookmarkListVO;
import com.ktdsuniversity.edu.bookmark.vo.BookmarkSearchVO;
import com.ktdsuniversity.edu.bookmark.vo.BookmarkVO;

@Service
public class BookmarkServiceImpl implements BookmarkService {
	@Autowired
	private BookmarkDAO bookmarkDAO;
	
	public BookmarkListVO getAllBookmark(String email) {
		BookmarkListVO bookmarkListVO = new BookmarkListVO();
		bookmarkListVO.setBookmarkList(bookmarkDAO.getAllBookmark(email));
		
		return bookmarkListVO;
	}
	
	@Override
	public BookmarkVO getBookmarkStatus(BookmarkSearchVO bookmarkSearchVO) {
		return bookmarkDAO.getBookmarkStatus(bookmarkSearchVO);
	}
	
	@Transactional
	@Override
	public boolean createBookmark(BookmarkVO bookmarkVO) {
		return bookmarkDAO.createBookmark(bookmarkVO) > 0;
	}
	
	@Transactional
	@Override
	public boolean deleteBookmark(String bookmarkId) {
		return bookmarkDAO.deleteBookmark(bookmarkId) > 0;
	}
	
	@Transactional
	@Override
	public boolean toggleBookmark(String bookmarkId) {
		return bookmarkDAO.toggleBookmark(bookmarkId) > 0;
	}
}

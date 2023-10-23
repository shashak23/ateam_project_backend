/**
 * 작성자: 김태현
 * 작성일: 2023-10-23
 * 내용: 북마크 쿼리와 관련 로직을 수행할 서비스
 */
package com.ktdsuniversity.edu.bookmark.service;

import com.ktdsuniversity.edu.bookmark.vo.BookmarkListVO;
import com.ktdsuniversity.edu.bookmark.vo.BookmarkVO;

public interface BookmarkService {
	public BookmarkListVO getAllBookmark(String email);
	public boolean createBookmark(BookmarkVO bookmarkVO);
	public boolean deleteBookmark(String bookmarkId);
}

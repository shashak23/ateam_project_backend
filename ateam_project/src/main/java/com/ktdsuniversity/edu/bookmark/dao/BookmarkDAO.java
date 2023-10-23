/**
 * 작성자: 김태현
 * 작성일: 2023-10-23
 * 내용: 북마크 쿼리를 수행할 DAO 입니다.
 */
package com.ktdsuniversity.edu.bookmark.dao;

import java.util.List;

import com.ktdsuniversity.edu.bookmark.vo.BookmarkVO;

public interface BookmarkDAO {
	public List<BookmarkVO> getAllBookmark(String email);
	public int createBookmark(BookmarkVO bookmarkVO);
	public int deleteBookmark(String bookmarkId);
}

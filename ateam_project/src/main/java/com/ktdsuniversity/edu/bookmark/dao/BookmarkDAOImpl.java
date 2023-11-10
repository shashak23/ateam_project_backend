/**
 * 작성자: 김태현
 * 작성일: 2023-10-23
 * 내용: 북마크 관련 쿼리들을 수행하는 클래스입니다.
 */
package com.ktdsuniversity.edu.bookmark.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.bookmark.vo.BookmarkSearchVO;
import com.ktdsuniversity.edu.bookmark.vo.BookmarkVO;

@Repository
public class BookmarkDAOImpl extends SqlSessionDaoSupport implements BookmarkDAO {
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}
	
	@Override
	public List<BookmarkVO> getAllBookmark(String email) {
		return getSqlSession().selectList("getAllBookmark", email);
	}
	
	@Override
	public List<BookmarkVO> getFreeboardBookmark(String email) {
		return getSqlSession().selectList("getFreeboardBookmark", email);
	}
	
	@Override
	public List<BookmarkVO> getQnaboardBookmark(String email) {
		return getSqlSession().selectList("getQnaboardBookmark", email);
	}
	
	@Override
	public List<BookmarkVO> getOneBookmark(BookmarkVO bookmarkVO) {
		return getSqlSession().selectOne("getOneBookmark", bookmarkVO);
	}
	
	@Override
	public BookmarkVO getBookmarkStatus(BookmarkSearchVO bookmarkSearchVO) {
		return getSqlSession().selectOne("getBookmarkStatus", bookmarkSearchVO);
	}

	@Override
	public int createBookmark(BookmarkVO bookmarkVO) {
		return getSqlSession().insert("createBookmark", bookmarkVO);
	}

	@Override
	public int deleteBookmark(BookmarkSearchVO bookmarkSearchVO) {
		return getSqlSession().update("deleteBookmark", bookmarkSearchVO);
	}
	@Override
	public int toggleBookmark(String bookmarkId) {
		return getSqlSession().update("toggleBookmark", bookmarkId);
	}
}

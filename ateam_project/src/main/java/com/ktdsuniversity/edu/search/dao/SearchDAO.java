/**
 * 작성자: 장보늬
 * 생성날짜: 2023-10-25
 * 내용: 통합검색 키워드 조회를 위한 DAO
 */
package com.ktdsuniversity.edu.search.dao;

import java.util.List;

public interface SearchDAO {
	
	public List<String> getAllSearchKeyword();

}

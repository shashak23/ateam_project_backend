/**
 * 작성자: 장보늬
 * 생성날짜: 2023-10-25
 * 내용: 통합검색 키워드 조회를 위한 ServiceImpl
 */
package com.ktdsuniversity.edu.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.search.dao.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDAO searchDAO;
	
	@Override
	public List<String> getAllSearchKeyword() {
		return searchDAO.getAllSearchKeyword();
	}

}

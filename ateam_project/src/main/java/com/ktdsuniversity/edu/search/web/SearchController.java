/**
 * 작성자: 장보늬
 * 생성날짜: 2023-10-25
 * 내용: 통합검색 키워드 조회를 위한 Controller
 */
package com.ktdsuniversity.edu.search.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktdsuniversity.edu.search.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	@GetMapping("/keyword")
	@ResponseBody
	public List<String> getAllSearchKeyword() {
		return searchService.getAllSearchKeyword();
	}

}

/**
 * 작성자: 장보늬
 * 작성날짜: 2023-10-19
 * 내용: 알고리즘문제가 가지는 카테고리 목록 컨트롤러
 * **/
package com.ktdsuniversity.edu.algorithmcategorylist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktdsuniversity.edu.algorithmcategorylist.service.AlgorithmCategoryListService;
import com.ktdsuniversity.edu.algorithmcategorylist.vo.AlgorithmCategoryListVO;

@Controller
public class AlgorithmCategoryListController {
	
	@Autowired
	private AlgorithmCategoryListService algorithmCategoryListService;

	@GetMapping("/algorithm/category/{postId}")
	@ResponseBody
	public List<AlgorithmCategoryListVO> searchCategory(@PathVariable String postId) {
		return algorithmCategoryListService.categorySearch(postId);
	}
}

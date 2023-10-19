package com.ktdsuniversity.edu.algorithmcategorylist.web;

import java.util.ArrayList;
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
		List<AlgorithmCategoryListVO> list = algorithmCategoryListService.categorySearch(postId);
		
		return algorithmCategoryListService.categorySearch(postId);
	}
}

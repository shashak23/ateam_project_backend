package com.ktdsuniversity.edu.generalpost.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ktdsuniversity.edu.generalpost.service.GeneralPostService;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;

@RestController
public class GeneralPostRestController {
	@Autowired
	private GeneralPostService generalPostService;
	
	@GetMapping("/generalpost/freeboard/all")
	public List<GeneralPostVO> allFreeboardAPI() {
		List<GeneralPostVO> resultList = new ArrayList<>();
		
		resultList.addAll(generalPostService.getAllFreeBoardRest());
		
		return resultList;
	}
	
	@GetMapping("/generalpost/qnaboard/all")
	public List<GeneralPostVO> allQnaboardAPI() {
		List<GeneralPostVO> resultList = new ArrayList<>();
		
		resultList.addAll(generalPostService.getAllQnaBoardRest());
		
		return resultList;
	}
}

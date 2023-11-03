package com.ktdsuniversity.edu.generalpost.web;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ktdsuniversity.edu.generalpost.service.GeneralPostService;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;

@RestController
public class GeneralPostRestController {
	@Autowired
	private GeneralPostService generalPostService;
	
	@GetMapping("/generalpost/{boardType}/all")
	public List<GeneralPostVO> allBoardAPI(@PathVariable String boardType) {
		List<GeneralPostVO> resultList = new ArrayList<>();
		
		if (boardType.equals("freeboard")) {
			resultList.addAll(generalPostService.getAllBoardRest("CC-20231017-000029"));
		}
		else if (boardType.equals("qnaboard")) {
			resultList.addAll(generalPostService.getAllBoardRest("CC-20231017-000030"));
		}
		
		
		return resultList;
	}
	
//	@GetMapping("/generalpost/qnaboard/all")
//	public List<GeneralPostVO> allQnaboardAPI() {
//		List<GeneralPostVO> resultList = new ArrayList<>();
//		
//		resultList.addAll(generalPostService.getAllBoardRest("CC-20231017-000030"));
//		
//		return resultList;
//	}
}

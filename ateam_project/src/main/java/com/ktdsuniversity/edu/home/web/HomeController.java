package com.ktdsuniversity.edu.home.web;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktdsuniversity.edu.generalpost.service.GeneralPostService;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.home.service.HomeBoardService;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.ktdsuniversity.edu.algorithmquestion.service.AlgorithmQuestionService;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.SearchAlgorithmQuestionVO;

@Controller
public class HomeController {
	@Autowired
	private GeneralPostService generalPostService;

	@Autowired
	private AlgorithmQuestionService algorithmQuestionService;
	
	@Autowired
	private HomeBoardService homeBoardService;
	
	@GetMapping("/home/home")
	public String homeLink() {
		return "home/home";
	}
	
	@ResponseBody
	@GetMapping("/home/maincontent")
	public Map<String, Object> getAllMainContents() {
		Map<String, Object> resultMap = new HashMap<>();
		List<GeneralPostVO> generalList = new ArrayList<>();
		generalList.addAll(generalPostService.getAllFreeBoard().getGeneralPostList());
		generalList.addAll(generalPostService.getAllQnABoard().getGeneralPostList());
		resultMap.put("contents", generalList);
		return resultMap;
	}
	
	@ResponseBody
	@GetMapping("/home/ranking/{date}")
	public Map<String, Object> getWeeklyRanking(@PathVariable String date) {
		System.out.println("랭킹을 가져옵니다. 날짜:" + date);
		Map<String, Object> resultMap = new HashMap<>();
		List<GeneralPostVO> RankingList = new ArrayList<>();
		RankingList.addAll(homeBoardService.getWeeklyRanking(date));
		resultMap.put("rankings", RankingList);
		return resultMap;
	}
		
	@GetMapping("/home/search")
	public String viewAllBoardList(@ModelAttribute SearchAlgorithmQuestionVO searchAlgorithmQuestionVO, Model model) {
		AlgorithmQuestionListVO algorithmQuestionListVO = algorithmQuestionService.getAllAlgorithmQuestionByKeyword(searchAlgorithmQuestionVO);
		model.addAttribute("algorithmQuestionList", algorithmQuestionListVO);
		model.addAttribute("searchAlgorithmQuestionVO", searchAlgorithmQuestionVO);
		return "home/homesearch";
	}
}

package com.ktdsuniversity.edu.home.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ktdsuniversity.edu.algorithmquestion.service.AlgorithmQuestionService;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.SearchAlgorithmQuestionVO;

@Controller
public class HomeController {

	@Autowired
	private AlgorithmQuestionService algorithmQuestionService;
	
	@GetMapping("/home/home")
	public String homeLink() {
		return "home/home";
	}
	
	@GetMapping("/home/search")
	public String viewAllBoardList(@ModelAttribute SearchAlgorithmQuestionVO searchAlgorithmQuestionVO, Model model) {
		AlgorithmQuestionListVO algorithmQuestionListVO = algorithmQuestionService.getAllAlgorithmQuestionByKeyword(searchAlgorithmQuestionVO);
		model.addAttribute("algorithmQuestionList", algorithmQuestionListVO);
		model.addAttribute("searchAlgorithmQuestionVO", searchAlgorithmQuestionVO);
		return "home/homesearch";
	}
}

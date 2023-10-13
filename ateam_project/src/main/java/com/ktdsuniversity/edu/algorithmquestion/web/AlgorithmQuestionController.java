package com.ktdsuniversity.edu.algorithmquestion.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ktdsuniversity.edu.algorithmquestion.service.AlgorithmQuestionService;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;

@Controller
public class AlgorithmQuestionController {
	
	@Autowired
	private AlgorithmQuestionService algorithmQuestionService;

	@GetMapping("algorithmquestion/list")
	public String viewAlgorithmQuestionList(Model model) {
		AlgorithmQuestionListVO algorithmQuestionListVO = algorithmQuestionService.getAllAlgorithmQuestion();
		model.addAttribute("algorithmQuestionList", algorithmQuestionListVO);
		return "company/algorithmquestion/questionlist";
	}
}

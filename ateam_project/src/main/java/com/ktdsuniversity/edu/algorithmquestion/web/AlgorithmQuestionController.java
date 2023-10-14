package com.ktdsuniversity.edu.algorithmquestion.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.algorithmquestion.service.AlgorithmQuestionService;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsVO;

@Controller
public class AlgorithmQuestionController {
	
	@Autowired
	private AlgorithmQuestionService algorithmQuestionService;

	@GetMapping("/algorithm/question/list")
	public String viewAlgorithmQuestionList(Model model) {
		AlgorithmQuestionListVO algorithmQuestionListVO = algorithmQuestionService.getAllAlgorithmQuestion();
		model.addAttribute("algorithmQuestionList", algorithmQuestionListVO);
		return "company/algorithmquestion/questionlist";
	}
	
	@GetMapping("/algorithm/question/view/{companyAlgorithmQuestionId}") 
	public String viewOneAlgorithmQuestion (@PathVariable String companyAlgorithmQuestionId
			                       , Model model) {
		AlgorithmQuestionVO algorithmQuestionVO = algorithmQuestionService.getOneAlgorithmQuestion(companyAlgorithmQuestionId, true);
		model.addAttribute("algorithmQuestionVO", algorithmQuestionVO);
		return "company/algorithmquestion/questionview";
	}
	
	@GetMapping("/algorithm/question/create")
	public String viewAlgorithmQuestionCreatePage() {
		return "company/algorithmquestion/questioncreate";
	}
	
	@PostMapping("/algorithm/question/create")
	public String doAlgorithmQuestionCreate(@ModelAttribute AlgorithmQuestionVO algorithmQuestionVO
			                              , Model model) {

		boolean isSuccess = algorithmQuestionService.createNewsAlgorithmQuestion(algorithmQuestionVO);
		if(isSuccess) {
			return "redirect:/algorithm/question/list";
		}
		else {
			model.addAttribute("algorithmQuestionVO", algorithmQuestionVO);
			return "company/algorithmquestion/questioncreate";
		}
	}
	
	@GetMapping("/algorithm/question/update/{companyAlgorithmQuestionId}")
	public String viewAlgorithmQuestionUpdatePage(@PathVariable String companyAlgorithmQuestionId
			                                    , Model model) {
		System.out.println("PathVariable: " + companyAlgorithmQuestionId);
		
		AlgorithmQuestionVO algorithmQuestionVO = algorithmQuestionService.getOneAlgorithmQuestion(companyAlgorithmQuestionId, false);
		
//		if(!algorithmQuestionVO.algorithmWriter().equals()) {
//			throw new IllegalArgumentException("잘못된 접근입니다.");
//		}
		
		model.addAttribute("algorithmQuestionVO", algorithmQuestionVO);
		return "company/algorithmquestion/questionupdate";
	}
	
	@PostMapping("/algorithm/question/update")
	public String doAlgorithmQuestionUpdate(@ModelAttribute AlgorithmQuestionVO algorithmQuestionVO
			                        , Model model) {
		System.out.println("Post ID: " + algorithmQuestionVO.getCompanyAlgorithmQuestionId());
		System.out.println("제목: " + algorithmQuestionVO.getAlgorithmTitle());
		System.out.println("내용: " + algorithmQuestionVO.getAlgorithmContent());
		
		AlgorithmQuestionVO originAlgorithmQuestionVO = algorithmQuestionService.getOneAlgorithmQuestion(algorithmQuestionVO.getCompanyAlgorithmQuestionId(), false);

//		if(!originAlgorithmQuestionVO.getAlgorithmWriter().equals())
		
		boolean isSuccess = algorithmQuestionService.updateOneAlgorithmQuestion(algorithmQuestionVO);
		if(isSuccess) {
			return "redirect:/algorithm/question/view/" + algorithmQuestionVO.getCompanyAlgorithmQuestionId();
		}
		else {
			model.addAttribute("algorithmQuestionVO", algorithmQuestionVO);
			return "company/algorithmquestion/questionupdate";
		}
	}
	

	@GetMapping("/algorithm/question/delete/{companyAlgorithmQuestionId}")
	public String doDeleteAlgorithmQuestion(@PathVariable String companyAlgorithmQuestionId) {
        System.out.println("PathVariable: " + companyAlgorithmQuestionId);
		
        algorithmQuestionService.deleteOneAlgorithmQuestion(companyAlgorithmQuestionId);
		
//		if(!algorithmQuestionVO.getAlgorithmWriter().equals()) {
//			throw new IllegalArgumentException("잘못된 접근입니다.");
//		}
		
		return "redirect:/algorithm/question/list";
	}
	
	// 일반회원이 로그인 해서 제출하기 버튼을 클릭했을 때
}

package com.ktdsuniversity.edu.algorithmquestion.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.algorithmquestion.service.AlgorithmQuestionService;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.SearchAlgorithmQuestionVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;

import jakarta.validation.Valid;

@Controller
public class AlgorithmQuestionController {
	
	private Logger logger = LoggerFactory.getLogger(AlgorithmQuestionController.class);
	
	@Autowired
	private AlgorithmQuestionService algorithmQuestionService;

	@GetMapping("/algorithm/question/list")
	public String viewAlgorithmQuestionList( @ModelAttribute SearchAlgorithmQuestionVO searchAlgorithmQuestionVO, Model model) {
		AlgorithmQuestionListVO algorithmQuestionListVO = algorithmQuestionService.getAllAlgorithmQuestion(searchAlgorithmQuestionVO);
		model.addAttribute("algorithmQuestionList", algorithmQuestionListVO);
		model.addAttribute("searchAlgorithmQuestionVO", searchAlgorithmQuestionVO);
		return "company/algorithmquestion/questionlist";
	}
	
	@GetMapping("/algorithm/question/view/{companyAlgorithmQuestionId}") 
	public String viewOneAlgorithmQuestion (@PathVariable String companyAlgorithmQuestionId
			                       , Model model) {
		AlgorithmQuestionVO algorithmQuestionVO = algorithmQuestionService.getOneAlgorithmQuestion(companyAlgorithmQuestionId, true);
		model.addAttribute("algorithmQuestionVO", algorithmQuestionVO);
		return "company/algorithmquestion/questionview";
	}
	
	// 일반회원이 로그인 해서 제출하기 버튼을 클릭했을 때
	@PostMapping("/myalgorithm/create")
	public String doMyAlgorithmCreate(@ModelAttribute MyAlgorithmVO myAlgorithmVO
			                        , Model model) {
		boolean isSuccess = algorithmQuestionService.createNewMyAlgorithm(myAlgorithmVO);
		if(isSuccess) {
			return("redirect:/algorithm/question/list");
		}
		model.addAttribute("algorithmQuestionVO", myAlgorithmVO);
		return "company/algorithmquestion/questionview";
	}
	
	@GetMapping("/algorithm/question/create")
	public String viewAlgorithmQuestionCreatePage() {
		return "company/algorithmquestion/questioncreate";
	}
	
	@PostMapping("/algorithm/question/create")
	public String doAlgorithmQuestionCreate(@Valid @ModelAttribute AlgorithmQuestionVO algorithmQuestionVO
			                              , Model model
			                              , BindingResult bindingResult
			                              , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {

		if(bindingResult.hasErrors()) {
			model.addAttribute("algorithmQuestionVO", algorithmQuestionVO);
			return "company/algorithmquestion/questioncreate";
		}
		
		algorithmQuestionVO.setAlgorithmWriter(memberVO.getEmail());
		
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
		logger.debug("PathVariable: " + companyAlgorithmQuestionId);
		
		AlgorithmQuestionVO algorithmQuestionVO = algorithmQuestionService.getOneAlgorithmQuestion(companyAlgorithmQuestionId, false);
		
//		if(!algorithmQuestionVO.algorithmWriter().equals()) {
//			throw new PageNotFoundException("잘못된 접근입니다.");
//		}
		
		model.addAttribute("algorithmQuestionVO", algorithmQuestionVO);
		return "company/algorithmquestion/questionupdate";
	}
	
	@PostMapping("/algorithm/question/update")
	public String doAlgorithmQuestionUpdate(@ModelAttribute AlgorithmQuestionVO algorithmQuestionVO
			                        , Model model) {
		logger.debug("Post ID: " + algorithmQuestionVO.getCompanyAlgorithmQuestionId());
		logger.debug("제목: " + algorithmQuestionVO.getAlgorithmTitle());
		logger.debug("내용: " + algorithmQuestionVO.getAlgorithmContent());
		
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
		logger.debug("PathVariable: " + companyAlgorithmQuestionId);
		
        algorithmQuestionService.deleteOneAlgorithmQuestion(companyAlgorithmQuestionId);
		
//		if(!algorithmQuestionVO.getAlgorithmWriter().equals()) {
//			throw new PageNotFoundException("잘못된 접근입니다.");
//		}
		
		return "redirect:/algorithm/question/list";
	}
	
	
}

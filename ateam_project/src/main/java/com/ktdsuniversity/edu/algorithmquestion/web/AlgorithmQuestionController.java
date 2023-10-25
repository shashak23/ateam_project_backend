/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 알고리즘문제 게시판의 요청과 응답을 처리합니다.
 */

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.algorithmanswer.service.AlgorithmAnswerService;
import com.ktdsuniversity.edu.algorithmanswer.vo.AlgorithmAnswerVO;
import com.ktdsuniversity.edu.algorithmquestion.service.AlgorithmQuestionService;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.SearchAlgorithmQuestionVO;
import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.util.XssIgnoreUtil;

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
	
	@GetMapping("/algorithm/question/create")
	public String viewAlgorithmQuestionCreatePage() {
		return "company/algorithmquestion/questioncreate";
	}
	
	@PostMapping("/algorithm/question/create")
	public String doAlgorithmQuestionCreate(@Valid @ModelAttribute AlgorithmQuestionVO algorithmQuestionVO
			                              , BindingResult bindingResult
			                              , Model model
			                              , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		
		XssIgnoreUtil.ignore(algorithmQuestionVO);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("algorithmQuestionVO", algorithmQuestionVO);
			return "company/algorithmquestion/questioncreate";
		}
		
		algorithmQuestionVO.setAlgorithmWriter(memberVO.getEmail());
		
		boolean isSuccess = algorithmQuestionService.createNewAlgorithmQuestion(algorithmQuestionVO);
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
			                                    , Model model
			                                    , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		logger.debug("PathVariable: " + companyAlgorithmQuestionId);
		
		AlgorithmQuestionVO algorithmQuestionVO = algorithmQuestionService.getOneAlgorithmQuestion(companyAlgorithmQuestionId, false);
		
		if(!algorithmQuestionVO.getAlgorithmWriter().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		
		model.addAttribute("algorithmQuestionVO", algorithmQuestionVO);
		return "company/algorithmquestion/questionupdate";
	}
	
	@PostMapping("/algorithm/question/update")
	public String doAlgorithmQuestionUpdate(@ModelAttribute AlgorithmQuestionVO algorithmQuestionVO
			                              , Model model
			                              , @RequestParam String algorithmCategoryIdList
			                              , @RequestParam String algorithmTierId
			                              , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		XssIgnoreUtil.ignore(algorithmQuestionVO);
		
		logger.debug("Post ID: " + algorithmQuestionVO.getCompanyAlgorithmQuestionId());
		logger.debug("제목: " + algorithmQuestionVO.getAlgorithmTitle());
		logger.debug("내용: " + algorithmQuestionVO.getAlgorithmContent());
		
		AlgorithmQuestionVO originAlgorithmQuestionVO = algorithmQuestionService.getOneAlgorithmQuestion(algorithmQuestionVO.getCompanyAlgorithmQuestionId(), false);

		// 게시글 수정 url로도 접근 못하게
		if(!originAlgorithmQuestionVO.getAlgorithmWriter().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다!");
		}
		
		// 알고리즘카테고리 & 난이도가 null인지 체크하는 if문
		if (algorithmCategoryIdList == null || algorithmCategoryIdList.isEmpty()) {
			model.addAttribute("message", "알고리즘 카테고리를 선택해주세요.");
			model.addAttribute("algorithmQuestionVO", algorithmQuestionVO);
			return "company/algorithmquestion/questioncreate";
		}
		if (algorithmTierId == null || algorithmTierId.isEmpty()) {
			model.addAttribute("message", "난이도를 선택해주세요.");
			model.addAttribute("algorithmQuestionVO", algorithmQuestionVO);
			return "company/algorithmquestion/questioncreate";
		}
		
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
	public String doDeleteAlgorithmQuestion(@PathVariable String companyAlgorithmQuestionId
			                              , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		logger.debug("PathVariable: " + companyAlgorithmQuestionId);
		
        algorithmQuestionService.deleteOneAlgorithmQuestion(companyAlgorithmQuestionId);
		
        AlgorithmQuestionVO algorithmQuestionVO = algorithmQuestionService.getOneAlgorithmQuestion(companyAlgorithmQuestionId, false);
		
		if(!algorithmQuestionVO.getAlgorithmWriter().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		
		return "redirect:/algorithm/question/list";
	}
	
	
}

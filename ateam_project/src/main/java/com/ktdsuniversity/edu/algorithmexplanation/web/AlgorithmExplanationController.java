/**
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 알고리즘해설 게시판의 요청과 응답을 처리합니다.
 **/
package com.ktdsuniversity.edu.algorithmexplanation.web;

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

import com.ktdsuniversity.edu.algorithmexplanation.service.AlgorithmExplanationService;
import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationListVO;
import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationVO;
import com.ktdsuniversity.edu.algorithmexplanation.vo.SearchAlgorithmExplanationVO;
import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.util.XssIgnoreUtil;

import jakarta.validation.Valid;

@Controller
public class AlgorithmExplanationController {
	
	private Logger logger = LoggerFactory.getLogger(AlgorithmExplanationController.class);
	
	@Autowired
	private AlgorithmExplanationService algorithmExplanationService;

	@GetMapping("/algorithm/explanation/list")
	public String viewAlgorithmExplanationList(@ModelAttribute SearchAlgorithmExplanationVO searchAlgorithmExplanationVO
			                                 , Model model) {
		AlgorithmExplanationListVO algorithmExplanationListVO = algorithmExplanationService.getAllAlgorithmExplanation(searchAlgorithmExplanationVO);
		model.addAttribute("algorithmExplanationList", algorithmExplanationListVO);
		model.addAttribute("searchAlgorithmExplanationVO", searchAlgorithmExplanationVO);
		return "company/algorithmexplanation/explanationlist";
	}
	
	@GetMapping("/algorithm/explanation/view/{companyAlgorithmExplanationId}")
	public String viewOneAlgorithmExplanation (@PathVariable String companyAlgorithmExplanationId
			                                 , Model model) {
		AlgorithmExplanationVO algorithmExplanationVO = algorithmExplanationService.getOneAlgorithmExplanation(companyAlgorithmExplanationId, true);
		model.addAttribute("algorithmExplanationVO", algorithmExplanationVO);
		return "company/algorithmexplanation/explanationview";
	}
	
	@GetMapping("/algorithm/explanation/create")
	public String viewAlgorithmExplanationCreatePage() {
		return "company/algorithmexplanation/explanationcreate";
	}
	
	@PostMapping("/algorithm/explanation/create")
	public String doAlgorithmQuestionCreate(@Valid @ModelAttribute AlgorithmExplanationVO algorithmExplanationVO
			                              , BindingResult bindingResult
			                              , Model model
			                              , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		
		XssIgnoreUtil.ignore(algorithmExplanationVO);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("algorithmExplanationVO", algorithmExplanationVO);
			return "company/algorithmexplanation/explanationcreate";
		}
		
		algorithmExplanationVO.setPostWriter(memberVO.getEmail());
		
		boolean isSuccess = algorithmExplanationService.createNewAlgorithmExplanation(algorithmExplanationVO);
		if(isSuccess) {
			return "redirect:/algorithm/explanation/list";
		}
		else {
			model.addAttribute("algorithmExplanationVO", algorithmExplanationVO);
			return "company/algorithmexplanation/explanationcreate";
		}
	}
	
	@GetMapping("/algorithm/explanation/update/{companyAlgorithmExplanationId}")
	public String viewAlgorithmExplanationUpdatePage(@PathVariable String companyAlgorithmExplanationId
			                                       , Model model
			                                       , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		logger.debug("PathVariable: " + companyAlgorithmExplanationId);
		
		AlgorithmExplanationVO algorithmExplanationVO = algorithmExplanationService.getOneAlgorithmExplanation(companyAlgorithmExplanationId, false);
		
		if(!algorithmExplanationVO.getPostWriter().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		model.addAttribute("algorithmExplanationVO", algorithmExplanationVO);
		return "company/algorithmexplanation/explanationupdate";
	}
	
	@PostMapping("/algorithm/explanation/update")
	public String doAlgorithmExplanationUpdate(@ModelAttribute AlgorithmExplanationVO algorithmExplanationVO
			                                 , Model model
			                                 , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		XssIgnoreUtil.ignore(algorithmExplanationVO);
		
		logger.debug("Post ID: " + algorithmExplanationVO.getCompanyAlgorithmExplanationId());
		logger.debug("제목: " + algorithmExplanationVO.getPostTitle());
		logger.debug("내용: " + algorithmExplanationVO.getPostContent());
		
		AlgorithmExplanationVO originAlgorithmExplanationVO = algorithmExplanationService.getOneAlgorithmExplanation(algorithmExplanationVO.getCompanyAlgorithmExplanationId(), false);

		// 게시글 수정 url로도 접근 못하게
		if(!originAlgorithmExplanationVO.getPostWriter().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다!");
		}
		
		boolean isSuccess = algorithmExplanationService.updateOneAlgorithmExplanation(algorithmExplanationVO);
		if(isSuccess) {
			return "redirect:/algorithm/explanation/view/" + algorithmExplanationVO.getCompanyAlgorithmExplanationId();
		}
		else {
			model.addAttribute("algorithmExplanationVO", algorithmExplanationVO);
			return "company/algorithmexplanation/explanationupdate";
		}
	}
	
	@GetMapping("/algorithm/explanation/delete/{companyAlgorithmExplanationId}")
	public String doDeleteAlgorithmExplanation(@PathVariable String companyAlgorithmExplanationId
			                                 , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		logger.debug("PathVariable: " + companyAlgorithmExplanationId);
		
		algorithmExplanationService.deleteOneAlgorithmExplanation(companyAlgorithmExplanationId);
		
		AlgorithmExplanationVO algorithmExplanationVO = algorithmExplanationService.getOneAlgorithmExplanation(companyAlgorithmExplanationId, false);
		
		if(!algorithmExplanationVO.getPostWriter().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		
		return "redirect:/algorithm/explanation/list";
		
	}
}

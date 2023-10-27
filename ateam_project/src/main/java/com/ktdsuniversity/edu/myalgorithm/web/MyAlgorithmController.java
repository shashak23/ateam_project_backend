/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-19)
 * 작성일자: 2023-10-12
 * 내용: 내가 푼 알고리즘들을 조회하고 처리하는 컨트롤러 클래스입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.web;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.algorithmquestion.service.AlgorithmQuestionService;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.myalgorithm.service.MyAlgorithmService;
import com.ktdsuniversity.edu.myalgorithm.vo.AnswerResultVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmListVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;
import com.ktdsuniversity.edu.myalgorithm.vo.SearchMyAlgorithmVO;
import com.ktdsuniversity.edu.util.XssIgnoreUtil;

import jakarta.validation.Valid;

@Controller
public class MyAlgorithmController {

	private Logger logger = LoggerFactory.getLogger(MyAlgorithmController.class);
	
	@Autowired
	private MyAlgorithmService myAlgorithmService;

	@Autowired
	private AlgorithmQuestionService algorithmQuestionService;
	
	@GetMapping("/home/myalgorithm/list")
	public ModelAndView viewAllMyAlgorithm(@SessionAttribute("_LOGIN_USER_") MemberVO memberVO,
										   @ModelAttribute SearchMyAlgorithmVO searchMyAlgorithmVO) {
		System.out.println("search my keyword: " + searchMyAlgorithmVO.getSearchKeyword());
		System.out.println("search my type: " + searchMyAlgorithmVO.getSearchType());
		System.out.println("search my pageNo: " + searchMyAlgorithmVO.getPageNo());
		
		ModelAndView mav = new ModelAndView();
		searchMyAlgorithmVO.setEmail(memberVO.getEmail());
		
		MyAlgorithmListVO myList = myAlgorithmService.getAllMyAlgorithm(searchMyAlgorithmVO);
		System.out.println("myList: " + myList.getMyAlgotirhmListCnt());
		searchMyAlgorithmVO.setPageCount(myList.getMyAlgotirhmListCnt());
		
		mav.setViewName("myalgorithm/myalgorithmlist");
		mav.addObject("myAlgorithmList", myList);
		mav.addObject("MemberVO", memberVO);
		mav.addObject("searchMyAlgorithmVO", searchMyAlgorithmVO);
		return mav;
	}
	
	
	@PostMapping("/algorithm/question/view/{companyAlgorithmQuestionId}")
	public String createMyAlgorithm(@Valid @PathVariable String companyAlgorithmQuestionId 
			                      , @ModelAttribute MyAlgorithmVO myAlgorithmVO 
			                      , Model model
			                      , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		
		XssIgnoreUtil.ignore(myAlgorithmVO);
		
		myAlgorithmVO.setGeneralMemberEmail(memberVO.getEmail());
		myAlgorithmVO.setCompanyAlgorithmQuestionId(companyAlgorithmQuestionId);
		
		AnswerResultVO arVO = myAlgorithmService.createNewMyAlgorithm(myAlgorithmVO);
//		if(arVO.isInsertResult()) {
//			return "redirect:/algorithm/question/list";
//		}
//		else {
			AlgorithmQuestionVO algorithmQuestionVO = algorithmQuestionService.getOneAlgorithmQuestion(companyAlgorithmQuestionId, false);
			model.addAttribute("algorithmQuestionVO", algorithmQuestionVO);
			model.addAttribute("myAlgorithmVO", myAlgorithmVO);
			model.addAttribute("codeResultList", arVO.getCodeResultList());
			model.addAttribute("result", arVO.getMessage());
			model.addAttribute("companyAlgorithmQuestionId", companyAlgorithmQuestionId);
			
			return "company/algorithmquestion/questionview";
//		}
	}
	
	@GetMapping("/home/myalgorithm/delete/{myAlgorithmQuestionId}")
	public String doDeleteMyAlgorithm(@PathVariable String myAlgorithmQuestionId) {
		
		logger.debug("PathVariable: " + myAlgorithmQuestionId);
		
		myAlgorithmService.deleteMyAlgorithm(myAlgorithmQuestionId);
		
		return "redirect:/home/myalgorithm/list";
	}
	
	
}

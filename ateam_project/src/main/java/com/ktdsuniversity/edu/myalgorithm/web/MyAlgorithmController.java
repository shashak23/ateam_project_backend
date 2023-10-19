/**
 * 작성자: 김태현
 * 작성일자: 2023-10-12
 * 내용: 내가 푼 알고리즘들을 조회하고 처리하는 컨트롤러 클래스입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.algorithmquestion.service.AlgorithmQuestionService;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.myalgorithm.service.MyAlgorithmService;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmListVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;
import com.ktdsuniversity.edu.util.XssIgnoreUtil;

@Controller
public class MyAlgorithmController {
	@Autowired
	private MyAlgorithmService myAlgorithmService;

	@Autowired
	private AlgorithmQuestionService algorithmQuestionService;
	
	@GetMapping("home/my/algorithmlist")
	public ModelAndView viewAllMyAlgorithm(@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		ModelAndView mav = new ModelAndView();
		String email = memberVO.getEmail();
		System.out.println("email: " + email);
		MyAlgorithmListVO myList = myAlgorithmService.getAllMyAlgorithm(email);
		
		System.out.println(myList.getMyAlgotirhmListCnt());
		
		for (MyAlgorithmVO list : myList.getMyAlgorithmList()) {
			System.out.println("start!");
			System.out.println(list.getCompanyAlgorithmQuestionId());
			System.out.println(list.getAlgorithmQuestionVO().getAlgorithmTitle());
			System.out.println(list.getAlgorithmQuestionVO().getAlgorithmContent());
			System.out.println(list.getMemberVO().getNickname());
		}
		
		mav.setViewName("myalgorithm/myalgorithmlist");
		mav.addObject("myAlgorithmList", myList);
		mav.addObject("MemberVO", memberVO);
		return mav;
	}
	
	@PostMapping("/algorithm/question/view/{companyAlgorithmQuestionId}")
	public String createMyAlgorithm(@PathVariable String companyAlgorithmQuestionId 
			                      , @ModelAttribute MyAlgorithmVO myAlgorithmVO 
			                      , Model model
			                      , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		
		XssIgnoreUtil.ignore(myAlgorithmVO);
		
		myAlgorithmVO.setGeneralMemberEmail(memberVO.getEmail());
		myAlgorithmVO.setCompanyAlgorithmQuestionId(companyAlgorithmQuestionId);
		
		boolean isSuccess = myAlgorithmService.createNewMyAlgorithm(myAlgorithmVO);
		if(isSuccess) {
			// 정답여부 팝업창으로 보여주기
			return "redirect:/algorithm/question/list";
		}
		else {
			AlgorithmQuestionVO algorithmQuestionVO = algorithmQuestionService.getOneAlgorithmQuestion(companyAlgorithmQuestionId, false);
			model.addAttribute("AlgorithmQuestionVO", algorithmQuestionVO);
			model.addAttribute("MyAlgorithmVO", myAlgorithmVO);
			return "company/algorithmquestion/questionview";
		}
		
	}
}

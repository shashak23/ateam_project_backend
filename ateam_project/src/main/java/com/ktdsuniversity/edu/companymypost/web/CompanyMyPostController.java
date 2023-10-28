package com.ktdsuniversity.edu.companymypost.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.algorithmexplanation.service.AlgorithmExplanationService;
import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationListVO;
import com.ktdsuniversity.edu.algorithmquestion.service.AlgorithmQuestionService;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;
import com.ktdsuniversity.edu.common.vo.AbstractCompanyPostVO;
import com.ktdsuniversity.edu.companynews.service.CompanyNewsService;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsListVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Controller
public class CompanyMyPostController {

	@Autowired
	private AlgorithmExplanationService algorithmExplanationService;
	
	@Autowired
	private AlgorithmQuestionService algorithmQuestionService;
	
	@Autowired
	private CompanyNewsService companyNewsService;
	
	// 기업회원 내 게시글 조회
	@GetMapping("/companymypost")
	public String viewCompanyMyPost(@ModelAttribute AbstractCompanyPostVO abstractCompanyPostVO
			                      , Model model
			                      , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		abstractCompanyPostVO.setPostWriter(memberVO.getEmail());
		abstractCompanyPostVO.setAlgorithmWriter(memberVO.getEmail());
		
		AlgorithmExplanationListVO algorithmExplanationListVO = algorithmExplanationService.getCompanyMyPost(abstractCompanyPostVO);
		AlgorithmQuestionListVO algorithmQuestionListVO = algorithmQuestionService.getCompanyMyPost(abstractCompanyPostVO);
		CompanyNewsListVO companyNewsListVO = companyNewsService.getCompanyMyPost(abstractCompanyPostVO);
		
		model.addAttribute("companyNewsList", companyNewsListVO);
		model.addAttribute("algorithmQuestionList", algorithmQuestionListVO);
		model.addAttribute("algorithmExplanationList", algorithmExplanationListVO);
		return "mypage/companymypost";
	}
}

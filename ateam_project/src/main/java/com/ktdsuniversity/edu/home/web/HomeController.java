package com.ktdsuniversity.edu.home.web;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ktdsuniversity.edu.algorithmexplanation.service.AlgorithmExplanationService;
import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationListVO;
import com.ktdsuniversity.edu.algorithmquestion.service.AlgorithmQuestionService;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;
import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;
import com.ktdsuniversity.edu.companynews.service.CompanyNewsService;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsListVO;
import com.ktdsuniversity.edu.generalpost.service.GeneralPostService;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;
import com.ktdsuniversity.edu.member.service.MemberService;
import com.ktdsuniversity.edu.member.vo.MemberListVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Controller
public class HomeController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private GeneralPostService generalPostService;
	
	@Autowired
	private AlgorithmQuestionService algorithmQuestionService;
	
	@Autowired
	private AlgorithmExplanationService algorithmExplanationService;
	
	@Autowired
	private CompanyNewsService companyNewsService;
	
	@GetMapping("/home/home")
	public String homeLink() {
		return "home/home";
	}
	
	@GetMapping("/home/search")
	public String searchAllBoardList(@ModelAttribute AbstractSearchVO abstractSearchVO, Model model) {
		MemberListVO memberListVO = memberService.searchAllMemberByKeyword(abstractSearchVO);
		GeneralPostListVO generalPostListVO = generalPostService.searchAllBoardByKeyword(abstractSearchVO);
		AlgorithmQuestionListVO algorithmQuestionListVO = algorithmQuestionService.searchAllAlgorithmQuestionByKeyword(abstractSearchVO);
		AlgorithmExplanationListVO algorithmExplanationListVO = algorithmExplanationService.searchAllAlgorithmExplanationByKeyword(abstractSearchVO);
		CompanyNewsListVO companyNewsListVO = companyNewsService.searchAllCompanyNewsByKeyword(abstractSearchVO);
		
		List<MemberVO> generalMemberList = memberListVO.getMemberList();
		if (generalMemberList != null) {
			generalMemberList = generalMemberList.stream().filter(member -> member.getMemberType().equals("GENERAL")).collect(Collectors.toList());
		}
		List<MemberVO> companyMemberList = memberListVO.getMemberList();
		if (companyMemberList != null) {
			companyMemberList = companyMemberList.stream().filter(member -> member.getMemberType().equals("COMPANY")).collect(Collectors.toList());
		}
		model.addAttribute("generalMemberList", generalMemberList);
		model.addAttribute("companyMemberList", companyMemberList);
		model.addAttribute("generalPostList", generalPostListVO);
		model.addAttribute("algorithmQuestionList", algorithmQuestionListVO);
		model.addAttribute("algorithmExplanationList", algorithmExplanationListVO);
		model.addAttribute("companyNewsList", companyNewsListVO);
		model.addAttribute("abstractSearchVO", abstractSearchVO);
		return "home/homesearch";
	}
}

/**
 * 작성자: 김태현
 * 작성일: 2023-10-20
 * 내용: 메인화면을 출력하고 관련된 API를 가지는 클래스입니다.
 */
package com.ktdsuniversity.edu.home.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.algorithmanswer.service.AlgorithmAnswerService;
import com.ktdsuniversity.edu.algorithmexplanation.service.AlgorithmExplanationService;
import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationListVO;
import com.ktdsuniversity.edu.algorithmquestion.service.AlgorithmQuestionService;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;
import com.ktdsuniversity.edu.companynews.service.CompanyNewsService;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsListVO;
import com.ktdsuniversity.edu.generalpost.service.GeneralPostService;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.home.service.HomeBoardService;
import com.ktdsuniversity.edu.home.vo.HomeBoardVO;
import com.ktdsuniversity.edu.home.vo.HomeNickNameVO;
import com.ktdsuniversity.edu.home.vo.HomecommentCntVO;
import com.ktdsuniversity.edu.member.service.MemberService;
import com.ktdsuniversity.edu.member.vo.MemberListVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Controller
public class HomeController {

	@Autowired
	private HomeBoardService homeBoardService;
	
	@Autowired
	private GeneralPostService generalPostService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AlgorithmQuestionService algorithmQuestionService;
	
	@Autowired
	private AlgorithmExplanationService algorithmExplanationService;
	
	@Autowired
	private AlgorithmAnswerService algorithmAnswerService;
	
	@Autowired
	private CompanyNewsService companyNewsService;
	
	@GetMapping("/home/home")
	public String homeLink() {
		return "home/home";
	}
	
	@GetMapping("/home/admin")
	public String viewAdmin() {
		return "home/admin_ui";
	}
	
	@ResponseBody
	@GetMapping("/home/maincontent")
	public List<GeneralPostVO> getAllMainContents() {
		List<GeneralPostVO> generalList = homeBoardService.getAllGeneralPost();
		
		return generalList;
	}
	
	@ResponseBody
	@GetMapping("home/maincontent/commentcnt")
	public List<HomecommentCntVO> getAllGeneralCommentCnt() {
		return homeBoardService.getAllGeneralCommentCnt();
	}
	@ResponseBody
	@GetMapping("/home/maincontent/nickname")
	public List<HomeNickNameVO> getNicknameList() {
		return homeBoardService.getNicknameList();
	}
	
	@ResponseBody
	@GetMapping("/home/ranking/{date}")
	public Map<String, Object> getWeeklyRanking(@PathVariable String date) {
		System.out.println("랭킹을 가져옵니다. 날짜:" + date);
		Map<String, Object> resultMap = new HashMap<>();
		List<GeneralPostVO> RankingList = new ArrayList<>();
		RankingList.addAll(homeBoardService.getWeeklyRanking(date));
		resultMap.put("rankings", RankingList);
		return resultMap;
	}
	
	@ResponseBody
	@GetMapping("/home/hashtag/{postId}")
	public List<HomeBoardVO> getPostHashtag(@PathVariable String postId) {
//		List<HomeBoardVO> hashtagList = new ArrayList<>();
//		hashtagList.addAll(homeBoardService.getHashtag(postId));
		
		return homeBoardService.getHashtag(postId);
	}
	
	@ResponseBody
	@PostMapping("/home/qnapost")
		
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
		List<GeneralPostVO> qnaPostList = generalPostListVO.getGeneralPostList();
		if (qnaPostList != null) {
			qnaPostList = qnaPostList.stream().filter(boardId -> boardId.getBoardId().equals("CC-20231017-000030")).collect(Collectors.toList());
		}
		List<GeneralPostVO> freePostList = generalPostListVO.getGeneralPostList();
		if (freePostList != null) {
			freePostList = freePostList.stream().filter(boardId -> boardId.getBoardId().equals("CC-20231017-000029")).collect(Collectors.toList());
		}
		model.addAttribute("generalMemberList", generalMemberList);
		model.addAttribute("companyMemberList", companyMemberList);
		model.addAttribute("qnaPostList", qnaPostList);
		model.addAttribute("freePostList", freePostList);
		model.addAttribute("algorithmQuestionList", algorithmQuestionListVO);
		model.addAttribute("algorithmExplanationList", algorithmExplanationListVO);
		model.addAttribute("companyNewsList", companyNewsListVO);
		model.addAttribute("abstractSearchVO", abstractSearchVO);
		return "home/homesearch";
	}
	
	
	@GetMapping("/algorithmmain/main")
	public String algorithmmain() {
		return "/algorithmmain/main";
	}
	
}

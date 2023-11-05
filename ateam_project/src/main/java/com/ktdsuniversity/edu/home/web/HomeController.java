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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.admin.service.ReportService;
import com.ktdsuniversity.edu.admin.vo.ReportListVO;
import com.ktdsuniversity.edu.admin.vo.ReportVO;
import com.ktdsuniversity.edu.algorithmexplanation.service.AlgorithmExplanationService;
import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationListVO;
import com.ktdsuniversity.edu.algorithmquestion.service.AlgorithmQuestionService;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionListVO;
import com.ktdsuniversity.edu.beans.FileHandler;
import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;
import com.ktdsuniversity.edu.companyinfo.service.CompanyInfoService;
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
import com.ktdsuniversity.edu.notice.service.NoticeService;
import com.ktdsuniversity.edu.notice.vo.NoticeVO;
import com.ktdsuniversity.edu.util.XssIgnoreUtil;

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
	private CompanyNewsService companyNewsService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private CompanyInfoService companyInfoService;
	
	@Autowired
	private ReportService reportService;
	
	@Autowired
	private FileHandler fileHandler;
	
	@GetMapping("/devground/home")
	public String homeLink() {
		return "home/home";
	}

	@GetMapping("/home/admin")
	public String viewAdmin() {
		return "home/admin_ui(ongoing)";
	}
	
	@ResponseBody
	@GetMapping("/admin/reportlist")
	public List<ReportVO> getAllReport() {
		ReportListVO reportListVO = reportService.getAllReport();
		return reportListVO.getReportList();
	}
	
	@PostMapping("/devground/home")
	public ModelAndView doCreateNoticeAdmin(@ModelAttribute NoticeVO noticeVO,
								  @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		XssIgnoreUtil.ignore(noticeVO);
		
		ModelAndView mav = new ModelAndView();
		noticeVO.setPostWriter(memberVO.getEmail());
		boolean isSuccess = noticeService.createNotice(noticeVO);
		
		if (isSuccess) {
			mav.setViewName("redirect:/devground/home");
			return mav;
		}
		else {
			mav.addObject("noticeVO", noticeVO);
			mav.setViewName("home/admin_ui(ongoing)");
			return mav;
		}
	}
	
	
//	@PostMapping("/home/admin")
//	public ModelAndView doCreateNoticeAdmin(@ModelAttribute NoticeVO noticeVO,
//								  @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
//		XssIgnoreUtil.ignore(noticeVO);
//		
//		ModelAndView mav = new ModelAndView();
//		noticeVO.setPostWriter(memberVO.getEmail());
//		boolean isSuccess = noticeService.createNotice(noticeVO);
//		
//		if (isSuccess) {
//			mav.setViewName("redirect:/home/admin");
//			return mav;
//		}
//		else {
//			mav.addObject("noticeVO", noticeVO);
//			mav.setViewName("home/admin_ui");
//			return mav;
//		}
//	}
	
	@ResponseBody
	@GetMapping("/home/maincontent")
	public List<GeneralPostVO> getAllMainContents() {
		List<GeneralPostVO> generalList = homeBoardService.getAllGeneralPost();
		
		return generalList;
	}
	
	@ResponseBody
	@GetMapping("/home/maincontent/commentcnt")
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
		Map<String, Object> resultMap = new HashMap<>();
		List<GeneralPostVO> RankingList = new ArrayList<>();
		RankingList.addAll(homeBoardService.getWeeklyRanking(date));
		resultMap.put("rankings", RankingList);
		return resultMap;
	}
	
	// 일반 회원 목록들을 가져오는 API
	@ResponseBody
	@GetMapping("/home/admin/person")
	public List<MemberVO> getAllGeneralTypeMember() {
		return memberService.searchGemeralTypeMemberList();
	}
	
	// 일반, 기업 회원 탈퇴 처리 API
	@ResponseBody
	@GetMapping("/home/admin/person/delete/{email}")
	public  Map<String, Object> deleteGeneralTypeMember(@PathVariable String email) {
		Map<String, Object> resultSet = new HashMap<>();
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail(email);
		
		boolean isSuccess = memberService.withdrawMember(memberVO);
		
		if (isSuccess) {
			resultSet.put("result", "success");
			return resultSet;
		}
		else {
			resultSet.put("result", "fail");
			return resultSet;
		}
	}
	
	// 기업 회원 목록을 가져오는 API
	@ResponseBody
	@GetMapping("/home/admin/company")
	public List<MemberVO> getAllCompanyTypeMember() {
		return memberService.searchCompanyTypeMemberList();
	}
	
	@ResponseBody
	@GetMapping("/home/hashtag/{postId}")
	public List<HomeBoardVO> getPostHashtag(@PathVariable String postId) {
//		List<HomeBoardVO> hashtagList = new ArrayList<>();
//		hashtagList.addAll(homeBoardService.getHashtag(postId));
		
		return homeBoardService.getHashtag(postId);
	}
	
	// 자유 게시글 작성
	@ResponseBody
	@PostMapping("/home/create/freeboard")
	public Map<String, Object> createOneFreeboard(@ModelAttribute GeneralPostVO generalPostVO) {
		XssIgnoreUtil.ignore(generalPostVO);
		
		System.out.println("1. " + generalPostVO.getPostWriter());
		System.out.println("2. " + generalPostVO.getPostTitle());
		System.out.println("3. " + generalPostVO.getPostContent());
		
		Map<String, Object> resultSet = new HashMap<>();
		boolean isSuccess = homeBoardService.freeboardCreateByMain(generalPostVO);
		
		if (isSuccess) {
			resultSet.put("result", "success");
			return resultSet;
		}
		else {
			resultSet.put("result", "fail");
			return resultSet;
		}
	}
	
	// 질답 게시글 작성
	@ResponseBody
	@PostMapping("/home/create/qnaboard")
	public Map<String, Object> createOneQnaboard(@ModelAttribute GeneralPostVO generalPostVO) {
		XssIgnoreUtil.ignore(generalPostVO);
		
		Map<String, Object> resultSet = new HashMap<>();
		boolean isSuccess = homeBoardService.qnaboardCreateByMain(generalPostVO);
		
		if (isSuccess) {
			resultSet.put("result", "success");
			return resultSet;
		}
		else {
			resultSet.put("result", "fail");
			return resultSet;
		}
	}
	
	// 신고 상세 조회
	@ResponseBody
	@GetMapping("/admin/report/view/{reportId}")
	public ReportVO getOneReport(@PathVariable String reportId) {
		return reportService.getSingleReport(reportId);
	}
	
	// 신고 완료 처리
	@ResponseBody
	@GetMapping("/admin/report/progress/{reportId}")
	public Map<String, Object> doCompleteReportProgress(@PathVariable String reportId) {
		Map<String, Object> resultSet = new HashMap<>();
		
		boolean isSuccess = reportService.doCompleteProgressYn(reportId);
		
		if (isSuccess) {
			resultSet.put("result", "success");
			return resultSet;
		}
		else {			
			resultSet.put("result", "fail");
			return resultSet;
		}
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
		return "home/homesearchresult";
	}
	
	
	@GetMapping("/algorithmmain/main")
	public String algorithmmain() {
		return "/algorithmmain/main";
	}
	
//	@GetMapping("/file/download/${email}")
//	public ResponseEntity<Resource> downloadFile(@PathVariable String email) {
//		CompanyVO companyVO = companyInfoService.getOneCompanyInfo(email);
//		if (companyVO == null) {
//			throw new PageNotFoundException("잘못된 접근입니다.");
//		}
//		
//		File storedFile = fileHandler.getStoredFile(companyVO.getCompanyRegistCertificateUrl());
//	}
	
}

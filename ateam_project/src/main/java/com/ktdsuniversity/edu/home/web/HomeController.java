/**
 * 작성자: 김태현
 * 작성일: 2023-10-20
 * 내용: 메인화면을 출력하고 관련된 API를 가지는 클래스입니다.
 */
package com.ktdsuniversity.edu.home.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.admin.service.ReportService;
import com.ktdsuniversity.edu.admin.service.TierService;
import com.ktdsuniversity.edu.admin.vo.AdminTierVO;
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
import com.ktdsuniversity.edu.exceptions.FileNotExistsException;
import com.ktdsuniversity.edu.exceptions.MakeXlsxFileException;
import com.ktdsuniversity.edu.generalmember.service.GeneralMemberService;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
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
import com.ktdsuniversity.edu.tier.TierVO;
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
	private TierService tierService;
	
	@Autowired
	private GeneralMemberService generalMemberService;

	@Autowired
	private FileHandler fileHandler;
	
	private Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
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
	@GetMapping("/home/maincontent/{skip}")
	public List<GeneralPostVO> getAllMainContents(@PathVariable int skip) {
		logger.debug("스킵이야" + skip);
		List<GeneralPostVO> generalList = homeBoardService.getAllGeneralPost(skip);
		
		return generalList;
	}
	
	/**
	 * 메인 화면 게시글 조회
	 * @return 질답 게시글, 자유 게시글
	 */
	@ResponseBody
	@GetMapping("/home/maincontent/commentcnt/{generalPostId}")
	public HomecommentCntVO getAllGeneralCommentCnt(@PathVariable String generalPostId) {
		return homeBoardService.getAllGeneralCommentCnt(generalPostId);
	}
	
	/**
	 * 게시글 작성자 조회
	 * @return 게시글 작성자의 닉네임
	 */
	@ResponseBody
	@GetMapping("/home/maincontent/nickname/{generalPostId}")
	public HomeNickNameVO getNicknameList(@PathVariable String generalPostId) {
		return homeBoardService.getNicknameList(generalPostId);
	}
	
	/**
	 * 매주 월요일 기준 일주일 간의 조회수가 많은 순서로 정렬된 게시글 조회
	 * @param date 매주 월요일의 날짜
	 * @return 일주일 간에 조회수 top 10 게시글
	 */
	@ResponseBody
	@GetMapping("/home/ranking/{date}")
	public Map<String, Object> getWeeklyRanking(@PathVariable String date) {
		Map<String, Object> resultMap = new HashMap<>();
		List<GeneralPostVO> RankingList = new ArrayList<>();
		RankingList.addAll(homeBoardService.getWeeklyRanking(date));
		resultMap.put("rankings", RankingList);
		return resultMap;
	}
	
	@ResponseBody
	@GetMapping("/qna/ranking/{date}")
	public Map<String, Object> getWeeklyRankingInFreeBoard(@PathVariable String date) {
		Map<String, Object> resultMap = new HashMap<>();
		List<GeneralPostVO> RankingList = new ArrayList<>();
		RankingList.addAll(homeBoardService.getWeeklyRankingInQnaBoard(date));
		resultMap.put("rankings", RankingList);
		return resultMap;
	}
	
	@ResponseBody
	@GetMapping("/home/profilepic/{email}")
	public MemberVO getMemberProfilePic(@PathVariable String email) {
		return homeBoardService.getMemberProfilePic(email);
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
	public Map<String, Object> createOneQnaboard(@RequestBody GeneralPostVO generalPostVO) {
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
	
	// 회원 티어 조회
	@ResponseBody
	@GetMapping("/admin/member/tier/{email}")
	public TierVO getMemberTier(@PathVariable String email) {
		TierVO adminTierList = tierService.getMemberAndTier(email);
		
		return adminTierList;
	}
	
	// 회원 티어 관리 명단 호출
	@ResponseBody
	@GetMapping("/admin/management/tier")
	public List<AdminTierVO> getMemberTierManagement() {
		return tierService.getTierMemberAllList().getAdminTierList();
	}
	
	// 티어 승급 처리
	@ResponseBody
	@PostMapping("/admin/management/tier/upgrade")
	public Map<String, Object> accessMemberTierUpgrade(@RequestParam String memberEmail,
													   @RequestParam String tierId) {
		Map<String, Object> resultSet = new HashMap<>();
		GeneralMemberVO generalMemberVO = new GeneralMemberVO();
		generalMemberVO.setGeneralMemberEmail(memberEmail);
		generalMemberVO.setTierId(tierId);
		boolean isSuccess = tierService.doUpdateTierMember(generalMemberVO);
		
		if (isSuccess) {
			resultSet.put("result", "success");
			return resultSet;
		}
		else {
			resultSet.put("result", "fail");
			return resultSet;
		}
	}
	
	// 티어 승급 활동 내역 조회
	@ResponseBody
	@GetMapping("admin/management/tier/log/{memberEmail}")
	public List<Map<String, Object>> getMemberActivityLog(@PathVariable String memberEmail) {
		return generalMemberService.getSelectMemberActivityLog(memberEmail);
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
	
	@GetMapping("/generalmember/excel/download")
	public ResponseEntity<Resource> downloadGeneralMemberExcelFile() {
		List<MemberVO> generalMemberList = new ArrayList<>();
		generalMemberList = memberService.exportGeneralMember();
		
		Workbook workbook = new SXSSFWorkbook(-1);
		Sheet sheet = workbook.createSheet("일반 회원 목록");
		Row row = sheet.createRow(0);
		
		Cell cell = row.createCell(0);
		cell.setCellValue("번호");
		cell = row.createCell(1);
		cell.setCellValue("닉네임");
		cell = row.createCell(2);
		cell.setCellValue("이메일");
		cell = row.createCell(3);
		cell.setCellValue("티어");
		cell = row.createCell(4);
		cell.setCellValue("티어점수");
		cell = row.createCell(5);
		cell.setCellValue("자기소개");
		cell = row.createCell(6);
		cell.setCellValue("직무");
		cell = row.createCell(7);
		cell.setCellValue("지역");
		cell = row.createCell(8);
		cell.setCellValue("깃허브");
		cell = row.createCell(9);
		cell.setCellValue("추가이메일");
		cell = row.createCell(10);
		cell.setCellValue("블로그");
		cell = row.createCell(11);
		cell.setCellValue("가입일");
		
		int rowIndex = 1;
		
		for (MemberVO member : generalMemberList) {
			row = sheet.createRow(rowIndex);
			cell = row.createCell(0);
			cell.setCellValue(rowIndex);
			cell = row.createCell(1);
			cell.setCellValue(member.getNickname());
			cell = row.createCell(2);
			cell.setCellValue(member.getEmail());
			cell = row.createCell(3);
			cell.setCellValue(member.getGeneralMemberVO().getTierVO().getTierName());
			cell = row.createCell(4);
			cell.setCellValue(member.getGeneralMemberVO().getTierScore());
			cell = row.createCell(5);
			cell.setCellValue(member.getGeneralMemberVO().getSelfIntro());
			cell = row.createCell(6);
			cell.setCellValue(member.getGeneralMemberVO().getJobId());
			cell = row.createCell(7);
			cell.setCellValue(member.getGeneralMemberVO().getRegion());
			cell = row.createCell(8);
			cell.setCellValue(member.getGeneralMemberVO().getGithubUrl());
			cell = row.createCell(9);
			cell.setCellValue(member.getGeneralMemberVO().getAdditionalEmail());
			cell = row.createCell(10);
			cell.setCellValue(member.getGeneralMemberVO().getBlogUrl());
			cell = row.createCell(11);
			cell.setCellValue(member.getGeneralMemberVO().getRegistDate());
			
			rowIndex++;
		}
		
		File storedFile = fileHandler.getStoredFile("일반회원목록.xlsx");
		OutputStream os = null;
		
		try {
			os = new FileOutputStream(storedFile);
			workbook.write(os);
		} catch (IOException e) {
			throw new MakeXlsxFileException("엓겔 파일을 만들 수 없습니다.");
		} finally {
			try {
				workbook.close();
			} catch (IOException e) {}
			
			if (os != null) {
				try {
					os.flush();
				} catch (IOException e) {}
				try {
					os.close();
				} catch (IOException e) {}
			}
		}
		
		String downloadFileName = URLEncoder.encode("일반회원목록.xlsx", Charset.defaultCharset());
		HttpHeaders header = new HttpHeaders();
		header.setContentType(new MediaType("application", "force-download"));
		header.setContentLength(storedFile.length());
		header.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + downloadFileName);
		
		InputStreamResource resource;
		
		try {
			resource = new InputStreamResource(new FileInputStream(storedFile));
		} catch (FileNotFoundException e) {
			throw new FileNotExistsException("파일이 존재하지 않습니다.");
		}
		
		
		return ResponseEntity.ok()
				.headers(header)
				.body(resource);
	}
	
}

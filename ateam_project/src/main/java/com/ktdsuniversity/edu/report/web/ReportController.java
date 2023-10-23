package com.ktdsuniversity.edu.report.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.report.service.ReportService;
import com.ktdsuniversity.edu.report.vo.ReportVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	private Logger log = LoggerFactory.getLogger(FreePostController.class);

	
	// 게시글 신고 화면 보이기
	@GetMapping("/report/reportview")
	public String createReport() {
		return "report/reportview";
	}
	
	// 게시글 신고하기 (등록)
	@PostMapping("/report/view")
	public ModelAndView createReport(@Valid @ModelAttribute ReportVO reportVO
									   , BindingResult bindingResult 
							           , HttpServletRequest request
							           , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		log.debug("--1--컨트롤러----------------------------------------");
		//System.out.println("신고고유번호: " + reportVO.getReportId());
		ModelAndView view = new ModelAndView();
		reportVO.setReportMember(memberVO.getEmail());
	
//		String reportTypeId = request.getParameter("reportTypeId");
		String reportTypeId = reportVO.getReportTypeId();
		 /**
		  * reportTypeId = 신고 유형 받아오기
		  * 1유형: CC-20231018-000097 (자유게시판 게시글)
		  * 2유형: CC-20231018-000102 (자유게시판 댓글)
		  * 3유형: CC-20231018-000101 (질답게시판 게시글)
		  * 4유형: CC-20231018-000103 (질답게시판 댓글)
		  */
		if (reportTypeId != null) {
		    if (reportTypeId.equals("1")) {
		        reportVO.setReportTypeId("CC-20231018-000097");
		    } else if (reportTypeId.equals("2")) {
		        reportVO.setReportTypeId("CC-20231018-000102");
		    } else if (reportTypeId.equals("3")) {
		        reportVO.setReportTypeId("CC-20231018-000101");
		    } else {
		        reportVO.setReportTypeId("CC-20231018-000103");
		    }
		} else {
		    reportVO.setReportTypeId("CC-20231018-000103");
		}
		log.debug("신고 유형 구분: " + reportTypeId);
		log.debug("신고자: " + reportVO.getReportMember());
		
		boolean isSuccess = reportService.createReport(reportVO);
		if(isSuccess) {
			view.setViewName("redirect:/qnaboard/list");
		} else {
			view.addObject("reportVO", reportVO);
			view.setViewName("report/reportview");
		}
		
		return view;
	}
}

package com.ktdsuniversity.edu.admin.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.admin.service.ReportService;
import com.ktdsuniversity.edu.admin.vo.ReportVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralCommentVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import com.ktdsuniversity.edu.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
public class UserReportController {

	@Autowired
	private ReportService reportService;
	
	private Logger log = LoggerFactory.getLogger(FreePostController.class);

	// 게시글 신고하기 (등록)
	@PostMapping("/report/view/{reportTypeId}")
	public ModelAndView createReport(@Valid @ModelAttribute ReportVO reportVO
									   , BindingResult bindingResult 
							           , HttpServletRequest request
							           , Model model
							           , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO
							           , @PathVariable String reportTypeId
							           , @RequestParam(required = false) GeneralCommentVO generalCommentVO) {
		log.debug("--1--컨트롤러-도착-------------------------------------");
		ModelAndView view = new ModelAndView();
		reportVO.setReportMember(memberVO.getEmail());
		
		if (bindingResult.hasErrors()) {
			view.addObject("reportVO", reportVO);
			view.setViewName("home/home");
			return view;
		}
		
		 /**
		  * reportTypeId = 신고 유형 받아오기
		  * 1유형: CC-20231018-000097 (자유게시판 게시글)
		  * 2유형: CC-20231018-000102 (자유게시판 댓글)
		  * 3유형: CC-20231018-000101 (질답게시판 게시글)
		  * 4유형: CC-20231018-000103 (질답게시판 댓글)
		  * 5유형: CC-20231018-000104 (유저 != 유저)
		  */
		if (reportTypeId != null) {
		    if (reportTypeId.equals("1")) {
		        reportVO.setReportTypeId("CC-20231018-000097");
		    } else if (reportTypeId.equals("2")) {
		        reportVO.setReportTypeId("CC-20231018-000102");
		    } else if (reportTypeId.equals("3")) {
		        reportVO.setReportTypeId("CC-20231018-000101");
		    } else if (reportTypeId.equals("4")) {
		    	reportVO.setReportTypeId("CC-20231018-000103");
		    } else {
		    	reportVO.setReportTypeId("CC-20231018-000104");
		    }
		} else {
		    reportVO.setReportTypeId("CC-20231018-000104");
		}
		log.debug("신고 유형 구분: " + reportTypeId);
		log.debug("신고자: " + reportVO.getReportMember());
		log.debug("신고 받은 사람: " + reportVO.getReceivedReportMember());
		
		boolean isSuccess = reportService.createReport(reportVO);
		if(isSuccess) {
			view.setViewName("redirect:/devground/home");
		} else {
			view.addObject("reportVO", reportVO);
			view.setViewName("report/reporthistoryview");
		}
		
		return view;
	}
	
	
}

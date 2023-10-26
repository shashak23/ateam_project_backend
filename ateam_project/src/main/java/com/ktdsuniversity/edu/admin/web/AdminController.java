<<<<<<< HEAD
package com.ktdsuniversity.edu.admin.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktdsuniversity.edu.admin.service.MailService;
import com.ktdsuniversity.edu.admin.service.ReportService;
import com.ktdsuniversity.edu.admin.vo.ReportListVO;

@Controller
public class AdminController {

	@Autowired
	private ReportService reportService;
	
	@Autowired
	private MailService mailService;

	@GetMapping("/report/list")
	public String viewReportHistory(Model model) {
		ReportListVO reportListVO = reportService.getAllReport();
		
		model.addAttribute("reportListVO", reportListVO);
		return "report/reporthistory";
	}
	
	@PostMapping("/report/list")
	@ResponseBody
	public ReportListVO viewSelectReportType(@RequestBody String selectedValue) {
//		System.out.println(selectedValue + "======================================================================================");
//		System.out.println(selectedValue.getClass() + "======================================================================================");
		if (selectedValue.equals("all")) {
			ReportListVO reportListVO = reportService.getAllReport();
			return reportListVO;
		}
		
		else if (selectedValue.equals("freeboard")) {
			ReportListVO reportListVO = reportService.getFreeBoardReportList();
			return reportListVO;
		}
		else if (selectedValue.equals("freecomment")) {
			ReportListVO reportListVO = reportService.getFreeBoardCommentReportList();
			return reportListVO;
		}
		else if (selectedValue.equals("qnaboard")) {
			ReportListVO reportListVO = reportService.getQnaBoardReportList();
			return reportListVO;
		}
		else if (selectedValue.equals("qnacomment")) {
			ReportListVO reportListVO = reportService.getQnaBoardCommentReportList();
			return reportListVO;
		}
		else if (selectedValue.equals("generalmember")) {
			ReportListVO reportListVO = reportService.getMemberReportList();
			return reportListVO;
		}
		else {
			return null;
		}
	}
	
	@GetMapping("/admin/member")
	public String memberApproval() {
		return "temp/mail";
	}
	
	// ajax 통신할거면 반드시! map -> json으로 보낸다
=======
//package com.ktdsuniversity.edu.admin.web;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.ktdsuniversity.edu.admin.service.ReportService;
//import com.ktdsuniversity.edu.admin.service.MailService;
//import com.ktdsuniversity.edu.admin.vo.ReportListVO;
//
//@Controller
//public class AdminController {
//
//	@Autowired
//	private ReportService reportService;
//	
//	@Autowired
//	private MailService mailService;
//
//	@GetMapping("/report/list")
//	public String viewReportHistory(Model model) {
//		ReportListVO reportListVO = reportService.getAllReport();
//		
//		model.addAttribute("reportListVO", reportListVO);
//		return "report/reporthistory";
//	}
//	
//	@PostMapping("/report/list")
>>>>>>> 16f6c25252bc135964c1988dd0df2456536db0ed
//	@ResponseBody
//	public ReportListVO viewSelectReportType(@RequestBody String selectedValue) {
////		System.out.println(selectedValue + "======================================================================================");
////		System.out.println(selectedValue.getClass() + "======================================================================================");
//		if (selectedValue.equals("all")) {
//			ReportListVO reportListVO = reportService.getAllReport();
//			return reportListVO;
//		}
//		
//		else if (selectedValue.equals("freeboard")) {
//			ReportListVO reportListVO = reportService.getFreeBoardReportList();
//			return reportListVO;
//		}
//		else if (selectedValue.equals("freecomment")) {
//			ReportListVO reportListVO = reportService.getFreeBoardCommentReportList();
//			return reportListVO;
//		}
//		else if (selectedValue.equals("qnaboard")) {
//			ReportListVO reportListVO = reportService.getQnaBoardReportList();
//			return reportListVO;
//		}
//		else if (selectedValue.equals("qnacomment")) {
//			ReportListVO reportListVO = reportService.getQnaBoardCommentReportList();
//			return reportListVO;
//		}
//		else if (selectedValue.equals("generalmember")) {
//			ReportListVO reportListVO = reportService.getMemberReportList();
//			return reportListVO;
//		}
//		else {
//			return null;
//		}
//	}
//	
//	@GetMapping("/admin/member")
//	public String memberApproval() {
//		return "temp/mail";
//	}
//	
//	// ajax 통신할거면 반드시! map -> json으로 보낸다
////	@ResponseBody
//	@PostMapping("/admin/member")
//	public String sendMemberApproval(@RequestParam String val) {
////		Map<String, Object> resultMap = new HashMap<>();
//////		String test = "ok";
////		resultMap.put("data", val);
//////		resultMap.put("result", test.equals(val));
////		System.out.println(val);
////		return resultMap;
//		if (val.equals("accept")) {
//			mailService.sendMail();
//		}
//		else if (val.equals("refuse")) {
//			mailService.sendMail();
//		}
//
//		return "redirect:/home/main";
//	}
//	
//	@GetMapping("/report/{reportId}")
//	public String viewOneReport(@PathVariable String reportId
//								, Model model) {
//		return "report/reportview";
//	}
//	
//}

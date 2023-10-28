package com.ktdsuniversity.edu.admin.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.admin.service.MailService;
import com.ktdsuniversity.edu.admin.service.ReportService;
import com.ktdsuniversity.edu.admin.vo.ReportListVO;
import com.ktdsuniversity.edu.admin.vo.ReportVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;

@Controller
public class AdminController {

	@Autowired
	private ReportService reportService;
	
	@Autowired
	private MailService mailService;

//	@ResponseBody
//	@GetMapping("/report/list")
//	public Map<String, Object> viewReportHistory(Model model) {
//		Map<String, Object> resultMap = new HashMap<>();
//		ReportListVO reportListVO = reportService.getAllReport();
//		resultMap.put("result", reportListVO);
////		System.out.println(reportListVO.getReportList().get(0));
////		model.addAttribute("reportListVO", reportListVO);
////		return "report/reporthistory";
//		return resultMap;
//	}
	
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
			reportListVO.setCategory(selectedValue);
			return reportListVO;
		}
		
		else if (selectedValue.equals("freeboard")) {
			ReportListVO reportListVO = reportService.getFreeBoardReportList();
			reportListVO.setCategory(selectedValue);
			return reportListVO;
		}
		else if (selectedValue.equals("freecomment")) {
			ReportListVO reportListVO = reportService.getFreeBoardCommentReportList();
			reportListVO.setCategory(selectedValue);
			return reportListVO;
		}
		else if (selectedValue.equals("qnaboard")) {
			ReportListVO reportListVO = reportService.getQnaBoardReportList();
			reportListVO.setCategory(selectedValue);
			return reportListVO;
		}
		else if (selectedValue.equals("qnacomment")) {
			ReportListVO reportListVO = reportService.getQnaBoardCommentReportList();
			reportListVO.setCategory(selectedValue);
			return reportListVO;
		}
		else if (selectedValue.equals("generalmember")) {
			ReportListVO reportListVO = reportService.getMemberReportList();
			reportListVO.setCategory(selectedValue);
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

// 	ajax 통신할거면 반드시! map -> json으로 보낸다
	@ResponseBody
	@PostMapping("/admin/member")
	public String sendMemberApproval(@RequestParam String val) {
//		Map<String, Object> resultMap = new HashMap<>();
//		String test = "ok";
//		resultMap.put("data", val);
//		resultMap.put("result", test.equals(val));
//		return resultMap;
	
		if (val.equals("accept")) {
			mailService.sendMail();
		}
		else if (val.equals("refuse")) {
			mailService.sendMail();
		}
		
		return "redirect:/home/main";
	}
	
	@GetMapping("/report/view/{reportId}")
	public String viewOneReport(@PathVariable String reportId,
								Model model) {
		ReportVO reportVO = reportService.getSingleReport(reportId);
		model.addAttribute("reportVO", reportVO);
		return "report/reporthistoryview";
	}
	
	
//	@GetMapping("/report/reportview")
//	public String reportViewTest() {
//		return "report/reporthistoryview";
//	}
	
//	@GetMapping("/editor")
//	public String editor() {
//		return "temp/editor";
//	}
}

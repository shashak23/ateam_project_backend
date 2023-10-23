package com.ktdsuniversity.edu.report.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktdsuniversity.edu.report.service.ReportService;
import com.ktdsuniversity.edu.report.vo.ReportListVO;

@Controller
public class AdminReportController {
	
	@Autowired
	private ReportService reportService;

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
	
	@GetMapping("/report/{reportId}")
	public String viewOneReport(@PathVariable String reportId
								, Model model) {
		return "report/reportview";
	}
	
}

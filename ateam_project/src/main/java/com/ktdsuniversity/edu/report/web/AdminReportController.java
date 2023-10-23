package com.ktdsuniversity.edu.report.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

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
	
	@GetMapping("/report/{reportId}")
	public String viewOneReport(@PathVariable String reportId
								, Model model) {
		return "report/reportview";
	}
}

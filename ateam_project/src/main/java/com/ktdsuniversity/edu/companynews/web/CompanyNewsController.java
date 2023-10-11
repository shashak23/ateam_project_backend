package com.ktdsuniversity.edu.companynews.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.companynews.service.CompanyNewsService;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsListVO;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsVO;

@Controller
public class CompanyNewsController {
	
	@Autowired
	private CompanyNewsService companyNewsService;

	@GetMapping("/news/view/{companyNewsPostId}") 
	public String viewOneCompanyNews(@PathVariable String companyNewsPostId
			                       , Model model) {
		CompanyNewsVO companyNewsVO = companyNewsService
				                     .getOneNews(companyNewsPostId, true);
		model.addAttribute("companyNewsVO", companyNewsVO);
		return "company/news/newsview";
	}
	
	@GetMapping("/news/list")
	public String viewCompanyNewsList(Model model) {
		CompanyNewsListVO companyNewsListVO = companyNewsService.getAllCompanyNews();
		
		model.addAttribute("companyNewsList", companyNewsListVO);
		return "company/news/newslist";
	}
	
	@GetMapping("/news/create")
	public String viewCompanyNewsCreatePage() {
		return "company/news/newscreate";
	}
	
	@PostMapping("/news/create")
	public String doCompanyNewsCreate(@ModelAttribute CompanyNewsVO companyNewsVO
			                        , Model model) {
		
		boolean isSuccess = companyNewsService.createNewCompanyNews(companyNewsVO);
		if(isSuccess) {
			return "redirect:/news/list";
		}
		else {
			model.addAttribute("companyNewsVO", companyNewsVO);
			return "company/news/newscreate";
		}
	}
	
	@GetMapping("/news/update/{companyNewsPostId}")
	public String viewCompanyNewsUpdatePage(@PathVariable String companyNewsPostId
			                              , Model model) {
		System.out.println("PathVariable: " + companyNewsPostId);
		
		CompanyNewsVO companyNewsVO = companyNewsService.getOneNews(companyNewsPostId, false);
		model.addAttribute("companyNewsVO", companyNewsVO);
		return "company/news/newsupdate";
	}
	
	@PostMapping("/news/update")
	public String doCompanyNewsUpdate(@ModelAttribute CompanyNewsVO companyNewsVO
			                        , Model model) {
		System.out.println("Post ID: " + companyNewsVO.getCompanyNewsPostId());
		System.out.println("제목: " + companyNewsVO.getPostTitle());
		System.out.println("내용: " + companyNewsVO.getPostContent());
		System.out.println("등록일: " + companyNewsVO.getPostDate());
		
		boolean isSuccess = companyNewsService.updateOneCompanyNews(companyNewsVO);
		if(isSuccess) {
			return "redirect:/news/view?companyPostId=" + companyNewsVO.getCompanyNewsPostId();
		}
		else {
			model.addAttribute("companyNewsVO", companyNewsVO);
			return "company/news/newsupdate";
		}
	}
	
	@PostMapping("/news/delete")
	public String doDeleteCompanyNews(@ModelAttribute CompanyNewsVO companyNewsVO
                                    , Model model) {
		boolean isSuccess = companyNewsService.deleteOneCompanyNews(companyNewsVO);
		if(isSuccess) {
			return "redirect:/news/list";
		}
		else {
			model.addAttribute("companyNewsVO", companyNewsVO);
			return "redirect:/news/view?companyPostId=" + companyNewsVO.getCompanyNewsPostId();
		}
	}
}

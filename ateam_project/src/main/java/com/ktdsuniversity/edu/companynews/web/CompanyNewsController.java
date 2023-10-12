package com.ktdsuniversity.edu.companynews.web;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.beans.FileHandler;
import com.ktdsuniversity.edu.companynews.service.CompanyNewsService;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsListVO;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsVO;

@Controller
public class CompanyNewsController {
	
	@Autowired
	private FileHandler fileHandler;
	
	@Autowired
	private CompanyNewsService companyNewsService;

	@GetMapping("/news/view/{companyNewsPostId}") 
	public String viewOneCompanyNews(@PathVariable String companyNewsPostId
			                       , Model model) {
		CompanyNewsVO companyNewsVO = companyNewsService
				                     .getOneCompanyNews(companyNewsPostId, true);
		model.addAttribute("companyNewsVO", companyNewsVO);
		return "company/news/newsview";
	}
	
	@GetMapping("/news/list")
	public String viewCompanyNewsList(Model model) {
		CompanyNewsListVO companyNewsListVO = companyNewsService.getAllCompanyNews();
		model.addAttribute("companyNewsList", companyNewsListVO);
		System.out.println(companyNewsListVO.getCompanyNewsList());
		return "company/news/newslist";
	}
	
	@GetMapping("/news/create")
	public String viewCompanyNewsCreatePage() {
		return "company/news/newscreate";
	}
	
	@PostMapping("/news/create")
	public String doCompanyNewsCreate(@ModelAttribute CompanyNewsVO companyNewsVO
			                        , @RequestParam MultipartFile file
			                        , Model model) {
		
		System.out.println("첨부파일명: " + file.getOriginalFilename());

		boolean isSuccess = companyNewsService.createNewCompanyNews(companyNewsVO, file);
		if(isSuccess) {
			return "redirect:/news/list";
		}
		else {
			model.addAttribute("companyNewsVO", companyNewsVO);
			return "company/news/newscreate";
		}
	}
	
	@GetMapping("/news/file/download/{companyNewsPostId}")
	public ResponseEntity<Resource> downloadFile (@PathVariable String companyNewsPostId) {
		
		// 파일 정보를 얻어오기 위해 게시글을 조회한다.
		CompanyNewsVO companyNewsVO = companyNewsService.getOneCompanyNews(companyNewsPostId, false);
		if(companyNewsVO == null) {
			throw new IllegalArgumentException("잘못된 접근입니다.");
		}
		// 서버에 등록되어있는 파일을 가져온다.
		File storedFile = fileHandler.getStoredFile(companyNewsVO.getFileName());
		
		return fileHandler.getResponseEntity(storedFile, 
                                             companyNewsVO.getOriginFileName());
	}
	
	@GetMapping("/news/update/{companyNewsPostId}")
	public String viewCompanyNewsUpdatePage(@PathVariable String companyNewsPostId
			                              , Model model) {
		System.out.println("PathVariable: " + companyNewsPostId);
		
		CompanyNewsVO companyNewsVO = companyNewsService.getOneCompanyNews(companyNewsPostId, false);
		
//		if(!companyNewsVO.getPostWriter().equals()) {
//			throw new IllegalArgumentException("잘못된 접근입니다.");
//		}
		
		model.addAttribute("companyNewsVO", companyNewsVO);
		return "company/news/newsupdate";
	}
	
	@PostMapping("/news/update")
	public String doCompanyNewsUpdate(@ModelAttribute CompanyNewsVO companyNewsVO
									, @RequestParam MultipartFile file
			                        , Model model) {
		System.out.println("Post ID: " + companyNewsVO.getCompanyNewsPostId());
		System.out.println("제목: " + companyNewsVO.getPostTitle());
		System.out.println("내용: " + companyNewsVO.getPostContent());
		
		CompanyNewsVO originCompanyNewsVO = companyNewsService.getOneCompanyNews(companyNewsVO.getCompanyNewsPostId(), false);
//		if(!originCompanyNewsVO.getPostWriter().equals())
		
		boolean isSuccess = companyNewsService.updateOneCompanyNews(companyNewsVO, file);
		if(isSuccess) {
			return "redirect:/news/view/" + companyNewsVO.getCompanyNewsPostId();
		}
		else {
			model.addAttribute("companyNewsVO", companyNewsVO);
			return "company/news/newsupdate";
		}
	}
	
	@PostMapping("/news/delete")
	public String doDeleteCompanyNews(@ModelAttribute CompanyNewsVO companyNewsVO
                                    , Model model) {
		System.out.println("Post ID: " + companyNewsVO.getCompanyNewsPostId());
		
		boolean isSuccess = companyNewsService.deleteOneCompanyNews(companyNewsVO);

		if(isSuccess) {
			return "redirect:/news/list";
		}
		else {
			model.addAttribute("companyNewsVO", companyNewsVO);
			return "redirect:/news/view/" + companyNewsVO.getCompanyNewsPostId();
		}
	}
}

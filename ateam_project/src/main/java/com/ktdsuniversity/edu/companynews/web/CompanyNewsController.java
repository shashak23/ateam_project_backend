/*
 * 작성자: 장보늬
 * 작성일자: 2023-10-15
 * 내용: 기업소식 게시판의 요청과 응답을 처리합니다.
 */

package com.ktdsuniversity.edu.companynews.web;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.beans.FileHandler;
import com.ktdsuniversity.edu.companynews.service.CompanyNewsService;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsListVO;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsVO;
import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
import com.ktdsuniversity.edu.member.vo.MemberVO;

import jakarta.validation.Valid;

@Controller
public class CompanyNewsController {

	private Logger logger = LoggerFactory.getLogger(CompanyNewsController.class);
	
	@Autowired
	private FileHandler fileHandler;
	
	@Autowired
	private CompanyNewsService companyNewsService;
	
	@GetMapping("/news/list")
	public String viewCompanyNewsList(Model model) {
		CompanyNewsListVO companyNewsListVO = companyNewsService.getAllCompanyNews();
		model.addAttribute("companyNewsList", companyNewsListVO);
		return "company/news/newslist";
	}
	
	@GetMapping("/news/view/{companyNewsPostId}") 
	public String viewOneCompanyNews(@PathVariable String companyNewsPostId
			                       , Model model) {
		CompanyNewsVO companyNewsVO = companyNewsService
				                     .getOneCompanyNews(companyNewsPostId, true);
		model.addAttribute("companyNewsVO", companyNewsVO);
		return "company/news/newsview";
	}
	
	@GetMapping("/news/create")
	public String viewCompanyNewsCreatePage() {
		return "company/news/newscreate";
	}
	
	@PostMapping("/news/create")
	public String doCompanyNewsCreate(@Valid @ModelAttribute CompanyNewsVO companyNewsVO
			                        , BindingResult bindingResult
			                        , @RequestParam MultipartFile file
			                        , Model model
			                        , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		
		logger.debug("첨부파일명: " + file.getOriginalFilename());

		if (bindingResult.hasErrors()) {
			model.addAttribute("companyNewsVO", companyNewsVO);
			return "company/news/newscreate";
		}
		
		companyNewsVO.setPostWriter(memberVO.getEmail());
		
		// 기업회원 로그인 시, 로그인한 회원 이메일을 postWriter에 넣어라
//		companyNewsVO.setPostWriter(companyVO.getEmail());
		
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
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		// 서버에 등록되어있는 파일을 가져온다.
		File storedFile = fileHandler.getStoredFile(companyNewsVO.getFileName());
		
		return fileHandler.getResponseEntity(storedFile, 
                                             companyNewsVO.getOriginFileName());
	}
	
	@GetMapping("/news/update/{companyNewsPostId}")
	public String viewCompanyNewsUpdatePage(@PathVariable String companyNewsPostId
			                              , Model model) {
		logger.debug("PathVariable: " + companyNewsPostId);
		
		CompanyNewsVO companyNewsVO = companyNewsService.getOneCompanyNews(companyNewsPostId, false);
		
//		if(!companyNewsVO.getPostWriter().equals()) {
//			throw new PageNotFoundException("잘못된 접근입니다.");
//		}
		
		model.addAttribute("companyNewsVO", companyNewsVO);
		return "company/news/newsupdate";
	}
	
	@PostMapping("/news/update")
	public String doCompanyNewsUpdate(@ModelAttribute CompanyNewsVO companyNewsVO
									, @RequestParam MultipartFile file
			                        , Model model) {
		logger.debug("Post ID: " + companyNewsVO.getCompanyNewsPostId());
		logger.debug("제목: " + companyNewsVO.getPostTitle());
		logger.debug("내용: " + companyNewsVO.getPostContent());
		
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
	
	@GetMapping("/news/delete/{companyNewsPostId}")
	public String doDeleteCompanyNews(@PathVariable String companyNewsPostId) {
		logger.debug("PathVariable: " + companyNewsPostId);
		
        companyNewsService.deleteOneCompanyNews(companyNewsPostId);
		
//		if(!companyNewsVO.getPostWriter().equals()) {
//			throw new PageNotFoundException("잘못된 접근입니다.");
//		}
		
		return "redirect:/news/list";
	}
}

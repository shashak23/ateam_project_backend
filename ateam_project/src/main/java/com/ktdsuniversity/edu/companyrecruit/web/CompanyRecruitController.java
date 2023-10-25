/**
 * 작성자: 김시하
 * 수정자: 김시하(2023-10-25)
 * 작성일자: 2023-10-23
 * 내용: 기업 채용을 위한 Controller
 */
package com.ktdsuniversity.edu.companyrecruit.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.companyrecruit.service.CompanyRecruitService;
import com.ktdsuniversity.edu.companyrecruit.vo.CompanyRecruitListVO;
import com.ktdsuniversity.edu.companyrecruit.vo.CompanyRecruitVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import com.ktdsuniversity.edu.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
public class CompanyRecruitController {

	@Autowired
	private CompanyRecruitService companyRecruitService;
	
	private Logger log = LoggerFactory.getLogger(FreePostController.class);

	
	// 전체 조회
	@GetMapping("/recruit/list")
	public ModelAndView companyMypostRecruitList() {
		CompanyRecruitListVO companyRecruitListVO = companyRecruitService.getAllBoard();
		ModelAndView view = new ModelAndView();
		view.setViewName("company/mypost/recruitlist");
		view.addObject("companyRecruitListVO", companyRecruitListVO);
		return view;
	}
	
	// 등록페이지
	@GetMapping("/recruit/create")
	public String viewCompanyMypostRecruitPage() {
		return "company/mypost/recruitcreate";
	}
	
	// 게시글 등록하기
	@PostMapping("/recruit/create")
	public ModelAndView createCompanyMypostRecruit(@Valid @ModelAttribute CompanyRecruitVO companyRecruitVO
											   , BindingResult bindingResult 
									           , HttpServletRequest request
									           , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		
		companyRecruitVO.setPostWriter(memberVO.getEmail());
		ModelAndView view = new ModelAndView();
		if(bindingResult.hasErrors()) {
			view.setViewName("recruit/create");
			view.addObject("companyRecruitVO",companyRecruitVO);
			return view;
		}
		boolean isSuccess = companyRecruitService.createNewBoard(companyRecruitVO);
		
		if(isSuccess) {
			view.setViewName("redirect:/recruit/list");
			return view;
		} else {
			view.setViewName("recruit/create");
			view.addObject("companyRecruitVO", companyRecruitVO);
			return view;
		}
	}
	
	
	// 단건 조회
	@GetMapping("/recruit/view/{companyRecruitPostId}")
	public ModelAndView companyMypostRecruitSingle(@PathVariable String companyRecruitPostId
													, @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		ModelAndView view = new ModelAndView();
		CompanyRecruitVO companyRecruitVO = companyRecruitService.getOneRecruitBoard(companyRecruitPostId);
		companyRecruitVO.setPostWriter(memberVO.getEmail());
		view.setViewName("company/mypost/recruitview");
		view.addObject("companyRecruitVO", companyRecruitVO);
		return view;
	}
	
	// 수정
	@PostMapping("/recruit/update")
	public ModelAndView updateCompanyMypostRecruit(@ModelAttribute CompanyRecruitVO companyRecruitVO) {
		log.debug("--1--컨트롤러 도착------------------------------");
		ModelAndView view = new ModelAndView();
		boolean isSuccess = companyRecruitService.updateOneRecruitBoard(companyRecruitVO);
		if(isSuccess) {
			view.setViewName("redirect:/recruit/list");
			return view;
		} else {
			view.setViewName("company/mypost/recruitupdate");
			view.addObject("companyRecruitVO", companyRecruitVO);
			return view;
		}
		
	}
	
	// 삭제
}

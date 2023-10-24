/**
 * 작성자: 김시하
 * 작성일자: 2023-10-23
 * 내용: 기업 채용을 위한 Controller
 */
package com.ktdsuniversity.edu.companyrecruit.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.companyrecruit.service.CompanyRecruitService;
import com.ktdsuniversity.edu.companyrecruit.vo.CompanyRecruitListVO;
import com.ktdsuniversity.edu.companyrecruit.vo.CompanyRecruitVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

@Controller
public class CompanyRecruitController {

	@Autowired
	private CompanyRecruitService companyRecruitService;
	
	// 전체 조회
	@GetMapping("/company/mypost/recuit/list")
	public ModelAndView companyMypostRecruitList() {
		CompanyRecruitListVO companyRecruitListVO = companyRecruitService.getAllBoard();
		ModelAndView view = new ModelAndView();
		view.setViewName("company/recruit/recruitlist");
		view.addObject("companyRecruitListVO", companyRecruitListVO);
		return view;
	}
	
	// 등록페이지
	@GetMapping("/company/mypost/recruit/create")
	public String viewCompanyMypostRecruitPage() {
		return "company/recruit/recruitcreate";
	}
	
	// 게시글 등록하기
	@PostMapping("/company/mypost/recruit/create")
	public ModelAndView createCompanyMypostRecruit(@Valid @ModelAttribute CompanyRecruitVO companyRecruitVO
											   , BindingResult bindingResult 
									           , HttpServletRequest request
									           , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		
		ModelAndView view = new ModelAndView();
		if(bindingResult.hasErrors()) {
			view.setViewName("company/mypost/recruit/create");
			view.addObject("companyRecruitVO",companyRecruitVO);
			return view;
		}
		companyRecruitVO.setPostWriter(memberVO.getEmail());
		boolean isSuccess = companyRecruitService.createNewBoard(companyRecruitVO);
		
		if(isSuccess) {
			view.setViewName("redirect:/company/mypost/recuit/list");
			return view;
		} else {
			view.setViewName("company/mypost/recruit/create");
			view.addObject("companyRecruitVO", companyRecruitVO);
			return view;
		}
	}
	
	
	// 단건 조회
	
	
	// 수정
	
	
	// 삭제
}

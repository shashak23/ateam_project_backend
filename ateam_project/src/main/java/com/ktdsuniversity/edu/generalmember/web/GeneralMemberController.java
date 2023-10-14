package com.ktdsuniversity.edu.generalmember.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.generalmember.service.GeneralMemberService;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Controller
public class GeneralMemberController {
	@Autowired
	private GeneralMemberService generalMemberService;

	/**
	 * 경력 조회
	 */
	@GetMapping("/memberinfo/view")
	public ModelAndView viewMemberInfo(@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		ModelAndView modelAndView = new ModelAndView();
		System.out.println(memberVO.getEmail());
		List<CareerVO> careerListVO = generalMemberService.getAllCareerListByMemberEmail(memberVO.getEmail());
		List<GeneralMemberVO> generalMemberListVO = generalMemberService.getAllGeeralMemberList(memberVO.getEmail());
		MemberVO member = generalMemberService.getSelectNickname(memberVO.getEmail());
		GeneralMemberVO generalMemberVO = generalMemberService.getSelectGeneralMember(memberVO.getEmail());
		modelAndView.setViewName("/mypage/myprofile");
		modelAndView.addObject("careerList", careerListVO);
		modelAndView.addObject("generalMemberList", generalMemberListVO);
		modelAndView.addObject("generalMemberVO", generalMemberVO);
		modelAndView.addObject("memberVO", member);
		return modelAndView;
	}

	/**
	 * 지역 조회
	 */
	@GetMapping("/memberinfo/addressview/{generalMemberEmail}")
	public String viewOneAddress(@PathVariable String generalMemberEmail, Model model,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		GeneralMemberVO generalMemberVO = generalMemberService.getSelectGeneralMember(memberVO.getEmail());
		model.addAttribute("generalMemberVO", generalMemberVO);
		return "mypage/addressview";
	}

	/**
	 * 지역 수정
	 */
	@GetMapping("/memberInfo/modify/update-location/{generalMemberEmail}")
	public String updateLocation(@PathVariable String generalMemberEmail, Model model,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		GeneralMemberVO generalMemberVO = generalMemberService.getSelectGeneralMember(generalMemberEmail);
		if (!generalMemberVO.getGeneralMemberEmail().equals(memberVO.getEmail())) {
			throw new IllegalArgumentException("잘못된 접근입니다.");
		}
		model.addAttribute("generalMemberVO", generalMemberVO);
		return "mypage/modifyaddress";
	}

	@PostMapping("/memberInfo/modify/update-location")
	public String doUpdateLocation(@ModelAttribute GeneralMemberVO generalMemberVO, Model model,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		boolean isSuccess = generalMemberService.updateOneAddress(generalMemberVO);
		if (isSuccess) {
			return "redirect:/memberinfo/addressview/" + generalMemberVO.getGeneralMemberEmail();
		} else {
			model.addAttribute("generalMemberVO", generalMemberVO);
			return "mypage/modifyaddress";
		}
	}

	/**
	 * 주소 삭제
	 */
	@GetMapping("/memberInfo/modify/delete-location/{generalMemberEmail}")
	public String deleteLocation(@PathVariable String generalMemberEmail) {
		boolean isSuccess = generalMemberService.deleteOneAddress(generalMemberEmail);
		if (isSuccess) {
			return "redirect:/memberinfo/view";
		} else {
			return "redirect:/memberinfo/addressview/" + generalMemberEmail;
		}
	}

	/**
	 * SNS 조회
	 */
	@GetMapping("/memberinfo/viewsns/{generalMemberEmail}")
	public String viewSelectSNS(@PathVariable String generalMemberEmail, Model model,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		GeneralMemberVO generalMemberVO = generalMemberService.getSelectGeneralMember(memberVO.getEmail());
		model.addAttribute("generalMemberVO", generalMemberVO);
		return "mypage/snsview";
	}

	/**
	 * SNS 수정
	 */
	@GetMapping("/memberInfo/modify/update-sns-link/{generalMemberEmail}")
	public String updateSnsLink(@PathVariable String generalMemberEmail, Model model,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		GeneralMemberVO generalMemberVO = generalMemberService.getSelectGeneralMember(generalMemberEmail);
		if (!generalMemberVO.getGeneralMemberEmail().equals(memberVO.getEmail())) {
			throw new IllegalArgumentException("잘못된 접근입니다.");
		}
		model.addAttribute("generalMemberVO", generalMemberVO);
		return "mypage/modifysns";
	}

	@PostMapping("/memberInfo/modify/update-sns-link")
	public String doUpdateSnsLink(@ModelAttribute GeneralMemberVO generalMemberVO, Model model,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		boolean isSuccess = generalMemberService.updateSns(generalMemberVO);
		if (isSuccess) {
			return "redirect:/memberinfo/viewsns/" + generalMemberVO.getGeneralMemberEmail();
		} else {
			model.addAttribute("generalMemberVO", generalMemberVO);
			return "mypage/modifysns";
		}
	}
	/**
	 * Github 삭제
	 */
	@GetMapping("/memberInfo/modify/delete-git-link/{generalMemberEmail}")
	public String deletGitURL(@PathVariable String generalMemberEmail) {
		boolean isSuccess = generalMemberService.deleteGithub(generalMemberEmail);
		if (isSuccess) {
			return "redirect:/memberinfo/viewsns/" + generalMemberEmail;
		} else {
			return "redirect:/memberinfo/viewsns/" + generalMemberEmail;
		}
	}
	@GetMapping("/memberInfo/modify/delete-email-link/{generalMemberEmail}")
	public String deletEmailURL(@PathVariable String generalMemberEmail) {
		boolean isSuccess = generalMemberService.deleteEmail(generalMemberEmail);
		if (isSuccess) {
			return "redirect:/memberinfo/viewsns/" + generalMemberEmail;
		} else {
			return "redirect:/memberinfo/viewsns/" + generalMemberEmail;
		}
	}
	@GetMapping("/memberInfo/modify/delete-blog-link/{generalMemberEmail}")
	public String deletBlogURL(@PathVariable String generalMemberEmail) {
		boolean isSuccess = generalMemberService.deleteBlog(generalMemberEmail);
		if (isSuccess) {
			return "redirect:/memberinfo/viewsns/" + generalMemberEmail;
		} else {
			return "redirect:/memberinfo/viewsns/" + generalMemberEmail;
		}
	}
	
	/**
	 * 소개글 조회
	 */
	@GetMapping("/memberInfo/my-introduction/{generalMemberEmail}")
	public String viewMyintroduction(@PathVariable String generalMemberEmail, Model model,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		GeneralMemberVO generalMemberVO = generalMemberService.getSelectGeneralMember(memberVO.getEmail());
		model.addAttribute("generalMemberVO", generalMemberVO);
		return "mypage/myintroductionview";
	}

	/**
	 * 소개글 수정
	 */
	@GetMapping("/memberInfo/modify/update-introduction/{generalMemberEmail}")
	public String updateIntroduction(@PathVariable String generalMemberEmail, Model model,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		GeneralMemberVO generalMemberVO = generalMemberService.getSelectGeneralMember(generalMemberEmail);
		if (!generalMemberVO.getGeneralMemberEmail().equals(memberVO.getEmail())) {
			throw new IllegalArgumentException("잘못된 접근입니다.");
		}
		model.addAttribute("generalMemberVO", generalMemberVO);
		return "mypage/modifyintroduce";
	}

	@PostMapping("/memberInfo/modify/update-introduction")
	public String doUpdateIntroduction(@ModelAttribute GeneralMemberVO generalMemberVO, Model model,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		boolean isSuccess = generalMemberService.updateselfIntro(generalMemberVO);
		if (isSuccess) {
			return "redirect:/memberInfo/my-introduction/" + generalMemberVO.getGeneralMemberEmail();
		} else {
			model.addAttribute("generalMemberVO", generalMemberVO);
			return "mypage/modifyintroduce";
		}
	}
	@GetMapping("/memberInfo/modify/delete-introduction/{generalMemberEmail}")
	public String deleteIntroduction(@PathVariable String generalMemberEmail) {
		boolean isSuccess = generalMemberService.deleteSelfIntro(generalMemberEmail);
		if (isSuccess) {
			return "redirect:/memberinfo/view";
		} else {
			return "redirect:/memberInfo/my-introduction/" + generalMemberEmail;
		}
	}
	
}

/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-24
 * 수정자: 김광원(2023-10-25)
 * 수정자: 김태현(2023-10-31)
 * 내용 : 일반회원을 Controller입니다.
 */
package com.ktdsuniversity.edu.generalmember.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.education.vo.EducationVO;
import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
import com.ktdsuniversity.edu.follow.service.FollowService;
import com.ktdsuniversity.edu.follow.vo.FollowListVO;
import com.ktdsuniversity.edu.generalmember.service.GeneralMemberService;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.util.XssIgnoreUtil;

import jakarta.validation.Valid;

@Controller
public class GeneralMemberController {
	
	private Logger logger = LoggerFactory.getLogger(GeneralMemberController.class);
	
	@Autowired
	private GeneralMemberService generalMemberService;

	@Autowired
	private FollowService followService;
	
	/**
	 * 마이페이지 조회
	 */
	@GetMapping("/memberinfo/view/{generalMemberEmail}")
	public ModelAndView viewMemberInfo(@PathVariable String generalMemberEmail
			                         , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		ModelAndView modelAndView = new ModelAndView();
		List<CareerVO> careerListVO = generalMemberService.getAllCareerListByMemberEmail(generalMemberEmail);
		List<GeneralMemberVO> generalMemberListVO = generalMemberService.getAllGeeralMemberList(generalMemberEmail);
		List<EducationVO> educationListVO = generalMemberService.getAllEducationList(generalMemberEmail);
		MemberVO member = generalMemberService.getSelectNickname(generalMemberEmail);
		List<CommonCodeVO> commonCodeVO = generalMemberService.getSelectCommonCode(generalMemberEmail);
		GeneralMemberVO generalMemberVO = generalMemberService.getSelectGeneralMember(generalMemberEmail);
		FollowListVO followerList = followService.getAllFollower(memberVO.getEmail());
		FollowListVO followeeList = followService.getAllFollowee(memberVO.getEmail());
		modelAndView.setViewName("/mypage/myprofile");
		modelAndView.addObject("careerList", careerListVO);
		modelAndView.addObject("generalMemberList", generalMemberListVO);
		modelAndView.addObject("generalMemberVO", generalMemberVO);
		modelAndView.addObject("memberVO", member);
		modelAndView.addObject("commonCodeList", commonCodeVO);
		modelAndView.addObject("educationList", educationListVO);
		modelAndView.addObject("followerList", followerList);
		modelAndView.addObject("followeeList", followeeList);
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
	 * 지역 생성
	 */
	@GetMapping("/memberInfo/modify/create-location/{generalMemberEmail}")
	public String createLocation(@PathVariable String generalMemberEmail, Model model,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		GeneralMemberVO generalMemberVO = generalMemberService.getSelectGeneralMember(generalMemberEmail);
		if (!generalMemberVO.getGeneralMemberEmail().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		model.addAttribute("generalMemberVO", generalMemberVO);
		return "mypage/createaddress";
	}

	@PostMapping("/memberInfo/modify/create-location")
	public String doCreateLocation(@Valid @ModelAttribute GeneralMemberVO generalMemberVO
								   ,BindingResult bindingResult
								   , Model model
					               ,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("generalMemberVO", generalMemberVO);
			return "mypage/createaddress";
		}
		
		boolean isSuccess = generalMemberService.updateOneAddress(generalMemberVO);
		if (isSuccess) {
			return "redirect:/memberinfo/view/"+generalMemberVO.getGeneralMemberEmail();
		} else {
			model.addAttribute("generalMemberVO", generalMemberVO);
			return "mypage/createaddress";
		}
	}
	/**
	 * 지역 수정
	 */
	@GetMapping("/memberInfo/modify/update-location/{generalMemberEmail}")
	public String updateLocation(@PathVariable String generalMemberEmail, Model model,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		GeneralMemberVO generalMemberVO = generalMemberService.getSelectGeneralMember(generalMemberEmail);
		if (!generalMemberVO.getGeneralMemberEmail().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		model.addAttribute("generalMemberVO", generalMemberVO);
		return "mypage/modifyaddress";
	}

	@PostMapping("/memberInfo/modify/update-location")
	public String doUpdateLocation(@Valid @ModelAttribute GeneralMemberVO generalMemberVO
								   ,BindingResult bindingResult
								   , Model model
			                       ,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		 if (bindingResult.hasErrors()) {
				model.addAttribute("generalMemberVO", generalMemberVO);
				return "mypage/modifyaddress";
			}
		 if (!generalMemberVO.getGeneralMemberEmail().equals(memberVO.getEmail())) {
				throw new PageNotFoundException("잘못된 접근입니다.");
			}
		boolean isSuccess = generalMemberService.updateOneAddress(generalMemberVO);
		if (isSuccess) {
			return "redirect:/memberinfo/view/"+generalMemberVO.getGeneralMemberEmail();
		} else {
			model.addAttribute("generalMemberVO", generalMemberVO);
			return "mypage/modifyaddress";
		}
	}
	/**
	 * 지역 삭제
	 */
	@GetMapping("/memberInfo/modify/delete-location/{generalMemberEmail}")
	public String deleteLocation(@PathVariable String generalMemberEmail
								,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		GeneralMemberVO  generalMemberVO=generalMemberService.getSelectGeneralMember(generalMemberEmail);
		if (!generalMemberVO.getGeneralMemberEmail().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		boolean isSuccess = generalMemberService.deleteOneAddress(generalMemberEmail);
		if (isSuccess) {
			return "redirect:/memberinfo/view/"+generalMemberVO.getGeneralMemberEmail();
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
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		model.addAttribute("generalMemberVO", generalMemberVO);
		return "mypage/modifysns";
	}

	@PostMapping("/memberInfo/modify/update-sns-link")
	public String doUpdateSnsLink(@ModelAttribute GeneralMemberVO generalMemberVO, Model model,
			@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		
		if (!generalMemberVO.getGeneralMemberEmail().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		boolean isSuccess = generalMemberService.updateSns(generalMemberVO);
		if (isSuccess) {
			return "redirect:/memberinfo/view/"+generalMemberVO.getGeneralMemberEmail();
		} else {
			model.addAttribute("generalMemberVO", generalMemberVO);
			return "mypage/modifysns";
		}
	}
	/**
	 * Github 삭제
	 */
	@GetMapping("/memberInfo/modify/delete-git-link/{generalMemberEmail}")
	public String deletGitURL(@PathVariable String generalMemberEmail
							  ,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		GeneralMemberVO generalMemberVO = generalMemberService.getSelectGeneralMember(generalMemberEmail);
		
		if (!generalMemberVO.getGeneralMemberEmail().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		boolean isSuccess = generalMemberService.deleteGithub(generalMemberEmail);
		if (isSuccess) {
			return "redirect:/memberinfo/viewsns/" + generalMemberEmail;
		} else {
			return "redirect:/memberinfo/viewsns/" + generalMemberEmail;
		}
	}
	/**
	 * Email 삭제
	 */
	@GetMapping("/memberInfo/modify/delete-email-link/{generalMemberEmail}")
	public String deletEmailURL(@PathVariable String generalMemberEmail
								,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		GeneralMemberVO generalMemberVO = generalMemberService.getSelectGeneralMember(generalMemberEmail);
		if (!generalMemberVO.getGeneralMemberEmail().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		boolean isSuccess = generalMemberService.deleteEmail(generalMemberEmail);
		if (isSuccess) {
			return "redirect:/memberinfo/viewsns/" + generalMemberEmail;
		} else {
			return "redirect:/memberinfo/viewsns/" + generalMemberEmail;
		}
	}
	/**
	 * blog삭제
	 */
	@GetMapping("/memberInfo/modify/delete-blog-link/{generalMemberEmail}")
	public String deletBlogURL(@PathVariable String generalMemberEmail
							   ,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		GeneralMemberVO generalMemberVO = generalMemberService.getSelectGeneralMember(generalMemberEmail);
		if (!generalMemberVO.getGeneralMemberEmail().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
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
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		model.addAttribute("generalMemberVO", generalMemberVO);
		return "mypage/modifyintroduce";
	}

	@PostMapping("/memberInfo/modify/update-introduction")
	public String doUpdateIntroduction(@ModelAttribute GeneralMemberVO generalMemberVO, Model model,
									   @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		
		XssIgnoreUtil.ignore(generalMemberVO);
		
		if (!generalMemberVO.getGeneralMemberEmail().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		boolean isSuccess = generalMemberService.updateselfIntro(generalMemberVO);
		if (isSuccess) {
			return "redirect:/memberinfo/view/"+generalMemberVO.getGeneralMemberEmail();
		} else {
			model.addAttribute("generalMemberVO", generalMemberVO);
			return "mypage/modifyintroduce";
		}
	}
	/**
	 * 소개글 삭제
	 */
	@GetMapping("/memberInfo/modify/delete-introduction/{generalMemberEmail}")
	public String deleteIntroduction(@PathVariable String generalMemberEmail
									 ,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		GeneralMemberVO generalMemberVO = generalMemberService.getSelectGeneralMember(generalMemberEmail);
		if (!generalMemberVO.getGeneralMemberEmail().equals(memberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		boolean isSuccess = generalMemberService.deleteSelfIntro(generalMemberEmail);
		if (isSuccess) {
			return "redirect:/memberinfo/view/"+generalMemberVO.getGeneralMemberEmail();
		} else {
			return "redirect:/memberInfo/my-introduction/" + generalMemberEmail;
		}
	}
	
}

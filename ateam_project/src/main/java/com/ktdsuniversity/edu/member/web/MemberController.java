package com.ktdsuniversity.edu.member.web;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import com.ktdsuniversity.edu.member.service.MemberService;
import com.ktdsuniversity.edu.member.vo.CompanyVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.member.vo.validategroup.MemberAuthGroup;
import com.ktdsuniversity.edu.member.vo.validategroup.MemberSignupGroup;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	private Logger log = LoggerFactory.getLogger(FreePostController.class);
	
	/**
	 * 로그인 관련
	 */
	@GetMapping("/member/auth")
	public String signIn() {
		return "member/memberlogin";
	}
	@PostMapping("/member/auth")
	public String doSignIn(@Validated(MemberAuthGroup.class) @ModelAttribute MemberVO memberVO
						  ,BindingResult bindingResult
						  ,@RequestParam(required = false,defaultValue = "/home/main")
					       String next
						  ,HttpSession session
						  ,Model model) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("memberVO", memberVO);
			return "member/memberlogin";
		}
		
		try {
		MemberVO member = memberService.getMember(memberVO);
		session.setAttribute("_LOGIN_USER_", member);
		}
		catch (IllegalArgumentException iae) {
			model.addAttribute("memberVO", memberVO);
			model.addAttribute("message", iae.getMessage());
			return "member/memberlogin";
		}
		
		return "redirect:" + next;
	}
	@GetMapping("member/logout")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/home/main";
	}
	
	/**
	 * 회원가입 관련
	 */
	@GetMapping("/member/signup")
	public String memberSignUp() {
		return "member/membersignup";
	}
	@PostMapping("/member/signup")
	public String doMemberSignUp(@Validated(MemberSignupGroup.class)
							   @ModelAttribute GeneralMemberVO generalMemberVO
							   , BindingResult bindingResult
							   , Model model) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("memberVO", generalMemberVO);
			return "member/membersignup";
		}
		boolean isSuccess = memberService.createNewMember(generalMemberVO);
		if(isSuccess) {
			return("redirect:/member/auth");
		}
		model.addAttribute("memberVO", generalMemberVO);
		return "member/membersignup";
	}
	
	/**
	 * 검증관련
	 */
	@ResponseBody 
	@GetMapping("/member/signup/vaildation")
	public Map<String, Object> checkAvailability(@RequestParam(required = false) String email
												,@RequestParam(required = false) String nickname){
		Map<String, Object> responseMap = new HashMap<>();

		if(email != null) {
			boolean isAvailableEmail = memberService.checkAvailableEmail(email);
			responseMap.put("email", email);
			responseMap.put("available", isAvailableEmail);
		}
		if(nickname!= null) {
			boolean isAvailableNickname= memberService.checkAvailableNickname(nickname);
			responseMap.put("nickname",nickname);
			responseMap.put("available", isAvailableNickname);
		}
		return responseMap;
	}
	
	/**
	 * 기업회원 가입
	 */
	@GetMapping("/member/companysignup")
	public String companyMemberSignUp() {
		return "member/companyregist";
	}
	@PostMapping("/member/companysignup")
	public String doComapnyMemberSignUp(@Valid @ModelAttribute CompanyVO companyVO
							   , Model model
							   , BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("comapnyVO", companyVO);
			return "member/companysignup"; 
		}
		
		boolean isSuccess = memberService.createNewCompanyMemeber(companyVO);
		if(isSuccess) {
			return("redirect:/member/auth");
		}
		model.addAttribute("companyVO", companyVO);
		return "member/membersignup";
	}
	
	/**
	 * 기업회원 검증
	 */
	@ResponseBody 
	@GetMapping("/member/companysignup/vaildation")
	public Map<String, Object> checkAvailableCompanyEmail(@RequestParam String email){
		
		boolean isAvailableCompanyEmail = memberService.checkAvailableCompanyEmail(email);
		
		Map<String, Object> responseMap = new HashMap<>();

		responseMap.put("comapnyEmail", email);
		responseMap.put("available", isAvailableCompanyEmail);

		return responseMap;
	}
	
}

package com.ktdsuniversity.edu.member.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ktdsuniversity.edu.member.service.MemberService;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.member.vo.validategroup.MemberSignupGroup;

@Controller
public class MemberSignUp {
	@Autowired
	private MemberService memberService;
	@GetMapping("/member/signup")
	public String memberSignUp() {
		return "member/membersignup";
	}
	@PostMapping("/member/signup")
	public String doMemberSignUp(@Validated(MemberSignupGroup.class)
							   @ModelAttribute MemberVO memberVO	
							   , BindingResult bindingResult	
							   ,Model model) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("memberVO", memberVO);
			return "member/membersignup";
		}
		boolean isSuccess = memberService.createNewMember(memberVO);
		if(isSuccess) {
			return("redirect:/member/auth");
		}
		model.addAttribute("memberVO", memberVO);
		return "member/membersignup";
	}
	
}

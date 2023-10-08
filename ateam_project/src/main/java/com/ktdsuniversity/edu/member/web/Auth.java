package com.ktdsuniversity.edu.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ktdsuniversity.edu.member.service.MemberService;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.member.vo.validategroup.MemberAuthGroup;

import jakarta.servlet.http.HttpSession;

@Controller
public class Auth {
	@Autowired
	private MemberService memberService;
	
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
}

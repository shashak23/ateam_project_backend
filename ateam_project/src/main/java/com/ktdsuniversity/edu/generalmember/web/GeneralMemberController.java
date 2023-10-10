package com.ktdsuniversity.edu.generalmember.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GeneralMemberController {

	@GetMapping("/memberinfo/view")
	public String viewMypage() {
		return "mypage/myprofile";
	}
}

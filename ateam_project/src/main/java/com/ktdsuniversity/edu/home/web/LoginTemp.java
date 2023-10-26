package com.ktdsuniversity.edu.home.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginTemp {
	
	@GetMapping("/devground/login")
	public String viewLogin() {
		return "login/userlogin";
	}
}

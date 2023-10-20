package com.ktdsuniversity.edu.home.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/home/home")
	public String homeLink() {
		return "home/home";
	}
}

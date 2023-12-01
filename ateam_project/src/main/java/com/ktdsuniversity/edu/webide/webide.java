package com.ktdsuniversity.edu.webide;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class webide {

	
	@GetMapping("/webide")
	public String webide(Model model) {
		return "temp/webide";
	}
}

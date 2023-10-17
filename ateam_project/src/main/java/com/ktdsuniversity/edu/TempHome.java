package com.ktdsuniversity.edu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.member.vo.MemberVO;

@Controller
public class TempHome {
	
	@GetMapping("home/main")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("temp/temphome");
		return mav;
	}
}

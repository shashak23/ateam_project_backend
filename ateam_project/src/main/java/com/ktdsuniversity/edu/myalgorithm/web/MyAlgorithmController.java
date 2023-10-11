package com.ktdsuniversity.edu.myalgorithm.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.myalgorithm.service.MyAlgorithmService;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmListVO;

@Controller
public class MyAlgorithmController {
	@Autowired
	private MyAlgorithmService myAlgorithmService;
	
	@GetMapping("home/my/algorithmlist")
	public ModelAndView viewAllMyAlgorithm(@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		ModelAndView mav = new ModelAndView();
		MyAlgorithmListVO myList = myAlgorithmService.getAllMyAlgorithm();
		
		if (memberVO == null) {
			mav.setViewName("redirect:/hello");
			return mav;
		}
		else {
			mav.setViewName("myalgorithm/myalgorithmlist");
			mav.addObject("myAlgorithmList", myList);
			return mav;
		}
		
	}
}

package com.ktdsuniversity.edu.myalgorithm.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
		String email = memberVO.getEmail();
		System.out.println("email: " + email);
		MyAlgorithmListVO myList = myAlgorithmService.getAllMyAlgorithm(email);
		System.out.println(myList.getMyAlgotirhmListCnt());
		
		for (int i = 0; i < myList.getMyAlgotirhmListCnt(); i++) {
			System.out.println(i + ": " + myList.getMyAlgorithmList().get(i).getGeneralMemberEmail());
			System.out.println(i + ": " + myList.getMyAlgorithmList().get(i).getCompanyAlgorithmQuestionId());
		}
		mav.setViewName("myalgorithm/myalgorithmlist");
		mav.addObject("myAlgorithmList", myList);
		return mav;
	}
}

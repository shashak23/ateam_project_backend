/**
 * 작성자: 김태현
 * 작성일자: 2023-10-12
 * 내용: 내가 푼 알고리즘들을 조회하고 처리하는 컨트롤러 클래스입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.myalgorithm.service.MyAlgorithmService;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmListVO;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;

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
		
		for (MyAlgorithmVO list : myList.getMyAlgorithmList()) {
			System.out.println("start!");
			System.out.println(list.getCompanyAlgorithmQuestionId());
			System.out.println(list.getAlgorithmQuestionVO().getAlgorithmTitle());
			System.out.println(list.getAlgorithmQuestionVO().getAlgorithmContent());
			System.out.println(list.getMemberVO().getNickname());
		}
		
		mav.setViewName("myalgorithm/myalgorithmlist");
		mav.addObject("myAlgorithmList", myList);
		mav.addObject("MemberVO", memberVO);
		return mav;
	}
}

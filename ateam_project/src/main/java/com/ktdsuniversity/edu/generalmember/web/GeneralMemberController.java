package com.ktdsuniversity.edu.generalmember.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.career.service.CareerService;
import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.generalmember.service.GeneralMemberService;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Controller
public class GeneralMemberController {
	@Autowired
	private GeneralMemberService generalMemberService;
	private CareerService careerService;
	/**
	 * 경력 조회
	 */
	@GetMapping("/memberinfo/view")
	public String viewMemberInfo(Model model 
			,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		List<CareerVO> careerListVO = generalMemberService.getAllCareerListByMemberEmail(memberVO.getEmail());
		model.addAttribute("careerList", careerListVO);
		return "/mypage/myprofile";
	}
}

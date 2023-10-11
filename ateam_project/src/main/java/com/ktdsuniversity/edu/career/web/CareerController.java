package com.ktdsuniversity.edu.career.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.career.service.CareerService;
import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Controller
public class CareerController {
	@Autowired
	private CareerService careerService;
	 @GetMapping("/memberInfo/modify/create-career")
	 public String createCareer() {
		 return "career/careercreate";
	 }
	 @PostMapping("/memberInfo/modify/create-career")
	 public String doCreateCareer(@ModelAttribute CareerVO careerVO
			 					   ,Model model
			 					   ,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		 careerVO.setGeneralMemberEmail(memberVO.getEmail());
		 boolean isSuccess = careerService.createNewCareer(careerVO);
		 if(isSuccess) {
			 model.addAttribute("isSuccess", true);
			 return "redirect:/memberinfo/view";
		 }
		 else {
			 model.addAttribute("careerVO", careerVO);
			 return "career/careercreate";
		 }
	 }
	 
	 @GetMapping("/memberInfo/modify/update-career/{careerId}")
	 public String updateCareer(@PathVariable int careerId) {
		 //CareerVO careerVO =careerService.
		 
		 return null;
	 }
	 
}

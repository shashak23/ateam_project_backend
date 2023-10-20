package com.ktdsuniversity.edu.career.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.career.service.CareerService;
import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Controller
public class CareerController {
	@Autowired
	private CareerService careerService;
	 
	/**
	 * Career 조회
	 */
	@GetMapping("/memberInfo/modify/view/{careerId}")
	public String viewOneCareer(@PathVariable String careerId, Model model) {
		CareerVO careerVO = careerService.getOneCareer(careerId);
		model.addAttribute("careerVO", careerVO);
		return "career/careerview";
	}
	
	/**
	 * 생성
	 */
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
	 
	 /**
	  * 수정
	  */
	 @GetMapping("/memberInfo/modify/update-career/{careerId}")
	 public String updateCareer(@PathVariable String careerId
			 					, Model model
			 					,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		 CareerVO careerVO =careerService.getOneCareer(careerId);
		 careerVO.setGeneralMemberEmail(memberVO.getEmail());
		 model.addAttribute("careerVO", careerVO);
		 
		 return "career/careermodify";
	 }
	
	 @PostMapping("/memberInfo/modify/update-career")
	 public String doUpdateCareer(@ModelAttribute CareerVO careerVO
			 					  ,Model model
			 					 ,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		 careerVO.setGeneralMemberEmail(memberVO.getEmail());
		 boolean isSuccess = careerService.updateOneCarrer(careerVO);
		 if(isSuccess) {
			 return "redirect:/memberInfo/modify/view/"+ careerVO.getCareerId();
		 }
		 else {
			 model.addAttribute("careerVO", careerVO);
			 return "career/careermodify";
		 }
	 }
	 /**
	  * 삭제
	  */
	 @GetMapping("/memberInfo/modify/delete-career/{careerId}")
	 public String doDeleteCareer(@PathVariable String careerId) {
		 boolean isSuccess = careerService.deleteOneCareer(careerId);
		 if(isSuccess) {
			 return "redirect:/memberinfo/view";
		 }
		 else {
			 return "redirect:/memberInfo/modify/view/"+careerId;
		 }
	 }
}

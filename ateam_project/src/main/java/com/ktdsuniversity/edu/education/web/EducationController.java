/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-13
 * 내용 : 경력 Controller입니다.
 */
package com.ktdsuniversity.edu.education.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.education.service.EducationService;
import com.ktdsuniversity.edu.education.vo.EducationVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
@Controller
public class EducationController {
	@Autowired
	private EducationService educationService;
	 
	/**
	 * Education 조회
	 */
	@GetMapping("/memberInfo/educationview/{educationId}")
	public String viewOneEducation(@PathVariable String educationId, Model model) {
		EducationVO educationVO = educationService.getOneEducation(educationId);
		model.addAttribute("educationVO", educationVO);
		return "education/educationview";
	}
	/**
	 * Education 생성
	 */
	
	@GetMapping("/memberInfo/modify/create-education")
	 public String createEducation() {
		 return "education/educationcreate";
	 }
	 @PostMapping("/memberInfo/modify/create-education")
	 public String doCreateEducation(@ModelAttribute EducationVO educationVO
			 					   ,Model model
			 					   ,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		 educationVO.setGeneralMemberEmail(memberVO.getEmail());
		 boolean isSuccess = educationService.createNewEducation(educationVO);
		 if(isSuccess) {
			 model.addAttribute("isSuccess", true);
			 return "redirect:/memberinfo/view";
		 }
		 else {
			 model.addAttribute("educationVO", educationVO);
			 return "education/educationcreate";
		 }
	 }
	 
	 /**
	  * Education 수정
	  */
	 @GetMapping("/memberInfo/modify/update-education/{educationId}")
	 public String updateEducation(@PathVariable String educationId
			 					, Model model
			 					,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		 EducationVO educationVO =educationService.getOneEducation(educationId);
		 if(!educationVO.getGeneralMemberEmail().equals(memberVO.getEmail())){
		 throw new IllegalArgumentException("잘못된 접근입니다");
		 }
		 model.addAttribute("educationVO", educationVO);
		 
		 return "education/educationmodify";
	 }
	
	 @PostMapping("/memberInfo/modify/update-education")
	 public String doUpdateEducation(@ModelAttribute EducationVO educationVO
			 					  ,Model model
			 					 ,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		 boolean isSuccess = educationService.updateOneEducation(educationVO);
		 EducationVO education = educationService.getOneEducation(educationVO.getEducationId());
		 System.out.println(educationVO.getGeneralMemberEmail());
		 if(!education.getGeneralMemberEmail().equals(memberVO.getEmail())){
			 throw new IllegalArgumentException("잘못된 접근입니다");
		 }
		 if(isSuccess) {
			 return "redirect:/memberInfo/educationview/"+ educationVO.getEducationId();
		 }
		 else {
			 model.addAttribute("educationVO", educationVO);
			 return "education/educationmodify";
		 }
	 }
	 /**
	  * Education 삭제
	  */
	 @GetMapping("/memberInfo/modify/delete-education/{educationId}")
	 public String doDeleteEducation(@PathVariable String educationId) {
		 boolean isSuccess = educationService.deleteOneEducation(educationId);
		 if(isSuccess) {
			 return "redirect:/memberinfo/view";
		 }
		 else {
			 return "redirect:/memberInfo/educationview/"+educationId;
		 }
	 }
}

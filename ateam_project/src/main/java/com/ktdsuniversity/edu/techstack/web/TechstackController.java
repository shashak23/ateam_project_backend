/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-18
 * 내용 : 기술스택 Controller
 */
package com.ktdsuniversity.edu.techstack.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.techstack.service.TechstackService;
import com.ktdsuniversity.edu.techstack.vo.TechstackVO;

@Controller
public class TechstackController {
	@Autowired
	private TechstackService techstackService;
	/**
	 * 기술스택 생성 
	 * @return
	 */
	@GetMapping("/memberInfo/modify/create-tech-stack")
	 public String createTechstack() {
		 return "techstack/createtech";
	 }
	 @PostMapping("/memberInfo/modify/create-tech-stack")
	 public String doCreateCareer(@ModelAttribute TechstackVO techstackVO
			 					   ,Model model
			 					   ,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		 techstackVO.setEmail(memberVO.getEmail());
		 if (!techstackVO.getEmail().equals(memberVO.getEmail())) {
				throw new PageNotFoundException("잘못된 접근입니다.");
			}
		 boolean isSuccess = techstackService.createNewTechstack(techstackVO);
		 if(isSuccess) {
			 return "redirect:/memberinfo/view/"+techstackVO.getEmail();
		 }
		 else {
			 model.addAttribute("techstackVO", techstackVO);
			 return "techstack/create-tech";
		 }
	 }
	 @ResponseBody
	 @GetMapping("/techstack/category/{id}")
	 public List<TechstackVO> searchTechstack(@PathVariable String id){
		 return techstackService.techSearch(id);
	 }
	 
	 @GetMapping("/memberInfo/modify/update-tech/{email}")
	 public String updateTechstack(@PathVariable String email
			 					   , Model model
			 					   , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		 List<TechstackVO> techstackVO = techstackService.getAllTechstack(memberVO.getEmail());
		 model.addAttribute("techstackVO", techstackVO);
		 return "techstack/modifytech";
	 }
	 @PostMapping("/memberInfo/modify/update-tech")
	 public String doUpdateTechstack(@ModelAttribute TechstackVO techstackVO
			 					   ,Model model
			 					   ,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		 techstackVO.setEmail(memberVO.getEmail());
		 if (!techstackVO.getEmail().equals(memberVO.getEmail())) {
				throw new PageNotFoundException("잘못된 접근입니다.");
			}
		 boolean isSuccess = techstackService.deleteUpTechstack(techstackVO);
		 if(isSuccess) {
			 return "redirect:/memberinfo/view/"+techstackVO.getEmail();
		 }
		 else {
			 model.addAttribute("techstackVO", techstackVO);
			 return "redirect:/home/main";
		 }
	 }
	 /**
	  * 기술스택 삭제
	  */
	 @GetMapping("/memberInfo/modify/delete-tech/{techstackId}")
		public String deletEmailURL(@PathVariable String techstackId
									,@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
			TechstackVO techstackVO = techstackService.getOneTechstack(techstackId);
			if (!techstackVO.getEmail().equals(memberVO.getEmail())) {
				throw new PageNotFoundException("잘못된 접근입니다.");
			}
			boolean isSuccess = techstackService.deleteTechstack(techstackId);
			if (isSuccess) {
				return "redirect:/memberinfo/view/"+techstackVO.getEmail();
			} else {
				return "redirect:/memberinfo/view/"+techstackVO.getEmail();
			}
		}
}

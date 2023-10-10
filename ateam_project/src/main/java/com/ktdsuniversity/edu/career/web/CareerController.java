package com.ktdsuniversity.edu.career.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ktdsuniversity.edu.career.service.CareerService;
import com.ktdsuniversity.edu.career.vo.CareerVO;

@Controller
public class CareerController {
	@Autowired
	private CareerService careerService;
	 @GetMapping("memberinfo/create")
	 public String viewCreateCareer() {
		 return "career/careercreate";
	 }
	 @PostMapping("memberinfo/create")
	 public String doCreateCareer(@ModelAttribute CareerVO careerVO
			 					   ,Model model) {
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
}

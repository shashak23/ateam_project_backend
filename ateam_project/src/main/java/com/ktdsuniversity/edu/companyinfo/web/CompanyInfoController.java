package com.ktdsuniversity.edu.companyinfo.web;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.beans.SHA;
import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.companyinfo.service.CompanyInfoService;
import com.ktdsuniversity.edu.companymember.vo.CompanyVO;
import com.ktdsuniversity.edu.education.vo.EducationVO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Controller
public class CompanyInfoController {
	
	private Logger logger = LoggerFactory.getLogger(CompanyInfoController.class);

	@Autowired
	private SHA sha;
	@Autowired
	public CompanyInfoService companyInfoService;
	
	@GetMapping("/companyinfo/modify")
	public String companyInfoModify() {
		return "companyinfo/companyinfomodify";
	}
	
	@Transactional
	@PostMapping("/companyinfo/modify")
	public String docompanyInfoModify(@ModelAttribute CompanyVO companyVO
					, @ModelAttribute MemberVO memberVO
					, @SessionAttribute("_LOGIN_USER_") MemberVO loginMemberVO
					, Model model) {
		
		if (companyVO.getContactNumber() != null && companyVO.getContactNumber() != "") {
			companyVO.setCompanyEmail(loginMemberVO.getEmail());
			boolean updateContactNumberisSuccess = companyInfoService.updateCompanyContactNumber(companyVO);
			if (updateContactNumberisSuccess) {
				return "companyinfo/companyinfomodify";	
			}
		}
		if (memberVO.getPw() != null && memberVO.getPw() != "") {
			memberVO.setEmail(loginMemberVO.getEmail());
			
			String salt = loginMemberVO.getSalt();
			String newPassword = memberVO.getPw();
			String encryptedNewPassword = sha.getEncrypt(newPassword, salt);
			memberVO.setPw(encryptedNewPassword);
			
			boolean updateCompanyPasswordisSuccess = companyInfoService.updateCompanyPassword(memberVO);
			if (updateCompanyPasswordisSuccess) {
				return("redirect:/member/auth");					
			}
		}
		
		return "redirect:/member/auth";
		}
	
	@GetMapping("/companyinfo/view")
	public String viewMemberInfo() {
		return "companyinfo/companyprofile";
		
		
	}
	}
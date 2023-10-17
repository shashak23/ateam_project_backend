package com.ktdsuniversity.edu.member.web;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.beans.FileHandler;
import com.ktdsuniversity.edu.beans.FileHandler.StoredFile;
import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.service.MemberService;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.member.vo.validategroup.MemberAuthGroup;
import com.ktdsuniversity.edu.member.vo.validategroup.MemberSignupGroup;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private FileHandler fileHandler;
	
	/**
	 * 로그인 관련
	 */
	@GetMapping("/member/auth")
	public String signIn() {
		return "member/memberlogin";
	}
	@PostMapping("/member/auth")
	public String doSignIn(@Validated(MemberAuthGroup.class) @ModelAttribute MemberVO memberVO
						  , BindingResult bindingResult
						  , @RequestParam(required = false, defaultValue = "/home/main") String next
						  , HttpSession session
						  , Model model) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("memberVO", memberVO);
			return "member/memberlogin";
		}
		
		MemberVO member = memberService.getMember(memberVO);
		session.setAttribute("_LOGIN_USER_", member);
		return "redirect:" + next;
	}
	@GetMapping("member/logout")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/home/main";
	}
	
	/**
	 * 회원가입 관련
	 */
	@GetMapping("/member/signup")
	public String memberSignUp() {
		return "member/membersignup";
	}
	@PostMapping("/member/signup")
	public String doMemberSignUp(@Validated(MemberSignupGroup.class)
							   @ModelAttribute GeneralMemberVO generalMemberVO
							   , BindingResult bindingResult
							   , Model model) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("memberVO", generalMemberVO);
			return "member/membersignup";
		}
		boolean isSuccess = memberService.createNewMember(generalMemberVO);
		if(isSuccess) {
			return("redirect:/member/auth");
		}
		model.addAttribute("memberVO", generalMemberVO);
		return "member/membersignup";
	}
	
	/**
	 * 검증관련
	 */
	@ResponseBody 
	@GetMapping("/member/signup/vaildation")
	public Map<String, Object> checkAvailability(@RequestParam(required = false) String email
												,@RequestParam(required = false) String nickname){
		Map<String, Object> responseMap = new HashMap<>();

		if(email != null) {
			boolean isAvailableEmail = memberService.checkAvailableEmail(email);
			responseMap.put("email", email);
			responseMap.put("available", isAvailableEmail);
		}
		if(nickname!= null) {
			boolean isAvailableNickname= memberService.checkAvailableNickname(nickname);
			responseMap.put("nickname",nickname);
			responseMap.put("available", isAvailableNickname);
		}
		return responseMap;
	}
	/**
	 * 파일 수정
	 */
	@GetMapping("/memberInfo/modify/update-profile-pic/{email}")
	public String updateProfilePic(@PathVariable String email
								, Model model) {
		
		MemberVO memberVO = memberService.getSelectMember(email);
		model.addAttribute("memberVO", memberVO);
		return "mypage/modifymyprofiepic";
	}
    @PostMapping("/memberInfo/modify/update-profile-pic")
    public String doUpdateProfilePic(@ModelAttribute MemberVO memberVO, Model model,
            @RequestParam("file") MultipartFile file) {
        // 파일 업로드 및 경로를 profilePic 필드에 저장
        if (file != null && !file.isEmpty()) {
            StoredFile storedFile = fileHandler.storeFile(file);
            memberVO.setProfilePic(storedFile.getRealFileName());
        }

        boolean isSuccess = memberService.updateMyprofilePic(memberVO, file);

        if (isSuccess) {
            return "redirect:/memberInfo/modify/update-profile-pic/" + memberVO.getEmail();
        } else {
            // 실패 시 적절한 에러 핸들링
            model.addAttribute("memberVO", memberVO);
            return "mypage/modifymyprofilepic";
        }
    }

}

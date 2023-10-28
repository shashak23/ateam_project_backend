/**
 * 작성자: 김광원
 * 수정자: 신진영(2023-10-19)
 * 수정자: 장보늬(2023-10-20)
 * 수정자: 김광원(2023-10-21)
 * 작성일자: 2023-10-19
 * 내용: 
 */
package com.ktdsuniversity.edu.member.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.beans.FileHandler;
import com.ktdsuniversity.edu.beans.SHA;
import com.ktdsuniversity.edu.companymember.vo.CompanyVO;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsVO;
import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import com.ktdsuniversity.edu.member.service.MemberService;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.member.vo.validategroup.MemberAuthGroup;
import com.ktdsuniversity.edu.member.vo.validategroup.MemberEditNickGroup;
import com.ktdsuniversity.edu.member.vo.validategroup.MemberEditPWGroup;
import com.ktdsuniversity.edu.member.vo.validategroup.MemberSignupGroup;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private SHA sha;
	@Autowired
	private FileHandler fileHandler;
	private Logger log = LoggerFactory.getLogger(MemberController.class);

	@GetMapping("/member/{memberType}")
	@ResponseBody
	public List<MemberVO> searchNickName(@PathVariable String memberType) {
		return memberService.searchMember(memberType);
	}

	/**
	 * 로그인 관련
	 */

	@GetMapping("/member/auth")
	public String signIn() {
		return "member/memberlogin";
	}

	@PostMapping("/member/auth")
	public String doSignIn(@Validated(MemberAuthGroup.class) @ModelAttribute MemberVO memberVO,
			BindingResult bindingResult, @RequestParam(required = false, defaultValue = "/home/home") String next,
			HttpSession session, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("memberVO", memberVO);
			return "member/memberlogin";
		}

		MemberVO member = memberService.getMember(memberVO);
		System.out.println(member.getEmail());
		session.setAttribute("_LOGIN_USER_", member);
		return "home/home";
	}

	/**
	 * 로그아웃
	 */
	@GetMapping("/member/logout")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/home/home";
	}

	/**
	 * 회원탈퇴
	 */
	@GetMapping("/member/withdraw")
	public String doWithdraw(HttpSession session, @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		session.invalidate();
		memberService.withdrawMember(memberVO);
		return "redirect:/home/home";
	}

	/**
	 * 회원가입 관련
	 */
	@GetMapping("/member/signup")
	public String memberSignUp() {
		return "member/membersignup";
	}

	@PostMapping("/member/signup")
	public String doMemberSignUp(@Validated(MemberSignupGroup.class) @ModelAttribute GeneralMemberVO generalMemberVO,
			BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("memberVO", generalMemberVO);
			return "member/membersignup";
		}
		boolean isSuccess = memberService.createNewMember(generalMemberVO);
		if (isSuccess) {
			return "redirect:/member/auth";
		}
		model.addAttribute("memberVO", generalMemberVO);
		return "member/membersignup";
	}

	/**
	 * 검증관련
	 */
	@ResponseBody
	@GetMapping("/member/signup/vaildation")
	public Map<String, Object> checkAvailability(@RequestParam(required = false) String email,
			@RequestParam(required = false) String nickname) {
		Map<String, Object> responseMap = new HashMap<>();

		if (email != null) {
			boolean isAvailableEmail = memberService.checkAvailableEmail(email);
			responseMap.put("email", email);
			responseMap.put("available", isAvailableEmail);
		}
		if (nickname != null) {
			boolean isAvailableNickname = memberService.checkAvailableNickname(nickname);
			responseMap.put("nickname", nickname);
			responseMap.put("available", isAvailableNickname);
		}
		return responseMap;
	}

	/**
	 * 프로필 사진 조회
	 */
	@GetMapping("/memberinfo/profilePicview/{email}")
	public String viewOneProfilePic(@PathVariable String email, Model model) {
		MemberVO memberVO = memberService.getOneFile(email);
		model.addAttribute("memberVO", memberVO);
		return "mypage/profilepicview";
	}
	/**
	 * 기업회원 가입
	 */
	@GetMapping("/member/companysignup")
	public String companyMemberSignUp() {
		return "member/companyregist";
	}

	@PostMapping("/member/companysignup")
	public String doCompanyMemberSignUp(@Valid @ModelAttribute CompanyVO companyVO, Model model,
			BindingResult bindingResult, @RequestParam MultipartFile file) {

		if (bindingResult.hasErrors()) {
			model.addAttribute("companyVO", companyVO);
			return "member/companysignup";
		}

		boolean isSuccess = memberService.createNewCompanyMember(companyVO, file);

		if (isSuccess) {
			return ("redirect:/member/auth");
		}
		model.addAttribute("companyVO", companyVO);
		return "member/membersignup";
	}

	/**
	 * 기업회원 검증
	 */
//	@ResponseBody 
//	@GetMapping("/member/companysignup/vaildation")
//	public Map<String, Object> checkAvailableCompanyEmail(@RequestParam String email){
//		
//		boolean isAvailableCompanyEmail = memberService.checkAvailableCompanyEmail(email);
//		
//		Map<String, Object> responseMap = new HashMap<>();
//
//		responseMap.put("comapnyEmail", email);
//		responseMap.put("available", isAvailableCompanyEmail);
//
//		return responseMap;
//	}
	/**
	 * 일반회원 조회
	 */
	@GetMapping("/member/selectmember/{email}")
	public String viewOneMember(@PathVariable String email, Model model) {
		MemberVO memberVO = memberService.selectMemberinfo(email);
		model.addAttribute("memberVO", memberVO);
		return "member/editmemberinfo/viewmember";
	}

	/**
	 * 일반회원 닉네임 수정
	 */
	@GetMapping("/memberInfo/modify/update-nickname/{email}")
	public String updateNickname(@PathVariable String email, Model model
								 ,@SessionAttribute("_LOGIN_USER_") MemberVO loginMemberVO) {
		MemberVO memberVO = memberService.selectMemberinfo(email);
		if (!memberVO.getEmail().equals(loginMemberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		model.addAttribute("memberVO", memberVO);
		return "member/editmemberinfo/modifymembernick";
	}

	@PostMapping("/memberInfo/modify/update-nickname")
	public String doUpdateNickname(@Validated(MemberEditNickGroup.class) @ModelAttribute MemberVO memberVO,
									BindingResult bindingResult, Model model
									,@SessionAttribute("_LOGIN_USER_") MemberVO loginMemberVO) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("memberVO", memberVO);
			return "member/editmemberinfo/modifymembernick";
		}
		if (!memberVO.getEmail().equals(loginMemberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		boolean isSuccess = memberService.updateMemberNickname(memberVO);
		if (isSuccess) {
			return "redirect:/member/selectmember/" + memberVO.getEmail();
		} else {
			model.addAttribute("memberVO", memberVO);
			return "member/editmemberinfo/modifymembernick";
		}
	}

	/**
	 * 일반회원 검증
	 */
	@ResponseBody
	@GetMapping("/memberInfo/modify/update-nickname/vaildation")
	public Map<String, Object> nickcheckAvailability(@RequestParam String nickname) {
		Map<String, Object> responseMap = new HashMap<>();
		if (nickname != null) {
			boolean isAvailableNickname = memberService.checkAvailableNickname(nickname);
			responseMap.put("nickname", nickname);
			responseMap.put("available", isAvailableNickname);
		}
		return responseMap;
	}

	/**
	 * 일반회원 비밀번호 수정
	 */
	@GetMapping("/memberInfo/modify/update-password/{email}")
	public String updatePassword(@PathVariable String email
								, Model model
								, @SessionAttribute("_LOGIN_USER_") MemberVO loginMemberVO) {
		MemberVO memberVO = memberService.selectMemberinfo(email);
		if (!memberVO.getEmail().equals(loginMemberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		model.addAttribute("memberVO", memberVO);
		return "member/editmemberinfo/modifymemberpw";
	}

	@PostMapping("/memberInfo/modify/update-password")
	public String doUpdatePassword(@Validated(MemberEditPWGroup.class) @ModelAttribute MemberVO memberVO
									,BindingResult bindingResult
									,Model model
									,@SessionAttribute("_LOGIN_USER_") MemberVO loginMemberVO
									,HttpSession session) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("memberVO", memberVO);
			return "member/editmemberinfo/modifymemberpw";
		}
		if (!memberVO.getEmail().equals(loginMemberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		if (memberVO.getPw() != null && memberVO.getPw() != "") {
			memberVO.setEmail(loginMemberVO.getEmail());

			String salt = loginMemberVO.getSalt();
			String newPassword = memberVO.getPw();
			String encryptedNewPassword = sha.getEncrypt(newPassword, salt);
			memberVO.setPw(encryptedNewPassword);

			boolean isSuccess = memberService.updateMemberPW(memberVO);
			if (isSuccess) {
				session.invalidate();
				return ("redirect:/home/main");
			}
		}
		return "member/editmemberinfo/modifymemberpw";
	}
	/**
	 * 일반회원 프로필사진 수정
	 */
	@GetMapping("/memberInfo/modify/modify-profile-pic/{email}")
	public String createProfilePic(@PathVariable String email
								   , Model model
								   , @SessionAttribute("_LOGIN_USER_") MemberVO loginMemberVO) {
		MemberVO memberVO = memberService.selectMemberinfo(email);
		memberVO.setEmail(loginMemberVO.getEmail());
		if (!memberVO.getEmail().equals(loginMemberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		model.addAttribute("memberVO", memberVO);
		return "mypage/profilepic/modifyprofilepic";
	}
	
	@PostMapping("/memberInfo/modify/modify-profile-pic")
	public ModelAndView doCreateProfilePic(@ModelAttribute MemberVO memberVO
			                       			, @RequestParam MultipartFile file
			                       			, @SessionAttribute("_LOGIN_USER_") MemberVO loginMemberVO) {
		memberVO.setEmail(loginMemberVO.getEmail());
		if (!memberVO.getEmail().equals(loginMemberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		ModelAndView modelAndView = new ModelAndView();
		
		boolean isSuccess = memberService.updateOneFile(memberVO, file);
		if (isSuccess) {
			modelAndView.setViewName("redirect:/memberinfo/view/"+memberVO.getEmail());
			return modelAndView;
		}
		else {
			modelAndView.setViewName("mypage/profilepic/modifyprofilepic");
			modelAndView.addObject("memberVO", memberVO);
			return modelAndView;
		}
	}
	/**
	 * 파일다운로드
	 */
	@GetMapping("/member/file/download/{email}")
	public ResponseEntity<Resource> downloadFile (@PathVariable String email) {
		
		// 파일 정보를 얻어오기 위해 게시글을 조회한다.
		MemberVO memberVO = memberService.getOneFile(email);
		if(memberVO == null) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		// 서버에 등록되어있는 파일을 가져온다.
		File storedFile = fileHandler.getStoredFile(memberVO.getProfilePic());
		
		return fileHandler.getResponseEntity(storedFile, 
                                             memberVO.getProfilePic());
	}
	/**
	 * 프로필사진 삭제
	 */
	@GetMapping("/memberInfo/modify/delete-profile-pic/{email}")
	public String deletProfile(@PathVariable String email
							   ,@SessionAttribute("_LOGIN_USER_") MemberVO loginMemberVO) {
		MemberVO member = memberService.selectMemberinfo(email);
		if (!member.getEmail().equals(loginMemberVO.getEmail())) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		boolean isSuccess = memberService.deleteProfile(email);
		if (isSuccess) {
			return "redirect:/memberInfo/modify/modify-profile-pic/"+ email;
		} else {
			return "redirect:/memberInfo/modify/modify-profile-pic/"+ email;
		}
	}
	
}

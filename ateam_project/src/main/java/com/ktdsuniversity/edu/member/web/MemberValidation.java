package com.ktdsuniversity.edu.member.web;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktdsuniversity.edu.member.service.MemberService;

@Controller
public class MemberValidation {
	@Autowired
	private MemberService memberService;
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
}

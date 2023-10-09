package com.ktdsuniversity.edu.memberinfo.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberInfoModify {
 @GetMapping("memberinfo/view")
 public String viewMypage() {
	 return "myPage/myProfile";
 }
}

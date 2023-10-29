package com.ktdsuniversity.edu.follow.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.follow.service.FollowService;
import com.ktdsuniversity.edu.follow.vo.FollowVO;
import com.ktdsuniversity.edu.follow.vo.SearchFollowVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public class FollowController {
	
	@Autowired
	private FollowService followService;
	
	
	
	@PostMapping("/follow/member")
	public String doFollowMember(@ModelAttribute FollowVO followVO 
			                   , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		followVO.setFollower(memberVO.getEmail());
		SearchFollowVO searchFollowVO = new SearchFollowVO();
		searchFollowVO.setEmail(followVO.getFollowee());
		
		// 북마크 참고하여 작성
		boolean isSuccess = followService.follow(followVO);
		
		return null;
	}

}

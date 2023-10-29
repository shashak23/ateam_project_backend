package com.ktdsuniversity.edu.follow.web;

import java.util.HashMap;
import java.util.Map;

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
	public Map<String, Object> doFollowMember(@ModelAttribute FollowVO followVO 
			                   , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		followVO.setFollower(memberVO.getEmail());
		SearchFollowVO searchFollowVO = new SearchFollowVO();
		searchFollowVO.setEmail(followVO.getFollowee());
		
		followService.unFollow(searchFollowVO);
		
		Map<String, Object> resultMap = new HashMap<>();

		boolean isSuccess = followService.doFollow(followVO);
		
		String followId = followService.getFollowStatus(searchFollowVO).getFollowId();
		
		resultMap.put("result", isSuccess);
		resultMap.put("followId", followId);
		return resultMap;
	}
	
	@PostMapping("/unfollow/member")
	public Map<String, Object> unFollowMember(@ModelAttribute FollowVO followVO 
			                   , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		
		boolean isSuccess = followService.toggleFollower(followVO.getFollowId());
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", isSuccess);
		return resultMap;
	}

}

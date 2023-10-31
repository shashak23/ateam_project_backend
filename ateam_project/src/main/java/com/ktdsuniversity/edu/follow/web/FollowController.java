package com.ktdsuniversity.edu.follow.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.follow.service.FollowService;
import com.ktdsuniversity.edu.follow.vo.FollowVO;
import com.ktdsuniversity.edu.follow.vo.SearchFollowVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@RestController
public class FollowController {
	
	@Autowired
	private FollowService followService;
	
	@PostMapping("/follow/member")
	public Map<String, Object> doFollowMember(@ModelAttribute FollowVO followVO 
			                   , @SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		
		followVO.setFollower(followVO.getFollower());
		followVO.setFollowee(followVO.getFollowee());
		
		SearchFollowVO searchFollowVO = new SearchFollowVO();
		searchFollowVO.setFollowerEmail(followVO.getFollower());
		searchFollowVO.setFolloweeEmail(followVO.getFollowee());
		
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
	
	// 메인화면 팔로우 조회용
	@GetMapping("/follow/status/{followerEmail}/{followeeEmail}")
	public FollowVO getFollowStatus(@PathVariable String followerEmail
			                      , @PathVariable String followeeEmail) {
		SearchFollowVO searchFollowVO = new SearchFollowVO();
		searchFollowVO.setFollowerEmail(followerEmail);
		searchFollowVO.setFolloweeEmail(followeeEmail);
		
		return followService.getFollowStatus(searchFollowVO);
	}

}

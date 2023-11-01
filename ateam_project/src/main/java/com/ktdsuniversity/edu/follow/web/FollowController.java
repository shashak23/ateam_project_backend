/**
 * 작성자: 장보늬
 * 작성일자: 2023-11-01
 */
package com.ktdsuniversity.edu.follow.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ktdsuniversity.edu.follow.service.FollowService;
import com.ktdsuniversity.edu.follow.vo.FollowListVO;
import com.ktdsuniversity.edu.follow.vo.FollowVO;
import com.ktdsuniversity.edu.follow.vo.SearchFollowVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@RestController
public class FollowController {
	
	private Logger logger = LoggerFactory.getLogger(FollowController.class);
	
	@Autowired
	private FollowService followService;
	
	// 팔로워 조회
	@GetMapping("/member/getfollowers")
	public Map<String, Object> getAllFollowers(@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		FollowListVO followListVO = followService.getAllFollower(memberVO.getEmail());
		List<FollowVO> followerList = followListVO.getFollowList();
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("count", followerList.size());
		resultMap.put("followerList", followerList);
		
		return resultMap;
	}
	
	// 팔로잉 조회
	@GetMapping("/member/getfollowees")
	public Map<String, Object> getAllFollowees(@SessionAttribute("_LOGIN_USER_") MemberVO memberVO) {
		FollowListVO followListVO = followService.getAllFollowee(memberVO.getEmail());
		List<FollowVO> followeeList = followListVO.getFollowList();
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("count", followeeList.size());
		resultMap.put("followeeList", followeeList);
		
		return resultMap;
	}
	
	// 특정 회원의 팔로워 조회
	@GetMapping("/member/getfollowers/{email}")
	public Map<String, Object> getFollowers(@PathVariable String email) {
		FollowListVO followListVO = followService.getAllFollower(email);
		
		List<FollowVO> followerList = followListVO.getFollowList();
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("count", followerList.size());
		resultMap.put("followerList", followerList);
		
		return resultMap;
	}
	
	// 특정 회원의 팔로잉 조회
	@GetMapping("/member/getfollowees/{email}")
	public Map<String, Object> getFollowees(@PathVariable String email) {
		FollowListVO followListVO = followService.getAllFollowee(email);
		List<FollowVO> followeeList = followListVO.getFollowList();
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("count", followeeList.size());
		resultMap.put("followeeList", followeeList);
		
		return resultMap;
	}
	
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

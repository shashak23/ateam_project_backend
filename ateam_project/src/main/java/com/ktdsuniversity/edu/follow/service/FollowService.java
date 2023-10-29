package com.ktdsuniversity.edu.follow.service;

import com.ktdsuniversity.edu.follow.vo.FollowListVO;
import com.ktdsuniversity.edu.follow.vo.FollowVO;
import com.ktdsuniversity.edu.follow.vo.SearchFollowVO;

public interface FollowService {
	
	public boolean doFollow(FollowVO followVO);
	public boolean unFollow(SearchFollowVO searchFollowVO);
	public boolean toggleFollower(String followId);
	public FollowListVO getAllFollower(String email);
	public FollowListVO getAllFollowee(String eamil);
	public FollowVO getFollowStatus(SearchFollowVO searchFollowVO);

}

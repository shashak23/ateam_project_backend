/**
 * 작성자: 장보늬
 * 작성일자: 2023-11-01
 */
package com.ktdsuniversity.edu.follow.service;

import java.util.List;

import com.ktdsuniversity.edu.follow.vo.FollowListVO;
import com.ktdsuniversity.edu.follow.vo.FollowVO;
import com.ktdsuniversity.edu.follow.vo.SearchFollowVO;

public interface FollowService {
	
	public boolean doFollow(FollowVO followVO);
	public boolean unFollow(SearchFollowVO searchFollowVO);
	public boolean toggleFollower(String followId);
	public FollowListVO getAllFollower(String email);
	public FollowListVO getAllFollowee(String email);
	public FollowVO getFollowStatus(SearchFollowVO searchFollowVO);

}

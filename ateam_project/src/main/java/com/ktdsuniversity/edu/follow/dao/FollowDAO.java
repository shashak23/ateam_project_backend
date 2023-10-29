package com.ktdsuniversity.edu.follow.dao;

import java.util.List;

import com.ktdsuniversity.edu.follow.vo.FollowVO;

public interface FollowDAO {
	
	// 팔로워 전체 조회
	public List<FollowVO> getAllFollower(String email);
	
	// 팔로잉 전체 조회
	public List<FollowVO> getAllFollowee(String email);
	
	
	
	public int follow(FollowVO followVO);
	
	public int unFollow(FollowVO followVO);

}

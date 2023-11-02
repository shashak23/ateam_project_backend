/**
 * 작성자: 장보늬
 * 작성일자: 2023-11-01
 */
package com.ktdsuniversity.edu.follow.dao;

import java.util.List;

import com.ktdsuniversity.edu.follow.vo.FollowVO;
import com.ktdsuniversity.edu.follow.vo.SearchFollowVO;

public interface FollowDAO {
	
	// 팔로워 전체 조회
	public List<FollowVO> getAllFollower(String email);
	
	// 팔로잉 전체 조회
	public List<FollowVO> getAllFollowee(String email);
	
	public FollowVO getFollowStatus(SearchFollowVO searchFollowVO);

	public int doFollow(FollowVO followVO);
	
	public int unFollow(SearchFollowVO searchFollowVO);
	
	public int toggleFollower(String followId);
}

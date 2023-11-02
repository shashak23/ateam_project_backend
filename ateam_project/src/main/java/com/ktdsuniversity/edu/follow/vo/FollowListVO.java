/**
 * 작성자: 장보늬
 * 작성일자: 2023-11-01
 */
package com.ktdsuniversity.edu.follow.vo;

import java.util.List;

public class FollowListVO {
	
	private int followCnt;
	private List<FollowVO> followList;
	
	public int getFollowCnt() {
		return followCnt;
	}
	public void setFollowCnt(int followCnt) {
		this.followCnt = followCnt;
	}
	public List<FollowVO> getFollowList() {
		return followList;
	}
	public void setFollowList(List<FollowVO> followList) {
		this.followList = followList;
	}
	

	
}

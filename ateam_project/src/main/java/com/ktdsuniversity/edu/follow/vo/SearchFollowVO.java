/**
 * 작성자: 장보늬
 * 작성일자: 2023-11-01
 */
package com.ktdsuniversity.edu.follow.vo;

public class SearchFollowVO {
	
	private String followerEmail;
	private String followeeEmail;
	
	public String getFollowerEmail() {
		return followerEmail;
	}
	public void setFollowerEmail(String followerEmail) {
		this.followerEmail = followerEmail;
	}
	public String getFolloweeEmail() {
		return followeeEmail;
	}
	public void setFolloweeEmail(String followeeEmail) {
		this.followeeEmail = followeeEmail;
	}
}

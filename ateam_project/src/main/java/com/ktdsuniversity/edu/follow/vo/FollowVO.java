package com.ktdsuniversity.edu.follow.vo;

import com.ktdsuniversity.edu.member.vo.MemberVO;

public class FollowVO {
	
	private String followId;
	private String follower;
	private String followee;
	
	private MemberVO memberVO;
	
	public String getFollowId() {
		return followId;
	}
	public void setFollowId(String followId) {
		this.followId = followId;
	}
	public String getFollower() {
		return follower;
	}
	public void setFollower(String follower) {
		this.follower = follower;
	}
	public String getFollowee() {
		return followee;
	}
	public void setFollowee(String followee) {
		this.followee = followee;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	

}

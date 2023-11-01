/**
 * 작성자: 장보늬
 * 작성일자: 2023-11-01
 */
package com.ktdsuniversity.edu.follow.vo;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public class FollowVO {
	
	private String followId;
	private String follower;
	private String followee;
	private String followYn;
	
	private MemberVO memberVO;
	
	private GeneralPostVO generalPostVO;
	
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
	public String getFollowYn() {
		return followYn;
	}
	public void setFollowYn(String followYn) {
		this.followYn = followYn;
	}
	public GeneralPostVO getGeneralPostVO() {
		return generalPostVO;
	}
	public void setGeneralPostVO(GeneralPostVO generalPostVO) {
		this.generalPostVO = generalPostVO;
	}
	
	
	

}

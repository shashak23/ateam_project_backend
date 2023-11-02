package com.ktdsuniversity.edu.admin.vo;

import com.ktdsuniversity.edu.tier.TierVO;

public class AdminTierVO {
	
	private String memberEmail;
	private String score;
	private String nowTier;
	private String nextTier;
	
	private TierVO tierVO;
	private TierVO tierVOTemp;
	
	
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getNowTier() {
		return nowTier;
	}
	public void setNowTier(String nowTier) {
		this.nowTier = nowTier;
	}
	public String getNextTier() {
		return nextTier;
	}
	public void setNextTier(String nextTier) {
		this.nextTier = nextTier;
	}
	public TierVO getTierVO() {
		return tierVO;
	}
	public void setTierVO(TierVO tierVO) {
		this.tierVO = tierVO;
	}
	public TierVO getTierVOTemp() {
		return tierVOTemp;
	}
	public void setTierVOTemp(TierVO tierVOTemp) {
		this.tierVOTemp = tierVOTemp;
	}
	
}

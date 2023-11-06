package com.ktdsuniversity.edu.tier;

import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public class TierVO {
	
	private String tierId;
	private String tierName;
	private int tierCriteriaScore;
	private String tierImageUrl;
	private String tierIdTemp;
	private String tierNameTemp;
	private int tierCriteriaScoreTemp;
	private String tierImageUrlTemp;
	
	private MemberVO memberVO;
	private GeneralMemberVO generalMemberVO;
	
	
	public String getTierId() {
		return tierId;
	}
	public void setTierId(String tierId) {
		this.tierId = tierId;
	}
	public String getTierName() {
		return tierName;
	}
	public void setTierName(String tierName) {
		this.tierName = tierName;
	}
	public int getTierCriteriaScore() {
		return tierCriteriaScore;
	}
	public void setTierCriteriaScore(int tierCriteriaScore) {
		this.tierCriteriaScore = tierCriteriaScore;
	}
	public String getTierImageUrl() {
		return tierImageUrl;
	}
	public void setTierImageUrl(String tierImageUrl) {
		this.tierImageUrl = tierImageUrl;
	}
	public String getTierIdTemp() {
		return tierIdTemp;
	}
	public void setTierIdTemp(String tierIdTemp) {
		this.tierIdTemp = tierIdTemp;
	}
	public String getTierNameTemp() {
		return tierNameTemp;
	}
	public void setTierNameTemp(String tierNameTemp) {
		this.tierNameTemp = tierNameTemp;
	}
	public int getTierCriteriaScoreTemp() {
		return tierCriteriaScoreTemp;
	}
	public void setTierCriteriaScoreTemp(int tierCriteriaScoreTemp) {
		this.tierCriteriaScoreTemp = tierCriteriaScoreTemp;
	}
	public String getTierImageUrlTemp() {
		return tierImageUrlTemp;
	}
	public void setTierImageUrlTemp(String tierImageUrlTemp) {
		this.tierImageUrlTemp = tierImageUrlTemp;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public GeneralMemberVO getGeneralMemberVO() {
		return generalMemberVO;
	}
	public void setGeneralMemberVO(GeneralMemberVO generalMemberVO) {
		this.generalMemberVO = generalMemberVO;
	}
	
}

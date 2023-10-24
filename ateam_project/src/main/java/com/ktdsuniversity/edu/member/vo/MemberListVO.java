/**
 * 작성자: 장보늬(2023-10-23)
 * **/
package com.ktdsuniversity.edu.member.vo;

import java.util.List;

public class MemberListVO {
	
	private int memberCnt;
	private List<MemberVO> memberList;
	public int getMemberCnt() {
		return memberCnt;
	}
	public void setMemberCnt(int memberCnt) {
		this.memberCnt = memberCnt;
	}
	public List<MemberVO> getMemberList() {
		return memberList;
	}
	public void setMemberList(List<MemberVO> memberList) {
		this.memberList = memberList;
	}
	
	

}

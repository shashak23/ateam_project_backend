package com.ktdsuniversity.edu.member.service;

import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface MemberService {
	public boolean createNewMember(MemberVO memberVO, GeneralMemberVO generalMemberVO);
	public boolean checkAvailableEmail(String email);
	public boolean checkAvailableNickname(String nickname);
	
	public MemberVO getMember(MemberVO memberVO);
}

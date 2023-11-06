package com.ktdsuniversity.edu.admin.service;

import com.ktdsuniversity.edu.admin.vo.AdminTierListVO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.tier.TierVO;

public interface TierService {
	
	/**
	 * 
	 * @return 모든 티어 승급 대상 회원 목록과 수
	 */
	public AdminTierListVO getTierMemberAllList();
	
	/**
	 * 티어 승급된 회원의 tierId와 tierDate 변경
	 * @param generalMemberVO 티어 승급된 회원의 정보
	 * @return
	 */
	public boolean doUpdateTierMember (GeneralMemberVO generalMemberVO);
	
	/**
	 * 멤버의 현재 티어를 조회한다.
	 * @return 멤버의 이메일, 닉네임, 티어
	 */
	public TierVO getMemberAndTier(String email);
}

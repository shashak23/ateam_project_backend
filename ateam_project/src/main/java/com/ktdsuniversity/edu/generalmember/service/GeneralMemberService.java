package com.ktdsuniversity.edu.generalmember.service;

import java.util.List;

import com.ktdsuniversity.edu.career.vo.CareerVO;

public interface GeneralMemberService {
	/**
	 * 조회
	 */
	public List<CareerVO> getAllCareerListByMemberEmail(String generalMemberEmail);
}

package com.ktdsuniversity.edu.generalmember.service;

import java.util.List;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;

public interface GeneralMemberService {
	/**
	 * 경력 조회
	 */
	public List<CareerVO> getAllCareerListByMemberEmail(String generalMemberEmail);
	
	/**
	 * 주소 조회
	 */
	public GeneralMemberVO getOneAddress(String generalMemberEmail);
	/**
	 * 주소 수정
	 */
	public boolean updateOneAddress(GeneralMemberVO generalMemberVO);
}

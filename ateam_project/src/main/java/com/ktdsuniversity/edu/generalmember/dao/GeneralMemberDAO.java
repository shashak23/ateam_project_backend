package com.ktdsuniversity.edu.generalmember.dao;

import java.util.List;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;

public interface GeneralMemberDAO {
	public int createNewGeneralMember(GeneralMemberVO generalMemberVO);
		/**
		 * 전체 조회
		 */
		public List<CareerVO> getAllCareerListByMemberEmail(String generalMemberEmail);
}

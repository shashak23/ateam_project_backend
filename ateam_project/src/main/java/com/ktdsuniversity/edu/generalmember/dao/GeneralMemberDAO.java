package com.ktdsuniversity.edu.generalmember.dao;

import java.util.List;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;

public interface GeneralMemberDAO {
	public int createNewGeneralMember(GeneralMemberVO generalMemberVO);
		/**
		 * 경력 전체 조회
		 */
		public List<CareerVO> getAllCareerListByMemberEmail(String generalMemberEmail);
		
		/**
		 * 주소 조회
		 */
		public GeneralMemberVO getOneAddress(String generalMemberEmail);
		/**
		 * 수정
		 */
		public int updateOneAddress(GeneralMemberVO generalMemberVO);
}

package com.ktdsuniversity.edu.generalmember.dao;

import java.util.List;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface GeneralMemberDAO {
	public int createNewGeneralMember(GeneralMemberVO generalMemberVO);
		/**
		 * 경력 전체 조회
		 */
		public List<CareerVO> getAllCareerListByMemberEmail(String generalMemberEmail);
		/**
		 * 일반회원 전체 조회
		 */
		public List<GeneralMemberVO> getAllGeeralMemberList(String generalMemberEmail);
		
		/**
		 * 일반회원 닉네임 조회
		 */
		public MemberVO getSelectNickname(String generalMemberEmail);
		/**
		 * 일반회원 컬럼 조회
		 */
		public GeneralMemberVO getSelectGeneralMember(String generalMemberEmail);
		
		/**
		 * 주소 수정
		 */
		public int updateOneAddress(GeneralMemberVO generalMemberVO);
		
		/**
		 * 주소 삭제
		 */
		public int deleteOneAddress(String generalMemberEmail);
		
		/**
		 * SNS 수정
		 */
		public int updateSns(GeneralMemberVO generalMemberVO);
	
		/**
		 * github 삭제
		 */
		public int deleteGithub(String generalMemberEmail);
		/**
		 * email 삭제
		 */
		public int deleteEmail(String generalMemberEmail);
		/**
		 * blog 삭제
		 */
		public int deleteBlog(String generalMemberEmail);
		
		/**
		 * 소개글 수정
		 */
		public int updateselfIntro(GeneralMemberVO generalMemberVO);
		
		/**
		 * blog 삭제
		 */
		public int deleteSelfIntro(String generalMemberEmail);
}

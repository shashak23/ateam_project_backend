/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-14
 * 수정일자 : 2023-10-25 수정자(김광원)
 * 내용 : 일반회원을 위한 ServiceImpl입니다.
 */
package com.ktdsuniversity.edu.generalmember.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.beans.FileHandler;
import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.education.vo.EducationVO;
import com.ktdsuniversity.edu.generalmember.dao.GeneralMemberDAO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.techstack.vo.TechstackVO;

@Service
public class GeneralMemberServiceImpl implements GeneralMemberService {
	@Autowired
	private GeneralMemberDAO generalMemberDAO;
	@Autowired
	private FileHandler fileHandler;

	/**
	 * 경력 리스트
	 */
	@Override
	public List<CareerVO> getAllCareerListByMemberEmail(String generalMemberEmail) {
		return generalMemberDAO.getAllCareerListByMemberEmail(generalMemberEmail);
	}

	/**
	 * 일반회원 컬럼리스트
	 */
	@Override
	public List<GeneralMemberVO> getAllGeeralMemberList(String generalMemberEmail) {
		return generalMemberDAO.getAllGeeralMemberList(generalMemberEmail);
	}

	/**
	 * 경력회원 리스트
	 */
	@Override
	public List<EducationVO> getAllEducationList(String generalMemberEmail) {
		return generalMemberDAO.getAllEducationList(generalMemberEmail);
	}

	/**
	 * member 조회
	 */
	@Override
	public MemberVO getSelectNickname(String generalMemberEmail) {
		return generalMemberDAO.getSelectNickname(generalMemberEmail);
	}
	/**
	 * 기술스택 조회
	 */
	@Override
	public List<CommonCodeVO> getSelectCommonCode(String generalMemberEmail) {
		return generalMemberDAO.getSelectCommonCode(generalMemberEmail);
	}
	/**
	 * 일반회원 조회
	 */
	@Override
	public GeneralMemberVO getSelectGeneralMember(String generalMemberEmail) {
		GeneralMemberVO generalMemberVO = generalMemberDAO.getSelectGeneralMember(generalMemberEmail);
		return generalMemberVO;
	}

	/**
	 * 주소 수정
	 */
	@Override
	public boolean updateOneAddress(GeneralMemberVO generalMemberVO) {
		int updateCount = generalMemberDAO.updateOneAddress(generalMemberVO);
		return updateCount > 0;
	}

	/**
	 * 주소 삭제
	 */
	@Override
	public boolean deleteOneAddress(String generalMemberEmail) {
		int deleteCount = generalMemberDAO.deleteOneAddress(generalMemberEmail);
		return deleteCount > 0;
	}

	/**
	 * SNS수정
	 */
	@Override
	public boolean updateSns(GeneralMemberVO generalMemberVO) {
		int updateCount = generalMemberDAO.updateSns(generalMemberVO);
		return updateCount > 0;
	}

	/**
	 * git삭제
	 */
	@Override
	public boolean deleteGithub(String generalMemberEmail) {
		int deleteCount = generalMemberDAO.deleteGithub(generalMemberEmail);
		return deleteCount > 0;
	}

	/**
	 * email삭제
	 */
	@Override
	public boolean deleteEmail(String generalMemberEmail) {
		int deleteCount = generalMemberDAO.deleteEmail(generalMemberEmail);
		return deleteCount > 0;
	}

	/**
	 * blog삭제
	 */
	@Override
	public boolean deleteBlog(String generalMemberEmail) {
		int deleteCount = generalMemberDAO.deleteBlog(generalMemberEmail);
		return deleteCount > 0;
	}

	/**
	 * 자기소개 수정
	 */
	@Override
	public boolean updateselfIntro(GeneralMemberVO generalMemberVO) {
		int updateCount = generalMemberDAO.updateselfIntro(generalMemberVO);
		return updateCount > 0;
	}

	/**
	 * 자기소개 삭제
	 */
	@Override
	public boolean deleteSelfIntro(String generalMemberEmail) {
		int deleteCount = generalMemberDAO.deleteSelfIntro(generalMemberEmail);
		return deleteCount > 0;
	}



}

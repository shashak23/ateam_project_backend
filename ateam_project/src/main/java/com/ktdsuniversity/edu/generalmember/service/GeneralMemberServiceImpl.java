package com.ktdsuniversity.edu.generalmember.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.generalmember.dao.GeneralMemberDAO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
@Service
public class GeneralMemberServiceImpl implements GeneralMemberService {
	@Autowired
	private GeneralMemberDAO generalMemberDAO;
	@Override
	public List<CareerVO> getAllCareerListByMemberEmail(String generalMemberEmail) {
		return generalMemberDAO.getAllCareerListByMemberEmail(generalMemberEmail);
	}
	@Override
	public List<GeneralMemberVO> getAllGeeralMemberList(String generalMemberEmail) {
		return generalMemberDAO.getAllGeeralMemberList(generalMemberEmail);
	}
	
	@Override
	public MemberVO getSelectNickname(String generalMemberEmail) {
		return generalMemberDAO.getSelectNickname(generalMemberEmail);
	}
	@Override
	public GeneralMemberVO getSelectGeneralMember(String generalMemberEmail) {
		GeneralMemberVO generalMemberVO = generalMemberDAO.getSelectGeneralMember(generalMemberEmail);
		return generalMemberVO;
	}
	@Override
	public boolean updateOneAddress(GeneralMemberVO generalMemberVO) {
		int updateCount = generalMemberDAO.updateOneAddress(generalMemberVO);
		return updateCount>0;
	}
	@Override
	public boolean deleteOneAddress(String generalMemberEmail) {
		int deleteCount = generalMemberDAO.deleteOneAddress(generalMemberEmail);
		return deleteCount>0;
	}
	@Override
	public boolean updateSns(GeneralMemberVO generalMemberVO) {
			int updateCount = generalMemberDAO.updateSns(generalMemberVO);
			return updateCount>0;
	}
	@Override
	public boolean deleteGithub(String generalMemberEmail) {
		int deleteCount = generalMemberDAO.deleteGithub(generalMemberEmail);
		return deleteCount>0;
	}
	@Override
	public boolean deleteEmail(String generalMemberEmail) {
		int deleteCount = generalMemberDAO.deleteEmail(generalMemberEmail);
		return deleteCount>0;
	}
	@Override
	public boolean deleteBlog(String generalMemberEmail) {
		int deleteCount = generalMemberDAO.deleteBlog(generalMemberEmail);
		return deleteCount>0;
	}
	@Override
	public boolean updateselfIntro(GeneralMemberVO generalMemberVO) {
		int updateCount = generalMemberDAO.updateselfIntro(generalMemberVO);
		return updateCount>0;
	}
	@Override
	public boolean deleteSelfIntro(String generalMemberEmail) {
		int deleteCount = generalMemberDAO.deleteSelfIntro(generalMemberEmail);
		return deleteCount>0;
	}

	
	

}

package com.ktdsuniversity.edu.generalmember.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.generalmember.dao.GeneralMemberDAO;
@Service
public class GeneralMemberServiceImpl implements GeneralMemberService {
	@Autowired
	private GeneralMemberDAO generalMemberDAO;
	@Override
	public List<CareerVO> getAllCareerListByMemberEmail(String generalMemberEmail) {
		return generalMemberDAO.getAllCareerListByMemberEmail(generalMemberEmail);
	}

}

package com.ktdsuniversity.edu.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.admin.dao.AdminDAO;
import com.ktdsuniversity.edu.admin.vo.AdminTierListVO;
import com.ktdsuniversity.edu.generalmember.dao.GeneralMemberDAO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.tier.TierVO;

@Service
public class TierServiceImpl implements TierService {

	@Autowired
	private AdminDAO tierDAO;
	
	@Autowired
	private GeneralMemberDAO generalMemberDAO;
	
	@Override
	public AdminTierListVO getTierMemberAllList() {
		AdminTierListVO adminTierListVO = new AdminTierListVO();
		adminTierListVO.setAdminTierCount(tierDAO.tierMemberAllCount());
		adminTierListVO.setAdminTierList(tierDAO.tierMemberAllList());
		return adminTierListVO;
	}
	
	@Override
	public boolean doUpdateTierMember(GeneralMemberVO generalMemberVO) {
		int updateTierIdCount = generalMemberDAO.updateTierId(generalMemberVO);
		int updateTierDateCount = generalMemberDAO.updateTierDate(generalMemberVO);
		return updateTierIdCount > 0 && updateTierDateCount > 0 ;
	}
	
	@Override
	public TierVO getMemberAndTier(String email) {
		return tierDAO.getMemberAndTier(email);
	}
}

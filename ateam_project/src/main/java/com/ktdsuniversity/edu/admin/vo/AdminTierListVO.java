package com.ktdsuniversity.edu.admin.vo;

import java.util.List;

public class AdminTierListVO {
	
	private int adminTierCount;
	private List<AdminTierVO> adminTierList;
	
	
	public int getAdminTierCount() {
		return adminTierCount;
	}
	public void setAdminTierCount(int adminTierCount) {
		this.adminTierCount = adminTierCount;
	}
	public List<AdminTierVO> getAdminTierList() {
		return adminTierList;
	}
	public void setAdminTierList(List<AdminTierVO> adminTierList) {
		this.adminTierList = adminTierList;
	}
	
}

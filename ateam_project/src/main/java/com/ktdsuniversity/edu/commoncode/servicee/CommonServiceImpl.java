package com.ktdsuniversity.edu.commoncode.servicee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.commoncode.dao.CommonDAO;
import com.ktdsuniversity.edu.commoncode.vo.CommonListVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonVO;

@Service
public class CommonServiceImpl implements CommonService {
	@Autowired
	public CommonDAO commonDAO;
	
	@Override
	public CommonListVO getAllHashtag() {
		CommonListVO commonListVO = new CommonListVO(); 
		
		commonListVO.setHashtagCnt(commonDAO.getHashtagAllNumber());
		commonListVO.setHashtagList(commonDAO.getAllHashtag());
		
		return commonListVO;
		
	}

	@Override
	public boolean createHashtag(CommonVO commonVO) {
		return commonDAO.createHashtag(commonVO) > 0;
	};
}

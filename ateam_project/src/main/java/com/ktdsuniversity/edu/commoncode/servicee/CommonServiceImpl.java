/**
 * 작성자: 김태현
 * 작성일자: 2023-10-11
 * 내용: 공통 코드 테이블의 수행한 쿼리를 저장하는 클래스입니다.
 */

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

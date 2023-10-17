/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-17)
 * 작성일자: 2023-10-11
 * 내용: 공통 코드 테이블의 수행한 쿼리를 저장하는 클래스입니다.
 */

package com.ktdsuniversity.edu.commoncode.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.commoncode.dao.CommonCodeDAO;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeListVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;

@Service
public class CommonCodeServiceImpl implements CommonCodeService {
	@Autowired
	public CommonCodeDAO commonCodeDAO;
	
	@Override
	public CommonCodeListVO getAllHashtag() {
		CommonCodeListVO commonCodeListVO = new CommonCodeListVO(); 
		
		commonCodeListVO.setHashtagCnt(commonCodeDAO.getHashtagAllNumber());
		commonCodeListVO.setHashtagList(commonCodeDAO.getAllHashtag());
		
		return commonCodeListVO;
		
	}

	@Override
	public boolean createHashtag(CommonCodeVO commonCodeVO) {
		return commonCodeDAO.createHashtag(commonCodeVO) > 0;
	};
}

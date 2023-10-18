/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-17)
 * 		 김태현(2023-10-17)
 * 작성일자: 2023-10-11
 * 내용: 공통 코드 테이블의 수행한 쿼리를 저장하는 클래스입니다.
 */

package com.ktdsuniversity.edu.commoncode.service;

import java.util.List;

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
	public CommonCodeListVO getAllCommonType(String codeName) {
		CommonCodeListVO commonCodeListVO = new CommonCodeListVO(); 
		
		commonCodeListVO.setAllCommonNumber(commonCodeDAO.getCommonTypeAllCount(codeName));
		commonCodeListVO.setCommonCodeListVO(commonCodeDAO.getAllCommonType(codeName));
		
		return commonCodeListVO;
	}

	@Override
	public boolean createCommonCode(CommonCodeVO commonCodeVO) {
		return commonCodeDAO.createCommonCode(commonCodeVO) > 0;
	}
	
	@Override
	public List<CommonCodeListVO> search(String codeName) {
		return commonCodeDAO.search(codeName);
	}
}

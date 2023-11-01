/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-17)
 * 		 김태현(2023-10-17)
 * 작성일자: 2023-10-11
 * 내용: 공통 코드 테이블의 수행한 쿼리를 저장하는 클래스입니다.
 */

package com.ktdsuniversity.edu.commoncode.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
	public boolean createCommonCode(CommonCodeVO commonCodeVO, String codeName) {
		// 보내준 코드 리스트를 받아오기
		List<CommonCodeVO> originCommonCodeList = commonCodeDAO.searchCode(codeName);
		
		// 띄어쓰기를 기준으로 배열에 저장
		String[] newCommonContentArr = commonCodeVO.getCodeContent().split(" ");
		
		// Set을 이용해 중복된 값을 제거하기
		Set<String> newCommonContentSet = new HashSet<>();
		for (String str : newCommonContentArr) {
			newCommonContentSet.add(str);
		}
		
		int count = 0;
		int createCnt = 0;
		boolean isExist = false;
		
		// DB에 중복된 값이 있는지 검사
		for (String newContents : newCommonContentSet) {
			for (CommonCodeVO originContents : originCommonCodeList) {
				if(newContents.equals(originContents.getCodeContent())) {
					count++;
					isExist = true;
					break;
				}
			}
			if (!isExist) {
				commonCodeVO.setCodeType(codeName);
				commonCodeVO.setCodeContent(newContents);
				// 없으면 공통 코드 생성
				createCnt = commonCodeDAO.createCommonCode(commonCodeVO);
				
				if (createCnt != 0) {
					count++;
				}
			}
			isExist = false;
			createCnt = 0;
		}
		
		if (count == newCommonContentSet.size()) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public List<CommonCodeVO> searchCode(String codeName) {
		return commonCodeDAO.searchCode(codeName);
	}
}

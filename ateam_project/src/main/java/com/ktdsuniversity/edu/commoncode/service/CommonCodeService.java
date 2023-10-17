/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-17)
 * 작성일자: 2023-10-11
 * 내용: 공통 코드 테이블의 수행한 쿼리를 저장하는 클래스입니다.
 */

package com.ktdsuniversity.edu.commoncode.service;

import java.util.List;

import com.ktdsuniversity.edu.commoncode.vo.CommonCodeListVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;

public interface CommonCodeService {
	public CommonCodeListVO getAllHashtag();
	public boolean createHashtag(CommonCodeVO commonVO);
	public List<CommonCodeListVO> search(String codeName);
}

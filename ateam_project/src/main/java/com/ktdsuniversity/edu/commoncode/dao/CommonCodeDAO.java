/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-17)
 * 		 김태현(2023-10-17)
 * 작성일자: 2023-10-11
 * 내용: 공통 코드 테이블의 쿼리를 수행할 클래스입니다.
 */

package com.ktdsuniversity.edu.commoncode.dao;

import java.util.List;

import com.ktdsuniversity.edu.commoncode.vo.CommonCodeListVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;

public interface CommonCodeDAO {
	public int getCommonTypeAllCount(String codeName);
	public List<CommonCodeVO> getAllCommonType(String codeName);
	public int createCommonCode(CommonCodeVO commonCodeVO);
	public List<CommonCodeVO> searchCode(String codeName);
}

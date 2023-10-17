/**
 * 작성자: 김태현
 * 작성일자: 2023-10-11
 * 내용: 공통 코드 테이블의 쿼리를 수행할 클래스입니다.
 */

package com.ktdsuniversity.edu.commoncode.dao;

import java.util.List;

import com.ktdsuniversity.edu.commoncode.vo.CommonVO;

public interface CommonDAO {
	public int getHashtagAllNumber();
	public List<CommonVO> getAllHashtag();
	public int createHashtag(CommonVO commonVO);
}

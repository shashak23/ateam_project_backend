/**
 * 작성자: 김태현
 * 작성일자: 2023-10-11
 * 내용: 공통 코드 테이블의 수행한 쿼리를 저장하는 클래스입니다.
 */

package com.ktdsuniversity.edu.commoncode.servicee;

import com.ktdsuniversity.edu.commoncode.vo.CommonListVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonVO;

public interface CommonService {
	public CommonListVO getAllHashtag();
	public boolean createHashtag(CommonVO commonVO);
}

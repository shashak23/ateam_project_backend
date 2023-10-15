package com.ktdsuniversity.edu.commoncode.servicee;

import com.ktdsuniversity.edu.commoncode.vo.CommonListVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonVO;

public interface CommonService {
	public CommonListVO getAllHashtag();
	public boolean createHashtag(CommonVO commonVO);
}

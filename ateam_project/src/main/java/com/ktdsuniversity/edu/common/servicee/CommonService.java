package com.ktdsuniversity.edu.common.servicee;

import com.ktdsuniversity.edu.common.vo.CommonListVO;
import com.ktdsuniversity.edu.common.vo.CommonVO;

public interface CommonService {
	public CommonListVO getAllHashtag();
	public boolean createHashtag(CommonVO commonVO);
}

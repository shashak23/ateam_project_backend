package com.ktdsuniversity.edu.common.dao;

import java.util.List;

import com.ktdsuniversity.edu.common.vo.CommonVO;

public interface CommonDAO {
	public int getHashtagAllNumber();
	public List<CommonVO> getAllHashtag();
	public int createHashtag(CommonVO commonVO);
}

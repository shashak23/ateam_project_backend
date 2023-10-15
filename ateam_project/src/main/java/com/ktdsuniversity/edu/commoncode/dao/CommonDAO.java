package com.ktdsuniversity.edu.commoncode.dao;

import java.util.List;

import com.ktdsuniversity.edu.commoncode.vo.CommonVO;

public interface CommonDAO {
	public int getHashtagAllNumber();
	public List<CommonVO> getAllHashtag();
	public int createHashtag(CommonVO commonVO);
}

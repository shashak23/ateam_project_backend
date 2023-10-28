package com.ktdsuniversity.edu.generalposthashtag.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.generalposthashtag.dao.HashtagDAO;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

@Service
public class HashtagServiceImpl implements HashtagService{

	@Autowired
	private HashtagDAO hashtagDAO;
	
	@Override
	public boolean createHashtag(HashtagVO hashtagVO) {
		int createCount = hashtagDAO.createHashtag(hashtagVO);
		return createCount > 0;
	}

}

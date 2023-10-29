package com.ktdsuniversity.edu.follow.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.follow.dao.FollowDAO;
import com.ktdsuniversity.edu.follow.vo.FollowVO;

@Service
public class FollowServiceImpl implements FollowService {

	@Autowired
	private FollowDAO followDAO;
	
	@Transactional
	@Override
	public boolean follow(FollowVO followVO) {
		int followCount = followDAO.follow(followVO);
		return followCount > 0;
	}

}

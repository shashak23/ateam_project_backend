/**
 * 작성자: 장보늬
 * 작성일자: 2023-11-01
 */
package com.ktdsuniversity.edu.follow.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.follow.dao.FollowDAO;
import com.ktdsuniversity.edu.follow.vo.FollowListVO;
import com.ktdsuniversity.edu.follow.vo.FollowVO;
import com.ktdsuniversity.edu.follow.vo.SearchFollowVO;

@Service
public class FollowServiceImpl implements FollowService {

	@Autowired
	private FollowDAO followDAO;
	
	@Transactional
	@Override
	public boolean doFollow(FollowVO followVO) {
		return followDAO.doFollow(followVO) > 0;
	}

	@Transactional
	@Override
	public boolean unFollow(SearchFollowVO searchFollowVO) {
		return followDAO.unFollow(searchFollowVO) > 0;
	}

	@Transactional
	@Override
	public boolean toggleFollower(String followId) {
		return followDAO.toggleFollower(followId) > 0;
	}
	
	@Override
	public FollowListVO getAllFollower(String email) {
		FollowListVO followListVO = new FollowListVO();
		followListVO.setFollowList(followDAO.getAllFollower(email));
		return followListVO;
	}

	@Override
	public FollowListVO getAllFollowee(String email) {
		FollowListVO followListVO = new FollowListVO();
		followListVO.setFollowList(followDAO.getAllFollowee(email));
		return followListVO;
	}
	
	@Override
	public FollowVO getFollowStatus(SearchFollowVO searchFollowVO) {
		return followDAO.getFollowStatus(searchFollowVO);
	}

}

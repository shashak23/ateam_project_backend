/**
 * 작성자: 김태현
 * 작성일: 2023-10-23
 * 내용: 홈화면에서 실행할 쿼리 수행 결과를 받아오는 클래스입니다.
 */
package com.ktdsuniversity.edu.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.home.dao.HomeBoardDAO;
import com.ktdsuniversity.edu.home.vo.HomeBoardVO;

@Service
public class HomeBoardServiceImpl implements HomeBoardService {
	@Autowired
	private HomeBoardDAO homeBoardDAO;
	
	public List<GeneralPostVO> getWeeklyRanking(String date) {
		return homeBoardDAO.getWeeklyRanking(date);
	}

	@Override
	public List<HomeBoardVO> getHashtag(String postId) {
		return homeBoardDAO.getHashtag(postId);
	}
}

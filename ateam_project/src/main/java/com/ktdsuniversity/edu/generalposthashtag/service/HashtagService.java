/**
 * 작성자: 김시하
 * 
 */
package com.ktdsuniversity.edu.generalposthashtag.service;

import java.util.List;

import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagListVO;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

public interface HashtagService {
	// 해시태그별 목록 조회
	public HashtagListVO getAllHashtag(String hashtagId);
	
	public List<HashtagVO> getHashtagList(String postId);

	
}

package com.ktdsuniversity.edu.generalposthashtag.dao;

import java.util.List;

import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagListVO;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

import jakarta.validation.Valid;

public interface HashtagDAO {

	public int getHashtagCnt();

	public List<HashtagVO> getAllHashtag();

	public List<HashtagVO> getHashtagList(String postId);


}

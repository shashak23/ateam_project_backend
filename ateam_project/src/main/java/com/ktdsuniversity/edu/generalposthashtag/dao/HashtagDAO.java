package com.ktdsuniversity.edu.generalposthashtag.dao;

import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

import jakarta.validation.Valid;

public interface HashtagDAO {

	int createHashtag(HashtagVO hashtagVO);


}

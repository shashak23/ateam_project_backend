package com.ktdsuniversity.edu.generalposthashtag.service;

import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

import jakarta.validation.Valid;

public interface HashtagService {

	boolean createHashtag(HashtagVO hashtagVO);

}

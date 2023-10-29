package com.ktdsuniversity.edu.generalposthashtag.service;

import java.util.List;

import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

import jakarta.validation.Valid;

public interface HashtagService {

	boolean createHashtags(List<String> hashtags);


}

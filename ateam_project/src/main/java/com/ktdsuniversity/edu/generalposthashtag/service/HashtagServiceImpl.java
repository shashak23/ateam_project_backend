package com.ktdsuniversity.edu.generalposthashtag.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.generalpost.web.FreePostController;
import com.ktdsuniversity.edu.generalposthashtag.dao.HashtagDAO;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;

import jakarta.validation.Valid;

@Service
public class HashtagServiceImpl implements HashtagService{

	private Logger log = LoggerFactory.getLogger(FreePostController.class);

	@Autowired
	private HashtagDAO hashtagDAO;

	@Override
	public boolean createHashtags(List<String> hashtags) {
		// TODO Auto-generated method stub
		return false;
	}




}

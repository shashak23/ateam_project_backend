package com.ktdsuniversity.edu.algorithmcategorylist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.algorithmcategorylist.dao.AlgorithmCategoryListDAO;
import com.ktdsuniversity.edu.algorithmcategorylist.vo.AlgorithmCategoryListVO;

@Service
public class AlgorithmCategoryListServiceImpl implements AlgorithmCategoryListService{

	@Autowired
	public AlgorithmCategoryListDAO algorithmCategoryListDAO;
	
	@Override
	public List<AlgorithmCategoryListVO> categorySearch(String postId) {
		return algorithmCategoryListDAO.categorySearch(postId);
	}

}

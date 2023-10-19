package com.ktdsuniversity.edu.algorithmcategorylist.dao;

import java.util.List;

import com.ktdsuniversity.edu.algorithmcategorylist.vo.AlgorithmCategoryListVO;

public interface AlgorithmCategoryListDAO {
	
	public List<AlgorithmCategoryListVO> categorySearch(String postId);

}

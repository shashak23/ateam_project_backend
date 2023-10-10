package com.ktdsuniversity.edu.generalpost.service;

import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.generalpost.vo.GenaralPostVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostListVO;


public interface GeneralPostService {

	public GeneralPostListVO getAllBoard();

	public boolean createNewBoard(GenaralPostVO generalPostVO, MultipartFile file);

}

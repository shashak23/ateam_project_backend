package com.ktdsuniversity.edu.career.dao;

import com.ktdsuniversity.edu.career.vo.CareerVO;

public interface CareerDAO {
	/**
	 * 경력 생성
	 */
	public int createNewCareer(CareerVO careerVO);
	
	/**
	 * 경력 수정
	 */
	public int updateOneCarrer(CareerVO careerVO);
}

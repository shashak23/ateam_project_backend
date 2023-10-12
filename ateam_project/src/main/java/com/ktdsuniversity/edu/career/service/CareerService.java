package com.ktdsuniversity.edu.career.service;

import java.util.List;

import com.ktdsuniversity.edu.career.vo.CareerVO;

public interface CareerService {
	
	/**
	 * 경력 생성
	 */
	public boolean createNewCareer(CareerVO careerVO);
	
	/**
	 * 경력 조회
	 */
	public CareerVO getOneCareer(String careerId); 
	/**
	 * 경력 수정
	 */
	public boolean updateOneCarrer(CareerVO careerVO);
	/**
	 * 경력 삭제
	 */
	public boolean deleteOneCareer(String careerId);
}

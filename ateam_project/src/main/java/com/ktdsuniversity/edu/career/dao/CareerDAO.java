package com.ktdsuniversity.edu.career.dao;

import java.util.List;

import com.ktdsuniversity.edu.career.vo.CareerVO;

public interface CareerDAO {
	/**
	 * 전체 조회
	 */
	public List<CareerVO> getAllCareerList();
	/**
	 * 경력 생성
	 */
	public int createNewCareer(CareerVO careerVO);
	/**
	 * 경력 조회
	 */
	public CareerVO getOneCareer(String careerId);
	/**
	 * 경력 수정
	 */
	public int updateOneCarrer(CareerVO careerVO);
	/**
	 * 경력 삭제
	 */
	public int deleteOneCareer(String careerId);
}

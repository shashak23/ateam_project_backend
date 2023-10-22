/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-18
 * 내용 : 경력 Service
 */
package com.ktdsuniversity.edu.career.service;


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

/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-18
 * 내용 : 경력 생성 수정 삭제를 위한 DAO
 */
package com.ktdsuniversity.edu.career.dao;


import com.ktdsuniversity.edu.career.vo.CareerVO;

public interface CareerDAO {
	
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

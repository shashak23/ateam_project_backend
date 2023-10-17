package com.ktdsuniversity.edu.education.dao;
import com.ktdsuniversity.edu.education.vo.EducationVO;

/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-13
 * 내용 : 경력 전체 목록을 저정한 DAO입니다.
 */
public interface EducationDAO {
	
	/**
	 * 경력 생성
	 */
	public int createNewEducation(EducationVO educationVO);
	/**
	 * 경력 조회
	 */
	public EducationVO getOneEducation(String educationId);
	/**
	 * 경력 수정
	 */
	public int updateOneEducation(EducationVO educationVO);
	/**
	 * 경력 삭제
	 */
	public int deleteOneEducation(String educationId);
}

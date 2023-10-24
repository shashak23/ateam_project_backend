/**
 * 작성자: 김시하
 * 작성일자: 2023-10-23
 * 내용: 기업 채용을 위한 DAO
 */
package com.ktdsuniversity.edu.companyrecruit.dao;

import java.util.List;

import com.ktdsuniversity.edu.companyrecruit.vo.CompanyRecruitVO;

public interface CompanyRecruitDAO {

	public int getBoardAllCount();

	public List<CompanyRecruitVO> getAllBoard();

}

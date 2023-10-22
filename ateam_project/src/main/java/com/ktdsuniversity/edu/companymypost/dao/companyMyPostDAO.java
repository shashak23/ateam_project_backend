package com.ktdsuniversity.edu.companymypost.dao;

<<<<<<< HEAD:ateam_project/src/main/java/com/ktdsuniversity/edu/companymypost/dao/companyMyPostDAO.java
import java.util.List;
=======
public interface CompanyMyPostDAO {
>>>>>>> main:ateam_project/src/main/java/com/ktdsuniversity/edu/companymypost/dao/CompanyMyPostDAO.java

import com.ktdsuniversity.edu.companymypost.vo.CompanyMyPostVO;
import com.ktdsuniversity.edu.companymypost.vo.SearchCompanyMyPostVO;

public interface CompanyMyPostDAO {
	//파라미터에 각 게시판 PK로 할지 CompanyEmail
	//모든 게시글 수 조회
	public int getBoardAllCount();
	//게시글 전체 조회
	public List<CompanyMyPostVO> getAllCompanyPost();
	//게시글 단건 조회
	public CompanyMyPostVO getOneCompanyPost(String companyEmail);
	//게시글 검색
	public List<CompanyMyPostVO> searchAllCompanyMyPost(SearchCompanyMyPostVO searchCompanyMyPostVO);
	//게시글 수정
	public int updateOneCompanyPost(CompanyMyPostVO companyMyPostVO);
	//게시글 삭제
	public int deleteOneCompanyPost(String companyEmail);
}

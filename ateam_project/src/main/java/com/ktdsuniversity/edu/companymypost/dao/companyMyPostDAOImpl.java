package com.ktdsuniversity.edu.companymypost.dao;

<<<<<<< HEAD:ateam_project/src/main/java/com/ktdsuniversity/edu/companymypost/dao/companyMyPostDAOImpl.java
import java.util.List;
=======
public class CompanyMyPostDAOImpl {
>>>>>>> main:ateam_project/src/main/java/com/ktdsuniversity/edu/companymypost/dao/CompanyMyPostDAOImpl.java

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.companymypost.vo.CompanyMyPostVO;
import com.ktdsuniversity.edu.companymypost.vo.SearchCompanyMyPostVO;

@Repository
public class CompanyMyPostDAOImpl implements CompanyMyPostDAO {

	  private static final String NAMESPACE = "com.ktdsuniversity.edu.companymypost.dao.CompanyMyPostDAO.";

	    @Autowired
	    private SqlSessionTemplate sqlSessionTemplate;

	    @Override
	    public int getBoardAllCount() {
	        return sqlSessionTemplate.selectOne(NAMESPACE + "getBoardAllCount");
	    }

	    @Override
	    public List<CompanyMyPostVO> getAllCompanyPost() {
	        return sqlSessionTemplate.selectList(NAMESPACE + "getAllCompanyPost");
	    }

	    @Override
	    public CompanyMyPostVO getOneCompanyPost(String companyEmail) {
	        return sqlSessionTemplate.selectOne(NAMESPACE + "getOneCompanyPost", companyEmail);
	    }

	    @Override
	    public List<CompanyMyPostVO> searchAllCompanyMyPost(SearchCompanyMyPostVO searchCompanyMyPostVO) {
	        return sqlSessionTemplate.selectList(NAMESPACE + "searchAllCompanyMyPost", searchCompanyMyPostVO);
	    }

	    @Override
	    public int updateOneCompanyPost(CompanyMyPostVO companyMyPostVO) {
	        return sqlSessionTemplate.update(NAMESPACE + "updateOneCompanyPost", companyMyPostVO);
	    }

	    @Override
	    public int deleteOneCompanyPost(String companyEmail) {
	        return sqlSessionTemplate.delete(NAMESPACE + "deleteOneCompanyPost", companyEmail);
	    }
}

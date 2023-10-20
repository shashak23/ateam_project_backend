/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-17)
 * 		 김태현(2023-10-17)
 * 작성일자: 2023-10-11
 * 내용: 공통 코드 테이블의 쿼리를 수행할 클래스입니다.
 */

package com.ktdsuniversity.edu.commoncode.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.commoncode.vo.CommonCodeListVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;

@Repository
public class CommonCodeDAOImpl extends SqlSessionDaoSupport implements CommonCodeDAO {
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}


	@Override
	public int getCommonTypeAllCount(String codeName) {
		return getSqlSession().selectOne("getCommonTypeAllCount", codeName);
	}
	
	@Override
	public List<CommonCodeVO> getAllCommonType(String codeName) {
		return getSqlSession().selectList("getAllCommonType");
	}

	@Override
	public int createCommonCode(CommonCodeVO commonCodeVO) {
		return getSqlSession().insert("createCommonCode", commonCodeVO);
	}
	
	@Override
	public List<CommonCodeVO> search(String codeName) {
		return getSqlSession().selectList("search", codeName);
	}
}

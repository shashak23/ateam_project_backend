/**
 * 작성자: 김태현
 * 작성일자: 2023-10-11
 * 내용: 공통 코드 테이블의 쿼리를 수행할 클래스입니다.
 */

package com.ktdsuniversity.edu.commoncode.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.commoncode.vo.CommonVO;

@Repository
public class CommonDAOImpl extends SqlSessionDaoSupport implements CommonDAO {
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}


	@Override
	public int getHashtagAllNumber() {
		return getSqlSession().selectOne("getHashtagAllNumber");
	}
	
	@Override
	public List<CommonVO> getAllHashtag() {
		return getSqlSession().selectList("getAllHashtag");
	}

	@Override
	public int createHashtag(CommonVO commonVO) {
		return getSqlSession().insert("createHashtag", commonVO);
	}
}

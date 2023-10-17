/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-17)
 * 작성일자: 2023-10-11
 * 내용: 공통 코드 테이블의 쿼리를 수행할 클래스입니다.
 */

package com.ktdsuniversity.edu.commoncode.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;

@Repository
public class CommonCodeDAOImpl extends SqlSessionDaoSupport implements CommonCodeDAO {
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
	public List<CommonCodeVO> getAllHashtag() {
		return getSqlSession().selectList("getAllHashtag");
	}

	@Override
	public int createHashtag(CommonCodeVO commonVO) {
		return getSqlSession().insert("createHashtag", commonVO);
	}
}
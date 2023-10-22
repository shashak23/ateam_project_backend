/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-17)
 * 		 김태현(2023-10-17)
 * 작성일자: 2023-10-11
 * 내용: 공통 코드의 테이블을 저장할 VO클래스입니다. 
 */

package com.ktdsuniversity.edu.commoncode.vo;

import java.util.List;

import com.ktdsuniversity.edu.techstack.vo.TechstackVO;

public class CommonCodeVO {
	private String codeId;
	private String codeType;
	private String codeContent;
	private List<TechstackVO> techstackVO;
	
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public String getCodeType() {
		return codeType;
	}
	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}
	public String getCodeContent() {
		return codeContent;
	}
	public void setCodeContent(String codeContent) {
		this.codeContent = codeContent;
	}
	public List<TechstackVO> getTechstackVO() {
		return techstackVO;
	}
	public void setTechstackVO(List<TechstackVO> techstackVO) {
		this.techstackVO = techstackVO;
	}
}

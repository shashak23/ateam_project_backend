/**
 * 작성자: 김태현
 * 작성일자: 2023-10-11
 * 내용: 공통 코드의 테이블을 저장할 VO클래스입니다. 
 */

package com.ktdsuniversity.edu.commoncode.vo;

public class CommonVO {
	private String codeId;
	private String codeType;
	private String codeContent;
	
	
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
}

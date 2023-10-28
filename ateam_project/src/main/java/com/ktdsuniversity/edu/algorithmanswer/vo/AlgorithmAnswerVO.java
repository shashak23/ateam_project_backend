/**
 * 작성자: 장보늬
 * 작성일자: 2023-10-26
 * 내용: 알고리즘문제 테스트 데이터 관련 VO
 */
package com.ktdsuniversity.edu.algorithmanswer.vo;

import com.ktdsuniversity.edu.util.XssIgnore;

public class AlgorithmAnswerVO {
	
	private String algorithmAnswerId;
	private String companyAlgorithmQuestionId;
	@XssIgnore
	private String content;
	private int result;
	
	public String getAlgorithmAnswerId() {
		return algorithmAnswerId;
	}
	public void setAlgorithmAnswerId(String algorithmAnswerId) {
		this.algorithmAnswerId = algorithmAnswerId;
	}
	public String getCompanyAlgorithmQuestionId() {
		return companyAlgorithmQuestionId;
	}
	public void setCompanyAlgorithmQuestionId(String companyAlgorithmQuestionId) {
		this.companyAlgorithmQuestionId = companyAlgorithmQuestionId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}

	
}

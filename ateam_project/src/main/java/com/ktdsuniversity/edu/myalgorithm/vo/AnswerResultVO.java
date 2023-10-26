package com.ktdsuniversity.edu.myalgorithm.vo;

import java.util.List;

public class AnswerResultVO {

	private boolean insertResult;
	private List<String> codeResultList;

	public boolean isInsertResult() {
		return insertResult;
	}

	public void setInsertResult(boolean insertResult) {
		this.insertResult = insertResult;
	}

	public List<String> getCodeResultList() {
		return codeResultList;
	}

	public void setCodeResultList(List<String> codeResultList) {
		this.codeResultList = codeResultList;
	}

}

package com.ktdsuniversity.edu.myalgorithm.vo;

import java.util.List;

public class AnswerResultVO {

	private boolean insertResult;
	private List<String> codeResultList;
	private boolean correct;
	private List<String> message;
	private String popupMessage;
	
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

	public boolean isCorrect() {
		return correct;
	}

	public void setCorrect(boolean correct) {
		this.correct = correct;
	}

	public List<String> getMessage() {
		return message;
	}

	public void setMessage(List<String> message) {
		this.message = message;
	}

	public String getPopupMessage() {
		return popupMessage;
	}
	public void setPopupMessage(String popupMessage) {
		this.popupMessage = popupMessage;
	}

	
	
}

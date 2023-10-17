/**
 * 작성자: 김태현
 * 작성일자: 2023-10-12
 * 내용: 내가 푼 알고리즘 문제를 저장할 VO클래스입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.vo;

import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public class MyAlgorithmVO extends AlgorithmQuestionVO {
	private String myAlgorithmQuestionId;
	private String generalMemberEmail;
	private String companyAlgorithmQuestionId;
	private String correctAnswerYn;
	private String deleteYn;
	private String myAnswer;
	private AlgorithmQuestionVO algorithmQuestionVO;
		
	private MemberVO memberVO;
		
	public String getMyAlgorithmQuestionId() {
		return myAlgorithmQuestionId;
	}
	public void setMyAlgorithmQuestionId(String myAlgorithmQuestionId) {
		this.myAlgorithmQuestionId = myAlgorithmQuestionId;
	}
	public String getGeneralMemberEmail() {
		return generalMemberEmail;
	}
	public void setGeneralMemberEmail(String generalMemberEmail) {
		this.generalMemberEmail = generalMemberEmail;
	}
	public String getCompanyAlgorithmQuestionId() {
		return companyAlgorithmQuestionId;
	}
	public void setCompanyAlgorithmQuestionId(String companyAlgorithmQuestionId) {
		this.companyAlgorithmQuestionId = companyAlgorithmQuestionId;
	}
	public String getCorrectAnswerYn() {
		return correctAnswerYn;
	}
	public void setCorrectAnswerYn(String correctAnswerYn) {
		this.correctAnswerYn = correctAnswerYn;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getMyAnswer() {
		return myAnswer;
	}
	public void setMyAnswer(String myAnswer) {
		this.myAnswer = myAnswer;
	}
	
	public AlgorithmQuestionVO getAlgorithmQuestionVO() {
		return algorithmQuestionVO;
	}
	public void setAlgorithmQuestionVO(AlgorithmQuestionVO algorithmQuestionVO) {
		this.algorithmQuestionVO = algorithmQuestionVO;
	}
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
}
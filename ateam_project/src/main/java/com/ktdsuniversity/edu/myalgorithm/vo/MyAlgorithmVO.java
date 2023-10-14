package com.ktdsuniversity.edu.myalgorithm.vo;

import java.util.List;

import com.ktdsuniversity.edu.companyalgorithmquestion.vo.CompanyAlgorithmQuestionVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public class MyAlgorithmVO {
	private String myAlgorithmQuestionId;
	private String generalMemberEmail;
	private String companyAlgorithmQuestionId;
	private String correctAnswerYn;
	private String deleteYn;
	private String myAnswer;
	
	private CompanyAlgorithmQuestionVO companyAlgorithmQuestionVO;
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
	public CompanyAlgorithmQuestionVO getCompanyAlgorithmQuestionVO() {
		return companyAlgorithmQuestionVO;
	}
	public void setCompanyAlgorithmQuestionVO(CompanyAlgorithmQuestionVO companyAlgorithmQuestionVO) {
		this.companyAlgorithmQuestionVO = companyAlgorithmQuestionVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
}

/**
 * 작성자: 김태현
 * 수정자: 장보늬(2023-10-20)
 * 작성일자: 2023-10-12
 * 내용: 내가 푼 알고리즘 문제를 저장할 VO클래스입니다.
 */

package com.ktdsuniversity.edu.myalgorithm.vo;

import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.companyinfo.vo.CompanyInfoVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.util.XssIgnore;

import jakarta.validation.constraints.NotBlank;

public class MyAlgorithmVO extends AlgorithmQuestionVO {
	private String myAlgorithmQuestionId;
	private String generalMemberEmail;
	private String companyAlgorithmQuestionId;
	
	@XssIgnore
	@NotBlank(message = "답을 입력해주세요.")
	private String myAnswer;
	private String submitDate;
	private String correctAnswerYn;
	private String deleteYn;
	
	private AlgorithmQuestionVO algorithmQuestionVO;
	private CommonCodeVO commonCodeVO;
	private MemberVO memberVO;
	private MemberVO memberVOTemp;
	private CompanyInfoVO companyInfoVO;
	
	
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
	public String getMyAnswer() {
		return myAnswer;
	}
	public void setMyAnswer(String myAnswer) {
		this.myAnswer = myAnswer;
	}
	public String getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(String submitDate) {
		this.submitDate = submitDate;
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
	public MemberVO getMemberVOTemp() {
		return memberVOTemp;
	}
	public void setMemberVOTemp(MemberVO memberVOTemp) {
		this.memberVOTemp = memberVOTemp;
	}
	public CommonCodeVO getCommonCodeVO() {
		return commonCodeVO;
	}
	public void setCommonCodeVO(CommonCodeVO commonCodeVO) {
		this.commonCodeVO = commonCodeVO;
	}
	public CompanyInfoVO getCompanyInfoVO() {
		return companyInfoVO;
	}
	public void setCompanyInfoVO(CompanyInfoVO companyInfoVO) {
		this.companyInfoVO = companyInfoVO;
	}
}

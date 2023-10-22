package com.ktdsuniversity.edu.companymypost.vo;

<<<<<<< HEAD:ateam_project/src/main/java/com/ktdsuniversity/edu/companymypost/vo/companyMyPostVO.java
=======
public class CompanyMyPostVO {
>>>>>>> main:ateam_project/src/main/java/com/ktdsuniversity/edu/companymypost/vo/CompanyMyPostVO.java

import java.util.List;

import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.companymember.vo.CompanyVO;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsVO;

public class CompanyMyPostVO extends CompanyVO{

	private CompanyVO companyVO;
	private List<AlgorithmQuestionVO> algorithmQuestionList;;
	private List<CompanyNewsVO> companyNewsList;
	
	public CompanyVO getCompanyVO() {
		return companyVO;
	}
	public void setCompanyVO(CompanyVO companyVO) {
		this.companyVO = companyVO;
	}
	public List<AlgorithmQuestionVO> getAlgorithmQuestionList() {
		return algorithmQuestionList;
	}
	public void setAlgorithmQuestionList(List<AlgorithmQuestionVO> algorithmQuestionList) {
		this.algorithmQuestionList = algorithmQuestionList;
	}
	public List<CompanyNewsVO> getCompanyNewsList() {
		return companyNewsList;
	}
	public void setCompanyNewsList(List<CompanyNewsVO> companyNewsList) {
		this.companyNewsList = companyNewsList;
	}
}

package com.ktdsuniversity.edu.common.vo;

import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsVO;

public class AbstractCompanyPostVO {

	private AlgorithmExplanationVO algorithmExplanationVO;
	
	private AlgorithmQuestionVO algorithmQuestionVO;
	
	private CompanyNewsVO companyNewsVO;

	private String postWriter;
	
	private String algorithmWriter;
	
	
	
	public AlgorithmExplanationVO getAlgorithmExplanationVO() {
		return algorithmExplanationVO;
	}

	public void setAlgorithmExplanationVO(AlgorithmExplanationVO algorithmExplanationVO) {
		this.algorithmExplanationVO = algorithmExplanationVO;
	}

	public AlgorithmQuestionVO getAlgorithmQuestionVO() {
		return algorithmQuestionVO;
	}

	public void setAlgorithmQuestionVO(AlgorithmQuestionVO algorithmQuestionVO) {
		this.algorithmQuestionVO = algorithmQuestionVO;
	}

	public CompanyNewsVO getCompanyNewsVO() {
		return companyNewsVO;
	}

	public void setCompanyNewsVO(CompanyNewsVO companyNewsVO) {
		this.companyNewsVO = companyNewsVO;
	}
	
	public String getPostWriter() {
		return postWriter;
	}
	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}
	public String getAlgorithmWriter() {
		return algorithmWriter;
	}
	public void setAlgorithmWriter(String algorithmWriter) {
		this.algorithmWriter = algorithmWriter;
	}
}

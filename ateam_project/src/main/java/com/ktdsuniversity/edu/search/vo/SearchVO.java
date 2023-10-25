/**
 * 작성자: 장보늬
 * 생성날짜: 2023-10-25
 * 내용: 통합검색 키워드 조회를 위한 VO
 */
package com.ktdsuniversity.edu.search.vo;

import com.ktdsuniversity.edu.algorithmexplanation.vo.AlgorithmExplanationVO;
import com.ktdsuniversity.edu.algorithmquestion.vo.AlgorithmQuestionVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.companynews.vo.CompanyNewsVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public class SearchVO {
	
	private GeneralPostVO generalPostVO;
	private CompanyNewsVO companyNewsVO;
	private AlgorithmQuestionVO algorithmQuestionVO;
	private AlgorithmExplanationVO algorithmExplanationVO;
	private MemberVO memberVO;
	private CommonCodeVO commonCodeVO;
	
	public GeneralPostVO getGeneralPostVO() {
		return generalPostVO;
	}
	public void setGeneralPostVO(GeneralPostVO generalPostVO) {
		this.generalPostVO = generalPostVO;
	}
	public CompanyNewsVO getCompanyNewsVO() {
		return companyNewsVO;
	}
	public void setCompanyNewsVO(CompanyNewsVO companyNewsVO) {
		this.companyNewsVO = companyNewsVO;
	}
	public AlgorithmQuestionVO getAlgorithmQuestionVO() {
		return algorithmQuestionVO;
	}
	public void setAlgorithmQuestionVO(AlgorithmQuestionVO algorithmQuestionVO) {
		this.algorithmQuestionVO = algorithmQuestionVO;
	}
	public AlgorithmExplanationVO getAlgorithmExplanationVO() {
		return algorithmExplanationVO;
	}
	public void setAlgorithmExplanationVO(AlgorithmExplanationVO algorithmExplanationVO) {
		this.algorithmExplanationVO = algorithmExplanationVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public CommonCodeVO getCommonCodeVO() {
		return commonCodeVO;
	}
	public void setCommonCodeVO(CommonCodeVO commonCodeVO) {
		this.commonCodeVO = commonCodeVO;
	}

	
}

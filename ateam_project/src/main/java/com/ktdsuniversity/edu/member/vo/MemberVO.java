package com.ktdsuniversity.edu.member.vo;

import java.util.List;

import com.ktdsuniversity.edu.member.vo.validategroup.MemberAuthGroup;
import com.ktdsuniversity.edu.member.vo.validategroup.MemberEditNickGroup;
import com.ktdsuniversity.edu.member.vo.validategroup.MemberEditPWGroup;
import com.ktdsuniversity.edu.member.vo.validategroup.MemberSignupGroup;
import com.ktdsuniversity.edu.myalgorithm.vo.MyAlgorithmVO;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

public class MemberVO {
	@NotBlank(groups= {MemberSignupGroup.class,
					   MemberAuthGroup.class},
			           message = "이메일을 입력해주세요.")
	@Email(groups=MemberSignupGroup.class,
		   		  message = "이메일 형태로 입력해주세요.")
	private String email;
	
	@NotBlank(groups= {MemberSignupGroup.class,
				       MemberEditPWGroup.class},
			message = "비밀번호를 입력해주세요.")
	private String pw;
	
	@NotBlank(groups={MemberSignupGroup.class,
					  MemberEditPWGroup.class},
			          message = "비밀번호 확인을 입력해주세요.")
	
	private String confirmPw;
	private String salt;
	@NotBlank(groups= {MemberSignupGroup.class,
					   MemberEditNickGroup.class},
			   		   message = "닉네임을 입력해주세요.")
	private String nickname;
	private String infoAgreementYn;
	private String profilePic;
	private String registDate;
	private String memberType;
	private String withdrawYn;
	private List<MyAlgorithmVO> myAlgorithmVO;

	
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getConfirmPw() {
		return confirmPw;
	}
	public void setConfirmPw(String confirmPw) {
		this.confirmPw = confirmPw;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getInfoAgreementYn() {
		return infoAgreementYn;
	}
	public void setInfoAgreementYn(String infoAgreementYn) {
		this.infoAgreementYn = infoAgreementYn;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	public String getWithdrawYn() {
		return withdrawYn;
	}
	public void setWithdrawYn(String withdrawYn) {
		this.withdrawYn = withdrawYn;
	}
	public List<MyAlgorithmVO> getMyAlgorithmVO() {
		return myAlgorithmVO;
	}
	public void setMyAlgorithmVO(List<MyAlgorithmVO> myAlgorithmVO) {
		this.myAlgorithmVO = myAlgorithmVO;
	}
	
	
	
	
	
}
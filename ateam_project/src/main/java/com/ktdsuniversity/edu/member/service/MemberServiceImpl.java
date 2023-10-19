package com.ktdsuniversity.edu.member.service;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ktdsuniversity.edu.beans.FileHandler;
import com.ktdsuniversity.edu.beans.FileHandler.StoredFile;
import com.ktdsuniversity.edu.beans.SHA;
import com.ktdsuniversity.edu.companymember.dao.CompanyDAO;
import com.ktdsuniversity.edu.companymember.vo.CompanyVO;
import com.ktdsuniversity.edu.exceptions.AlreadyUseException;
import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
import com.ktdsuniversity.edu.exceptions.UserIdentityNotMatchException;
import com.ktdsuniversity.edu.generalmember.dao.GeneralMemberDAO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.dao.MemberDAO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private CompanyDAO companyDAO;
	@Autowired
	private GeneralMemberDAO generalMemberDAO;
	@Autowired
	private SHA sha;
	@Autowired FileHandler fileHandler;
	
	/**
	 * 작성자: 김광원
	 * 수정자: 신진영(2023-10-19)
	 * 작성일자: 2023-10-19
	 * 내용: createNewMember 쿼리 일반/기업회원별 if문 분기 세팅(setMemberType)
	 * 		transactional 처리
	 */
	@Transactional
	@Override
	public boolean createNewMember(GeneralMemberVO generalMemberVO) {
		int emailCount = memberDAO.getEmailCount(generalMemberVO.getEmail());
		int nicknameCount= memberDAO.getNicknameCount(generalMemberVO.getNickname());
		if(emailCount >0) {
			throw new AlreadyUseException(generalMemberVO, "email이 이미 사용중 입니다.");
		}
		if(nicknameCount >0) {
			throw new AlreadyUseException(generalMemberVO, "Nickname이 이미 사용중 입니다.");
		}
		String salt= sha.generateSalt();
		String password=generalMemberVO.getPw();
		String encryptedPassword = sha.getEncrypt(password, salt);
		generalMemberVO.setPw(encryptedPassword);
		generalMemberVO.setSalt(salt);
		
		generalMemberVO.setMemberType("GENERAL");
		
		int insertMemberCount = memberDAO.createNewMember(generalMemberVO);
		int insertGMemberCount = generalMemberDAO.createNewGeneralMember(generalMemberVO);
		return insertMemberCount>0 && insertGMemberCount>0;
	}

	@Override
	public boolean checkAvailableEmail(String email) {
		int emailCount = memberDAO.getEmailCount(email);
		return emailCount==0;
	}

	@Override
	public boolean checkAvailableNickname(String nickname) {
		int nicknameCount = memberDAO.getNicknameCount(nickname);
		return nicknameCount==0;
	}

	@Override
	public MemberVO getMember(MemberVO memberVO) {
		String salt = memberDAO.getSalt(memberVO.getEmail());
		if(salt == null) {
			throw new UserIdentityNotMatchException(memberVO, "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		String password = memberVO.getPw();
		String encryptedPassword = sha.getEncrypt(password, salt);
		memberVO.setPw(encryptedPassword);
		
		MemberVO member = memberDAO.getMember(memberVO);
		if(member == null) {
			throw new UserIdentityNotMatchException(memberVO, "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		return member;
	}
	/**
	 * 프로필사진 조회
	 */
	@Override
	public MemberVO getOneFile(String email) {
		MemberVO memberVO = memberDAO.getOneFile(email);
		if(memberVO == null) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		return memberVO;
	}

	@Override
	public boolean updateOneFile(MemberVO memberVO, MultipartFile file) {	
		if(file!= null && !file.isEmpty()) {
			MemberVO originMemberVO = memberDAO.getOneFile(memberVO.getEmail());
			if(originMemberVO != null && originMemberVO.getProfilePic() !=null) {
				File originFile = fileHandler.getStoredFile(originMemberVO.getProfilePic());
				if(originFile.exists() && originFile.isFile()) {
					originFile.delete();
				}
			}
			StoredFile storedFile = fileHandler.storeFile(file);
			System.out.println(storedFile.getFileName());
			memberVO.setProfilePic(storedFile.getRealFileName());
		}
		int updateCount = memberDAO.updateOneFile(memberVO);
		return updateCount>0;
	}
	
	@Transactional
	@Override
	public boolean createNewCompanyMember(CompanyVO companyVO
										, MultipartFile file) {
		
		StoredFile storedFile = fileHandler.storeFile(file);
		companyVO.setCompanyRegistCertificateUrl(storedFile.getRealFilePath());
		
		int companyEmailCount = memberDAO.getEmailCount(companyVO.getCompanyEmail());
		
		if (companyEmailCount > 0) {
		throw new IllegalArgumentException("이미 사용중인 기업용 이메일입니다");
		}
		
		companyVO.setEmail(companyVO.getCompanyEmail());
		companyVO.setPw("abc123"); // 기본 pw
		companyVO.setNickname("사명을 입력해주세요");
		companyVO.setMemberType("COMPANY");
		companyVO.setWithdrawYn("N");
		companyVO.setConfirmYn("N");

		String salt= sha.generateSalt();
		String password = companyVO.getPw();
		String encryptedPassword = sha.getEncrypt(password, salt);
		companyVO.setPw(encryptedPassword);
		companyVO.setSalt(salt);
		
//		int insertMemberCount = memberDAO.createNewCompanyMember(companyVO);
		int insertMemberCount = memberDAO.createNewMember(companyVO);
		int insertCompanyMemberCount = companyDAO.createNewCompanyMember(companyVO);
		return insertCompanyMemberCount > 0 && insertMemberCount > 0;
	}

	@Override
	public boolean checkAvailableCompanyEmail(String email) {
		int emailCount = companyDAO.getCompanyEmailCount(email);
		return emailCount == 0;
	}

	@Override
	public boolean withdrawMember(MemberVO memberVO) {
		int updatewithdrawMemberCount = memberDAO.updateWithdrawMember(memberVO);	
		return updatewithdrawMemberCount > 0;
	}
	

}

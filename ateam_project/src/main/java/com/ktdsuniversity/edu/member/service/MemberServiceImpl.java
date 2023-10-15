package com.ktdsuniversity.edu.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.beans.SHA;
import com.ktdsuniversity.edu.exceptions.AlreadyUseException;
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
	private GeneralMemberDAO generalMemberDAO;
	@Autowired
	private SHA sha;
	
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
}

/**
 * 작성자: 김광원
 * 수정자: 신진영(2023-10-20)
 * 수정자: 김태현(2023-10-27)
 * 수정자: 김태현(2023-10-31)
 * 작성일자: 2023-10-19
 * 내용: 일반회원 비밀번호 수정 및 닉네임 수정
 */
package com.ktdsuniversity.edu.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ktdsuniversity.edu.beans.FileHandler;
import com.ktdsuniversity.edu.beans.FileHandler.StoredFile;
import com.ktdsuniversity.edu.beans.SHA;
import com.ktdsuniversity.edu.common.vo.AbstractSearchVO;
import com.ktdsuniversity.edu.companymember.dao.CompanyDAO;
import com.ktdsuniversity.edu.companymember.vo.CompanyVO;
import com.ktdsuniversity.edu.exceptions.AlreadyUseException;
import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
import com.ktdsuniversity.edu.exceptions.UserIdentityNotMatchException;
import com.ktdsuniversity.edu.generalmember.dao.GeneralMemberDAO;
import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
import com.ktdsuniversity.edu.member.dao.MemberDAO;
import com.ktdsuniversity.edu.member.vo.MemberListVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.member.vo.SocialVO;

import io.github.seccoding.web.mimetype.factory.ExtensionFilterFactory;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private CompanyDAO companyDAO;
	@Autowired
	private GeneralMemberDAO generalMemberDAO;
	@Autowired
	private SHA sha;
	@Autowired
	FileHandler fileHandler;

	/**
	 * 회원생성
	 */
	@Transactional
	@Override
	public boolean createNewMember(GeneralMemberVO generalMemberVO) {
		int emailCount = memberDAO.getEmailCount(generalMemberVO.getEmail());
		int nicknameCount = memberDAO.getNicknameCount(generalMemberVO.getNickname());
		if (emailCount > 0) {
			throw new AlreadyUseException(generalMemberVO, "email이 이미 사용중 입니다.");
		}
		if (nicknameCount > 0) {
			throw new AlreadyUseException(generalMemberVO, "Nickname이 이미 사용중 입니다.");
		}
		String salt = sha.generateSalt();
		String password = generalMemberVO.getPw();
		String encryptedPassword = sha.getEncrypt(password, salt);
		generalMemberVO.setPw(encryptedPassword);
		generalMemberVO.setSalt(salt);

		generalMemberVO.setMemberType("GENERAL");

		int insertMemberCount = memberDAO.createNewMember(generalMemberVO);
		int insertGMemberCount = generalMemberDAO.createNewGeneralMember(generalMemberVO);
		return insertMemberCount > 0 && insertGMemberCount > 0;
	}

	/**
	 * email체크
	 */
	@Override
	public boolean checkAvailableEmail(String email) {
		int emailCount = memberDAO.getEmailCount(email);
		return emailCount == 0;
	}

	/**
	 * 닉네임 체크
	 */
	@Override
	public boolean checkAvailableNickname(String nickname) {
		int nicknameCount = memberDAO.getNicknameCount(nickname);
		return nicknameCount == 0;
	}

	/**
	 * 일반 회원 로그인
	 */
	@Override
	public MemberVO getGeneralMember(MemberVO memberVO) {
		String salt = memberDAO.getSalt(memberVO.getEmail());
		if (salt == null) {
			throw new UserIdentityNotMatchException(memberVO, "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		String password = memberVO.getPw();
		String encryptedPassword = sha.getEncrypt(password, salt);
		memberVO.setPw(encryptedPassword);

		MemberVO member = memberDAO.getGeneralMember(memberVO);
		if (member == null) {
			throw new UserIdentityNotMatchException(memberVO, "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		return member;
	}

	/**
	 * 기업 회원 로그인
	 */
	@Override
	public MemberVO getCompanyMember(MemberVO memberVO) {
		String salt = memberDAO.getSalt(memberVO.getEmail());
		if (salt == null) {
			throw new UserIdentityNotMatchException(memberVO, "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		String password = memberVO.getPw();
		String encryptedPassword = sha.getEncrypt(password, salt);
		memberVO.setPw(encryptedPassword);

		MemberVO member = memberDAO.getCompanyMember(memberVO);
		if (member == null) {
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
		if (memberVO == null) {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
		return memberVO;
	}

	/**
	 * 프로필사진 수정
	 */
	@Transactional
	@Override
	public boolean updateOneFile(MemberVO memberVO, MultipartFile file) {
		StoredFile storedFile = fileHandler.storeFile(file);
		if (file != null && !file.isEmpty()) {
			MemberVO originMemberVO = memberDAO.getOneFile(memberVO.getEmail());
			if (originMemberVO != null && originMemberVO.getProfilePic() != null) {
				File originFile = fileHandler.getStoredFile(originMemberVO.getProfilePic());
				if (originFile.exists() && originFile.isFile()) {
					originFile.delete();
				}
			}
			memberVO.setProfilePic(storedFile.getRealFileName());
		}

		int updateCount = memberDAO.updateOneFile(memberVO);
		return updateCount > 0;
	}

	/**
	 * 프로필사진 삭제
	 */
	@Transactional
	@Override
	public boolean deleteProfile(String email) {
		int deleteCount = memberDAO.deleteProfile(email);
		return deleteCount > 0;
	}

	@Transactional
	@Override
	public boolean createNewCompanyMember(CompanyVO companyVO, MultipartFile file) {

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

		String salt = sha.generateSalt();
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

	/**
	 * 일반회원조회
	 */
	@Override
	public MemberVO selectMemberinfo(String email) {
		MemberVO memberVO = memberDAO.selectMemberinfo(email);
		return memberVO;
	}

	/**
	 * 일반회원 닉네임 비밀번호 수정
	 */
	@Transactional
	@Override
	public boolean updateMemberNickname(MemberVO memberVO) {
		int nickNameCount = memberDAO.getNicknameCount(memberVO.getEmail());
		if (nickNameCount > 0) {
			throw new AlreadyUseException(memberVO, "email이 이미 사용중 입니다.");
		}
		int updateCount = memberDAO.updateMemberNickname(memberVO);
		return updateCount > 0;
	}

	/**
	 * 일반회원 비밀번호 수정
	 */
	@Transactional
	@Override
	public boolean updateMemberPW(MemberVO memberVO) {
		int updateCount = memberDAO.updateMemberPW(memberVO);
		return updateCount > 0;
	}

	// 회원유형 구분해서 회원찾기
	@Override
	public List<MemberVO> searchMember(String memberType) {
		return memberDAO.searchMember(memberType);
	}

	// 관리를 위한 일반 회원 목록 조회
	public List<MemberVO> searchGemeralTypeMemberList() {
		return memberDAO.searchGemeralTypeMemberList();
	}

	@Override
	public List<MemberVO> searchCompanyTypeMemberList() {
		return memberDAO.searchCompanyTypeMemberList();
	}

	// 통합검색
	@Override
	public MemberListVO searchAllMemberByKeyword(AbstractSearchVO abstractSearchVO) {

		if (abstractSearchVO == null || abstractSearchVO.getSearchKeyword() == null
				|| abstractSearchVO.getSearchKeyword().length() == 0) {
			return new MemberListVO();
		}
		MemberListVO memberListVO = new MemberListVO();
		memberListVO.setMemberList(memberDAO.searchAllMemberByKeyword(abstractSearchVO));
		return memberListVO;
	}

	/* 토큰 받아오기 */
	@Override
	public String getAccessToken(String authorizeCode) {
		String accessToken = "";
		String refreshToken = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=2a9927f831835710fa3d3d37b078389c"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8080/member/kakaoLogin"); // 본인이 설정한 주소

			sb.append("&code=" + authorizeCode);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
			System.out.println("access_token : " + accessToken);
			System.out.println("refresh_token : " + refreshToken);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return accessToken;
	}

	/* 사용자 정보 가져오기 */
	@Override
	public SocialVO getUserInfo(String accessToken) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakaoAccount.getAsJsonObject().get("email").getAsString();
		
			
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			userInfo.put("accessToken", accessToken);
		} catch (IOException e) {
			e.printStackTrace();
		}
		SocialVO socialVO = memberDAO.findkakao(userInfo);
		if (socialVO == null) {
			memberDAO.kakaoinsert(userInfo);
			return memberDAO.findkakao(userInfo);
		} else {
			return socialVO;
		}
	}

	@Override
	public void kakaoLogout(String accessToken) {
        String reqURL = "https://kapi.kakao.com/v1/user/logout";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

            int responseCode = conn.getResponseCode();
            System.out.println("ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋresponseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String result = "";
            String line = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	 

}

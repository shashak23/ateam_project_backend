package com.ktdsuniversity.edu.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.companymember.dao.CompanyDAO;
import com.ktdsuniversity.edu.companymember.vo.CompanyListVO;
import com.ktdsuniversity.edu.companymember.vo.CompanyVO;

import jakarta.mail.internet.MimeMessage;

@Service
public class MaileServiceImpl implements MailService {
	
	@Autowired
	private CompanyDAO companyDAO;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Value("${spring.mail.username}")
	String sendFrom;
	
	
	
	@Override
	public CompanyListVO getAllCompanyMember() {
		CompanyListVO companyListVO = new CompanyListVO();
		companyListVO.setCompanyCnt(companyDAO.companyMemberAllCount());
		companyListVO.setCompanyList(companyDAO.CompanyMemberAllList());
		return companyListVO;
	}
	
	
	@Override
	public void sendApprovalMail(CompanyVO companyVO) {
		
		    MimeMessage message = javaMailSender.createMimeMessage();

		    try{
		        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		        
		        // 1. 메일 수신자 설정
		        String receiver = companyVO.getCompanyEmail();
		        messageHelper.setTo(receiver);

		        // 2. 메일 제목 설정
		        messageHelper.setSubject("기업회원가입이 승인되었습니다");

		        // 3. 메일 내용 설정
		        // HTML 적용됨
		        String content = "축하합니다! 기업회원가입이 완료되었습니다.</br> 기본비밀번호는 \"abc123\"이며, 마이페이지에서 변경가능합니다.";
		        messageHelper.setText(content,true);

		        // 4. 메일 전송
		        javaMailSender.send(message);
		        } catch(Exception e){
//		        logger.info(e.toString());
		        	}
		    }


	@Override
	public void sendRefuseMail(CompanyVO companyVO) {
		
	    MimeMessage message = javaMailSender.createMimeMessage();

	    try{
	        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	        
	        // 1. 메일 수신자 설정
	        String receiver = companyVO.getCompanyEmail();
	        messageHelper.setTo(receiver);

	        // 2. 메일 제목 설정
	        messageHelper.setSubject("기업회원가입이 거부되었습니다");

	        // 3. 메일 내용 설정
	        // HTML 적용됨
	        String content = "죄송합니다. 사업자등록증을 다시 한번 확인하시거나 고객센터로 연락주시길 바랍니다.";
	        messageHelper.setText(content,true);

	        // 4. 메일 전송
	        javaMailSender.send(message);
	        } catch(Exception e){
//	        logger.info(e.toString());
	        	}
	    }


	@Override
	public boolean doCompleteCompanyMemberRegistrationYn(String companyEmail) {
		int CompleteCompanyMemberRegistrationYnCount = companyDAO.CompleteCompanyMemberRegistrationYn(companyEmail);
		return CompleteCompanyMemberRegistrationYnCount > 0;
	}

		
	}

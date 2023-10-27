package com.ktdsuniversity.edu.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;

@Service
public class MaileServiceImpl implements MailService {
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Value("${spring.mail.username}")
	String sendFrom;
	
	
	@Override
	public void sendMail() {
		
//		MimeMessagePreparator preparator = new MimeMessagePreparator() {
//			
//			String sendTo = "murasaki1207@gmail.com";
//			String mailTitle = "메일 테스트입니당";
//			String mailContent = "보내져라,,,,";
//			
//			@Override
//			public void prepare(MimeMessage mimeMessage) throws Exception {
//				final MimeMessageHelper message = new MimeMessageHelper(mimeMessage,true,"UTF-8");
//
//				message.setTo(sendTo);
//				message.setFrom(sendFrom);	//env.getProperty("spring.mail.username")
//				message.setSubject(mailTitle);
//				message.setText(mailContent, true); //ture : html 형식 사용
//					
//				//Mail에 img 삽입
//				ClassPathResource resource = new ClassPathResource("img 주소/img 이름.png");
//				message.addInline("img", resource.getFile());
//			
//			}
//		};
//
//		try{
//			javaMailSender.send(preparator);
//		} catch (MailException e){
//			return false;
//		}
//		return true;		
//		}
		
		    MimeMessage message = javaMailSender.createMimeMessage();

		    try{
		        MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		        
		        // 1. 메일 수신자 설정
		        String receiver = "murasaki1207@gmail.com";
		        messageHelper.setTo(receiver);

		        // 2. 메일 제목 설정
		        messageHelper.setSubject("test_subject");

		        // 3. 메일 내용 설정
		        // HTML 적용됨
		        String content = "????????????";
		        messageHelper.setText(content,true);

		        // 4. 메일 전송
		        javaMailSender.send(message);
		    } catch(Exception e){
//		        logger.info(e.toString());
		    }
		    }

}

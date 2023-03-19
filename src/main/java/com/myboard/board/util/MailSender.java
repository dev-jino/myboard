package com.myboard.board.util;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailSender {
	@Autowired
	private JavaMailSender javaMailSender;
	private String authNumber;
	
	public void makeRandomNumber() {
		Random random = new Random();
		String singleNum = "";
		String resultNum = "";
		
		for (int i = 0; i < 6 ; i++) { 
			singleNum = Integer.toString(random.nextInt(9));
			resultNum += singleNum;
		}
		authNumber = resultNum;
	}
	
	public String makeAuthEmail(String email) {
		makeRandomNumber();
		String fromMail = "myBoardAuth@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 메일입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." +
						"<br>" +
						"인증 번호는 <span style='color:red;'>" + authNumber + "</span> 입니다." +
						"<br>" +
						"해당 인증번호를 인증 확인란에 입력해 주세요.";
		
		mailSend(fromMail, toMail, title, content);
		
		return authNumber;
	}
	
	public void mailSend(String formMail, String toMail, String title, String content) {
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(formMail);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			javaMailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}


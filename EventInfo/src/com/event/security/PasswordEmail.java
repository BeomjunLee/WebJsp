package com.event.security;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class PasswordEmail {

		String user = "qjawnswkd0577@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String password = "qjawnswkd";   // 패스워드
        
        public String sendEmail(String to) throws Exception{
        	String result = "fail";
        	Properties prop = new Properties();
	        prop.put("mail.smtp.host", "smtp.gmail.com"); 
	        prop.put("mail.smtp.port", 465); 
	        prop.put("mail.smtp.auth", "true"); 
	        prop.put("mail.smtp.ssl.enable", "true"); 
	        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	        
	        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(user, password);
	            }
	        });
	        
	        //인증코드 생성
	        Random ran = new Random();
	        
	        StringBuffer buffer = new StringBuffer();
	        for(int i = 0; i < 6; i++) {
	        	if(ran.nextBoolean()) {
	        		buffer.append(((int)(ran.nextInt(10)))); // 랜덤 한 소문자)
	        	}else {
	        		buffer.append((char)((int)(Math.random()*26)+65));
	        	}
	        }
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(user));
	            	
	            //수신자메일주소
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); 
	            
	            // Subject
	            message.setSubject("눈담화 :: 비밀번호 찾기 메일입니다"); //메일 제목을 입력
	
	            // Text
	            message.setText("비밀번호 변경 인증번호는 [" + buffer + "]" + " 입니다");    //메일 내용을 입력
	
	            // send the message
	            Transport.send(message); ////전송
	            System.out.println("메일 보내기 성공");
	            return result = buffer.toString();
        }


}

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

		String user = "qjawnswkd0577@gmail.com"; // ���̹��� ��� ���̹� ����, gmail��� gmail ����
        String password = "qjawnswkd";   // �н�����
        
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
	        
	        //�����ڵ� ����
	        Random ran = new Random();
	        
	        StringBuffer buffer = new StringBuffer();
	        for(int i = 0; i < 6; i++) {
	        	if(ran.nextBoolean()) {
	        		buffer.append(((int)(ran.nextInt(10)))); // ���� �� �ҹ���)
	        	}else {
	        		buffer.append((char)((int)(Math.random()*26)+65));
	        	}
	        }
	            MimeMessage message = new MimeMessage(session);
	            message.setFrom(new InternetAddress(user));
	            	
	            //�����ڸ����ּ�
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); 
	            
	            // Subject
	            message.setSubject("����ȭ :: ��й�ȣ ã�� �����Դϴ�"); //���� ������ �Է�
	
	            // Text
	            message.setText("��й�ȣ ���� ������ȣ�� [" + buffer + "]" + " �Դϴ�");    //���� ������ �Է�
	
	            // send the message
	            Transport.send(message); ////����
	            System.out.println("���� ������ ����");
	            return result = buffer.toString();
        }


}

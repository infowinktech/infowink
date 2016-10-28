package com.java.portal.utilities;

import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.java.portal.service.impl.AdminServiceImpl;

@Component
public class MailUtility {
	private static final Logger log = Logger.getLogger(AdminServiceImpl.class);
	public static void main(String [] args){/*
		FileUtility fu = new FileUtility();
		String body = fu.readFile("C:\\mail.html");
		String to = "knrao75@gmail.com";
		String from = "no-reply@in.bosch.com";
		String subject = "Test Mail";
		send(from, to, subject, body, new ArrayList<String>(), new ArrayList<String>());
	*/}
	
	public static boolean send(String from,String to,String subject,String body, ArrayList<String> ccList,ArrayList<String> bccList){

	      try {
	          Session session;
	          Message message;
	          InternetAddress fromAddress;
	          InternetAddress toAddress;
	          Properties properties;
	          properties  = new Properties();
	          properties.put("mail.smtp.host", "rb-smtp-int.bosch.com");
 
	          session = Session.getInstance(properties, null);
	          message  =   new MimeMessage(session);
	          fromAddress    =   new InternetAddress(from);
	          toAddress      =   new InternetAddress(to);
	          message.setFrom(fromAddress);
	          message.setRecipient(RecipientType.TO, toAddress);
	          
	        
	          for(int i=0;i<ccList.size();i++){
	        	message.addRecipient(Message.RecipientType.CC,new InternetAddress(ccList.get(i)));
	  	    	}
	          for(int i=0;i<bccList.size();i++){
	        	  message.addRecipient(Message.RecipientType.BCC,new InternetAddress(bccList.get(i)));
		  	  }
	          message.setSubject(subject);
	          Multipart mp = new MimeMultipart();
	          //Building Body
	          MimeBodyPart htmlPart = new MimeBodyPart();
	          htmlPart.setContent(body, "text/html");
	          mp.addBodyPart(htmlPart);
	          
	          /*//Attaching files if any
	          BodyPart messageBodyPart = new MimeBodyPart();
	          String filename = "C:/request.html";
	          DataSource source = new FileDataSource(filename);
	          messageBodyPart.setDataHandler(new DataHandler(source));
	          messageBodyPart.setFileName(filename);
	          mp.addBodyPart(messageBodyPart);*/
	          message.setContent(mp);
	          Transport.send(message);
	          log.info("mail sent");
	          
	        } catch (MessagingException ex) {
	            ex.printStackTrace();
	            return false;
	        }
	  
	      return true;
	}
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Actionclasses;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author Anshul jhalani
 */
public class previewSendmail {
    public static void send(final String from,final String password,String to,String sub,String msg){  
          //Get properties object    
          Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");       
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465"); 
          /*
          SSL allows web browsers and web servers to communicate over a secure connection. 
          In this secure connection, the data is encrypted before being sent and then is decrypted
          upon receipt and before processing. Both the browser and the server encrypt all traffic
          before sending any data.
          */
          props.put("mail.smtp.ssl.enable", "true");
          //get Session   
          Session session = Session.getDefaultInstance(props,    
           new javax.mail.Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(from,password);  
           }    
          });    
          //compose message    
          try {    
           MimeMessage message = new MimeMessage(session);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
           message.setSubject(sub);    
           message.setText(msg);    
           //send message  
           Transport.send(message);    
           System.out.println("message sent successfully");    
          } catch (MessagingException e) {throw new RuntimeException(e);}    
             

    }
    /*public static void main(String []args)
    {
         Mailer.send("mailid from we have to send", "password", "", "ping", "hi.....ready to send mail");
    }
    */
    public previewSendmail()
    {   String emails,Msg,Subj;
       Preview pree=new Preview();
        emails=pree.getEmail();
        Msg=pree.getMail();
        Subj=pree.getSubject();
    previewSendmail.send("mailid from we have to send", "password", emails, Subj,Msg);
    }
}

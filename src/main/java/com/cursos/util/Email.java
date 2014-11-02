package com.cursos.util;

/**
 * Created with IntelliJ IDEA.
 * User: Cesar Cortes
 * Date: 12/17/13
 * Time: 12:08 PM
 * To change this template use File | Settings | File Templates.
 */


import com.cursos.model.ConfiguracionModel;
import com.cursos.service.sistema.SistemaService;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.*;
import java.util.Properties;

public class Email {

    private Properties configuration = System.getProperties();
    private SistemaService sistemaService;


    public void init() {
        configuration.put("mail.smtp.starttls.enable", "true");
        configuration.put("mail.smtp.host", "smtp.gmail.com");
        configuration.put("mail.smtp.port", "587");
        configuration.put("mail.smtp.auth", "true");
    }

    public void sendEmail(String from, String to, String body, String subject) throws Exception{
        init();

        try {
            final ConfiguracionModel configuracionModel = getSistemaService().getConfiguracion();
            from = configuracionModel.getCorreo();
        Session session = Session.getDefaultInstance(configuration,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(configuracionModel.getCorreo(),configuracionModel.getPasswordCorreo());
                    }
                }
        );


            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public void setSistemaService(SistemaService sistemaService) {
        this.sistemaService = sistemaService;
    }

    public SistemaService getSistemaService() {
        return sistemaService;
    }
}
package com.jjobkorea.service;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
@Slf4j
@Service
public class EmailService {

    private final JavaMailSender javaMailSender;
    private final Map<String, String> verificationCodes = new HashMap<>();

    public EmailService(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }


    private String generateCode() {
        return UUID.randomUUID().toString().substring(0, 6);
    }

    public void sendEmail(String toEmail) throws MessagingException {
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setSubject("인증코드 발송");

        String authCode = generateCode();
        String emailContent = "<h1>인증 코드</h1>" +
                              "<p>다음 인증 코드를 사용하세요: <strong>" + authCode + "</strong></p>";
        helper.setText(emailContent, true);

        helper.setTo(toEmail);

        helper.setFrom("your-email@gmail.com");

        verificationCodes.put(toEmail, authCode);

        javaMailSender.send(message);
    }

    public boolean verifyEmailCode(String inputCode, String email) {

        String actualCode = verificationCodes.get(email);
        if (actualCode != null && actualCode.equals(inputCode)) {
            verificationCodes.remove(email);
            return true;
        }
        return false;
    }
}
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

    // 인증 코드 생성 메서드
    private String generateCode() {
        return UUID.randomUUID().toString().substring(0, 6); // 간단한 6자리 인증 코드 생성
    }

    // 이메일을 생성하고 발송하는 메서드
    public void sendEmail(String toEmail) throws MessagingException {
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        
        // 이메일 제목 설정
        helper.setSubject("인증코드 발송");

        // 이메일 내용 설정 (여기에 더 구체적인 HTML 템플릿을 사용할 수 있습니다)
        String authCode = generateCode();
        String emailContent = "<h1>인증 코드</h1>" +
                              "<p>다음 인증 코드를 사용하세요: <strong>" + authCode + "</strong></p>";
        helper.setText(emailContent, true);

        // 수신자 이메일 주소 설정
        helper.setTo(toEmail);

        // 발신자 이메일 주소 설정 (여기서는 Gmail 주소 사용)
        helper.setFrom("your-email@gmail.com");

        // 인증 코드를 Map에 저장
        verificationCodes.put(toEmail, authCode);

        // 이메일 발송
        javaMailSender.send(message);
    }

 // 이메일 코드 확인 메서드
    public boolean verifyEmailCode(String inputCode, String email) {
        log.debug("EmailService.verifyEmailCode() - Verifying code for email: {}, Input Code: {}", email, inputCode);
        String actualCode = verificationCodes.get(email);
        log.debug("EmailService.verifyEmailCode() - Actual Code: {}", actualCode);
        if (actualCode != null && actualCode.equals(inputCode)) {
            // 인증 성공 시 코드 제거
            verificationCodes.remove(email);
            log.debug("EmailService.verifyEmailCode() - Verification successful");
            return true;
        }
        log.debug("EmailService.verifyEmailCode() - Verification failed");
        return false;
    }
}
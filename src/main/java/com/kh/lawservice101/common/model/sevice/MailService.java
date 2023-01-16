package com.kh.lawservice101.common.model.sevice;

import com.kh.lawservice101.client.model.service.ClientService;
import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;

@Service
@RequiredArgsConstructor
public class MailService {
    private final JavaMailSender mailSender;
    private final LawyerService lawyerService;
    private final ClientService clientService;
    private static final String FROM_ADDRESS = "법률서비스101 <lawservice101@lawservice101.kh.com>";
    public void mailSend(String findIdEmail) {
        String memberId = "";

        LawyerVo lawyerVo = lawyerService.findLawyerByEmail(findIdEmail);
        if (lawyerVo == null) {
            ClientVo clientVo = clientService.findClientByEmail(findIdEmail);
            if (clientVo == null) {
                memberId = "이메일과 일치하는 아이디가 없습니다.";
            } else {
                memberId = clientVo.getClientId();
            }
        } else {
            memberId = lawyerVo.getLawyerId();
        }

        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
            mailHelper.setTo(findIdEmail);
            mailHelper.setFrom(FROM_ADDRESS);
            mailHelper.setSubject("[법률서비스101] 아이디 찾기 관련 메일 발송");
            mailHelper.setText("<h2>법률서비스101</h2><p>회원 아이디 : <strong>" + memberId + "</strong></p>", true);
            mailSender.send(mail);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}

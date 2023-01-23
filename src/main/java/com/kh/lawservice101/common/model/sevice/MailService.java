package com.kh.lawservice101.common.model.sevice;

import com.kh.lawservice101.client.model.service.ClientService;
import com.kh.lawservice101.client.model.vo.ClientVo;
import com.kh.lawservice101.lawyer.model.service.LawyerService;
import com.kh.lawservice101.lawyer.model.vo.LawyerVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
@RequiredArgsConstructor
@Slf4j
public class MailService {
    private final JavaMailSender mailSender;
    private final LawyerService lawyerService;
    private final ClientService clientService;
    private static final String FROM_ADDRESS = "법률서비스101 <lawservice101@lawservice101.kh.com>";
    private MimeMessage mail;
    public void findIdMailSend(String findIdEmail) {
        String memberId = "";

        try {
            MimeMessageHelper mailHelper = getMimeMessageHelper(findIdEmail);
            mailHelper.setSubject("[법률서비스101] 아이디 찾기 관련 메일 발송");

            // 이메일과 일치하는 lawyer 조회
            LawyerVo lawyerVo = lawyerService.findLawyerByEmail(findIdEmail);
            if (lawyerVo == null) {

                // 이메일과 일치하는 lawyer가 없는 경우 client 조회
                ClientVo clientVo = clientService.findClientByEmail(findIdEmail);
                if (clientVo == null) {
                    mailHelper.setText("<h2>이메일과 일치하는 아이디가 없습니다.</h2>", true);
                } else {
                    memberId = clientVo.getClientId();
                    mailHelper.setText("<h2>법률서비스101</h2><p>회원 아이디 : <strong>" + memberId + "</strong></p>", true);
                }
            } else {
                memberId = lawyerVo.getLawyerId();
                mailHelper.setText("<h2>법률서비스101</h2><p>회원 아이디 : <strong>" + memberId + "</strong></p>", true);
            }

            mailSender.send(mail); // 이메일 전송

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public void resetPwdEmailSend(String resetPwdId, String resetPwdEmail) {
        String tempPwd = getTmpPassword(); // 임시 비밀번호

        try {
            MimeMessageHelper mailHelper = getMimeMessageHelper(resetPwdEmail);
            mailHelper.setSubject("[법률서비스101] 비밀번호 찾기 관련 메일 발송");

            // 이메일과 일치하는 lawyer 조회
            LawyerVo lawyerVo = lawyerService.findLawyerByIdAndEmail(resetPwdId, resetPwdEmail);
            if (lawyerVo == null) {

                // 이메일과 일치하는 lawyer가 없는 경우 client 조회
                ClientVo clientVo = clientService.findClientByIdAndEmail(resetPwdId, resetPwdEmail);
                if (clientVo == null) {
                    mailHelper.setText("<h2>이메일과 일치하는 아이디가 없습니다.", true);
                } else {
                    clientService.passwordModify(tempPwd, clientVo.getClientNum());
                    mailHelper.setText("<h2>법률서비스101</h2><p>임시 비밀번호 : <strong>" + tempPwd + "</strong></p>", true);
                }
            } else {
                lawyerService.passwordModify(tempPwd, lawyerVo.getLawyerNum());
                mailHelper.setText("<h2>법률서비스101</h2><p>회원 임시 비밀번호 : <strong>" + tempPwd + "</strong></p>", true);
            }

            mailSender.send(mail); // 이메일 전송

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    private MimeMessageHelper getMimeMessageHelper(String email) throws MessagingException {
        mail = mailSender.createMimeMessage();
        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
        mailHelper.setTo(email);
        mailHelper.setFrom(FROM_ADDRESS);
        return mailHelper;
    }

    private String getTmpPassword() {
        char[] charSet = new char[]{ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
                'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};

        String pwd = "";

        // 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 조합
        int idx = 0;
        for(int i = 0; i < 10; i++){
            idx = (int) (charSet.length * Math.random());
            pwd += charSet[idx];
        }

        log.info("임시 비밀번호 생성");

        return pwd;
    }
}

package vn.edu.hcmuaf.fit.bibica.utils;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class EmailUtils {
    private static final String SENDER_EMAIL = "nguyenphivu10b10@gmail.com"; // Email của bạn
    private static final String SENDER_PASSWORD = "pana hxkj dmhg nznh"; // Mật khẩu ứng dụng (App Password)

    public static void sendEmail(String toEmail, String subject, String body) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject(subject);
            message.setText(body); // Hoặc dùng setContent(body, "text/html; charset=utf-8") nếu gửi HTML

            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    // Hàm sinh mã OTP ngẫu nhiên 6 số
    public static String generateOTP() {
        Random random = new Random();
        int number = random.nextInt(999999);
        return String.format("%06d", number);
    }
}

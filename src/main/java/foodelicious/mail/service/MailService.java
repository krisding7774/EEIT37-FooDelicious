package foodelicious.mail.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	@Autowired
	private JavaMailSender mailSender;

	public void forgetPwd(String toEmail, String subject, String body) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("FooDelicious.eeit13702@gmail.com");
		message.setTo(toEmail);
		message.setText(body);
		message.setSubject(subject);
		mailSender.send(message);
		System.out.println("mail has been send");
	}

	public void sendEmailHTML(String toEmail, String subject, String body) throws MessagingException {
		MimeMessage mimeMessage = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "utf-8");
		mimeMessage.setContent(body, "text/html;charset=utf-8");
		helper.setFrom("FooDelicious.eeit13702@gmail.com");
		helper.setTo(toEmail);
		helper.setSubject(subject);
		mailSender.send(mimeMessage);
		System.out.println("mail has been send");
	}

	public void prepareAndSend(String recipient, String title, String message) {
		MimeMessagePreparator messagePreparator = mimeMessage -> {
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
			messageHelper.setFrom("FooDelicious.eeit13702@gmail.com");
			messageHelper.setTo(recipient);
			messageHelper.setSubject(title);
			messageHelper.setText(message);
		};
		try {
			mailSender.send(messagePreparator);
		} catch (MailException e) {
			e.printStackTrace();
		}
	}

	public String receiveProblemReports(String sender, String companyName) {
		MimeMessagePreparator messagePreparator = mimeMessage -> {
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
			messageHelper.setFrom(sender);
			messageHelper.setTo("FooDelicious.eeit13702@gmail.com");
			messageHelper.setSubject("廠商問題回報通知");
			messageHelper.setText(companyName + " 回報了一個問題，快去訊息查看!");
		};

		try {
			mailSender.send(messagePreparator);
			return "信件發送成功";
		} catch (MailException e) {
			return "信件發送失敗";
		}

	}

	public String sendPriceChange(String receiver, String message) {
		MimeMessagePreparator messagePreparator = mimeMessage -> {
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
			messageHelper.setTo(receiver);
			messageHelper.setFrom("FooDelicious.eeit13702@gmail.com");
			messageHelper.setSubject("商品價格變動!");
			messageHelper.setText(message);
		};

		try {
			mailSender.send(messagePreparator);
			return "信件發送成功";
		} catch (MailException e) {
			return "信件發送失敗";
		}

	}

}

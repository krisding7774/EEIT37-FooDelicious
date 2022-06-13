package foodelicious.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import foodelicious.mail.service.MailService;

@Controller
public class MailController {

	@Autowired
	private MailService mailService;

	@GetMapping("/mailto")
	@ResponseBody
	public String hello() {
		mailService.prepareAndSend("請輸入信箱@gmail.com", "title", "Sample mail subject");
		return "Mail sent";
	}
}

package foodelicious.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import foodelicious.mail.service.MailService;
import foodelicious.member.model.Member;
import foodelicious.member.service.MemberService;
import net.bytebuddy.utility.RandomString;

@Controller
public class MemberLoginController {

	@Autowired
	MemberService memberService;

	@Autowired
	MailService mailService;

	ServletContext context;

	public MemberLoginController(MemberService memberService, MailService mailService) {
		super();
		this.memberService = memberService;
		this.mailService = mailService;
	}

	@GetMapping("/normallogout")
	public String logout(HttpServletRequest request, HttpServletResponse response, SessionStatus status) {
		HttpSession session = request.getSession();
		status.setComplete();
		session.invalidate(); // session.invalidate()讓SESSION失效.

		return "app.index";
	}
	
	// 到忘記密碼頁面
		@GetMapping("/pwdForgetPage")
		public String toMemberPage() {
			return "app.pwdForgetPage";
		}

	// 忘記密碼寄送mail
	@PostMapping("/pwdForgetAction.controller")
	public String MemberForgetAction(Model m, HttpSession session, @RequestParam String memberMail) {
		Member findemail = memberService.findByMemberMail(memberMail);
		
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		if (findemail == null) {
			errors.put("msg", "您尚未是會員，請註冊會員，謝謝!");
			return "app.LoginSystem";
		}
		Map<String, String> map = (Map<String, String>) session.getAttribute("randomCode");
		if (map == null) {
			map = new HashMap<>();
			session.setAttribute("randomCode", map);
		}
		RandomString rs = new RandomString(50);
		String random = rs.nextString();
		map.put(random, random);
		System.out.println("random=" + random);
		String link = "http://localhost:8080/" + random;
		mailService.forgetPwd(memberMail, "修改密碼", "請於20分鐘內按下列連結:" + link);
		session.setAttribute("forgetmail", memberMail);
		return "app.pwdChange";
	}

	// 信件內容連結驗證方法
	@GetMapping("/{random}")
	public String confirm2(Model m, HttpSession session, @PathVariable String random) {
		String result = null;
		Map<String, String> map = (Map<String, String>) session.getAttribute("randomCode");
		if (map == null) {
			result = "電子郵件認證失敗";
		} else {
			String value = map.get(random);
			if (value != null && value.equals(random)) {
				result = "電子郵件認證成功";
			}
		}
//		System.out.println("result:" + result);
		m.addAttribute("result", result);
		return "app.pwdChange";
	}

	//點連結進去修改密碼成功
	@PostMapping("/pwdForgetSuccess.controller")
	public String EmailChangeSuccess(Model m, HttpSession session, @RequestParam("emailAddress") String email,
			@RequestParam("password") String password ) {
		
		Member mEmail = memberService.findByMemberMail(email);
		System.out.println("===============");
		
		mEmail.setPwd(password);
		memberService.update(mEmail);
		session.removeAttribute("randomCode");
		return "app.pwdForgetSuccess";
		
		
	}
	
}

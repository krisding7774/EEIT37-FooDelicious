package foodelicious.mainpage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import foodelicious.member.model.Member;
import foodelicious.member.model.TotalUseEMDaoService;
import foodelicious.member.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainUpdateController {

	TotalUseEMDaoService EMDaoService;

	MemberService memberService;

	public MainUpdateController(TotalUseEMDaoService eMDaoService, MemberService memberService) {
		this.EMDaoService = eMDaoService;
		this.memberService = memberService;
	}

	@PostMapping(path = "/checklogin.controller")
	public String processAction(@RequestParam("memberMail") String memberMail, @RequestParam("pwd") String pwd, Model m,
			HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);

		if (memberMail == null || memberMail.length() == 0) {
			errors.put("memberMail", "請輸入帳號");
		}
		if (pwd == null || pwd.length() == 0) {
			errors.put("pwd", "請輸入密碼");
		}
		if (errors != null && !errors.isEmpty()) {
			return "app.LoginSystem";
		}

		boolean resultStatus = EMDaoService.checkLogin(new Member(memberMail, pwd));
		if (resultStatus) {
			m.addAttribute("memberMail", memberMail);
			m.addAttribute("pwd", pwd);
			Long EMid = EMDaoService.findId(new Member(memberMail, pwd));
			session.setAttribute("memberMail", memberMail);
			session.setAttribute("pwd", pwd);
			session.setAttribute("userID", EMid);// findByMemberId
			session.setAttribute("userName", memberService.findByMemberId(EMid).getMemberName());
			session.setAttribute("memberPhone",memberService.findByMemberId(EMid).getMemberPhone());
			session.setAttribute("memberAddress", memberService.findByMemberId(EMid).getMemberAddress());
			session.setAttribute("memberPic", memberService.findByMemberId(EMid).getMemberPic());
			session.setAttribute("memberMail", memberService.findByMemberId(EMid).getMemberMail());
			session.setAttribute("memberGender", memberService.findByMemberId(EMid).getMemberGender());
			session.setAttribute("memberBirth", memberService.findByMemberId(EMid).getMemberBirth());
			session.setAttribute("memberDiscountId", memberService.findByMemberId(EMid).getMemberDiscountId());
			session.setAttribute("member_status", memberService.findByMemberId(EMid).getMember_status());
			session.setAttribute("memberCoin", memberService.findByMemberId(EMid).getMemberCoin());
			session.setAttribute("register_date", memberService.findByMemberId(EMid).getRegister_date());
//			System.out.println("userName：" + session.getAttribute("userName"));
//			System.out.println("EMid：" + session.getAttribute("userID"));

			// 查詢成功登入的會員身份
			String level = EMDaoService.findId2(EMid);
//			System.out.println("level：" + level);
			if (level.equals("company")) {
				return "app.CompanyMain2";
			} else {
//				System.out.println("userID：" + session.getAttribute("userID"));
				return "app.index";
			}
		}

		errors.put("msg", "請輸入正確的帳號密碼");
		return "app.LoginSystem";
	}

}
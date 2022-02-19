package foodelicious.cashflow.restcontroller;

import java.util.HashMap;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import foodelicious.cashflow.service.CashflowAddressService;
import foodelicious.mail.service.MailService;
import foodelicious.member.model.Member;
import foodelicious.member.repository.MemberRepositoryImpl;
import foodelicious.member.service.MemberService;
import foodelicious.orders.service.OrdersDetailService;
import foodelicious.orders.service.OrdersService;

@RestController
@Transactional
public class CashFlowAddressRestController {

	@PersistenceContext
	EntityManager em;

	private HttpSession session;
	private CashflowAddressService cashflowAddressService;
	private MailService mailService;
	private MemberRepositoryImpl memberRepositoryImpl;
	private MemberService memberService;
	private OrdersService ordersService;
	private OrdersDetailService orderdetailService;

	public CashFlowAddressRestController(CashflowAddressService cashflowAddressService,
			MemberRepositoryImpl memberRepositoryImpl, MemberService memberService, MailService mailService,
			HttpSession session,OrdersService ordersService,OrdersDetailService orderdetailService) {

		this.cashflowAddressService = cashflowAddressService;
		this.mailService = mailService;
		this.memberRepositoryImpl = memberRepositoryImpl;
		this.session = session;
		this.memberService = memberService;
		this.ordersService = ordersService;
		this.orderdetailService = orderdetailService;
	}

//	@PostMapping("/Address.controller")
//	public void postAddress(@RequestBody Map<String, String> params, HttpSession session) {
//
//		Long id = (Long) session.getAttribute("userID");
//
//		cashflowAddressService.pushAddress(params, id);
//	}

	
	@GetMapping(path = "/CashflowAddress")
	public Map<String, Object> useIdfindAddress(Model m) {
		Map<String, Object> data = new HashMap<>();
		Member mem = memberService.findByMemberId((Long) session.getAttribute("userID"));
		data.put("session", session.getAttribute("userID"));
		data.put("userName", session.getAttribute("userName"));
		data.put("memberId", mem.getMemberId());
		data.put("memberMail", mem.getMemberMail());
		data.put("memberName", mem.getMemberName());
		data.put("memberAddress", mem.getMemberAddress());
		data.put("title", cashflowAddressService.findAll());

		session.setAttribute("data", data);
		return data;
	}



}

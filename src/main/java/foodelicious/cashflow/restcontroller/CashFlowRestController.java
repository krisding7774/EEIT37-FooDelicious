package foodelicious.cashflow.restcontroller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;


import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import foodelicious.cart.model.CartBean;
import foodelicious.cart.service.CartService;

import foodelicious.cashflow.service.CashflowAddressService;

import foodelicious.mail.service.MailService;
import foodelicious.member.model.Member;
import foodelicious.member.service.MemberService;
import foodelicious.orders.model.OrdersBean;
import foodelicious.orders.service.OrdersDetailService;
import foodelicious.orders.service.OrdersService;
import foodelicious.product.model.Product;

@RestController
@Transactional
public class CashFlowRestController {

	private HttpSession session;
	private CartService cartService;
	private MailService mailService;
	private OrdersService ordersService;
	private MemberService memberService;
	private OrdersDetailService ordersDetailService;
	private CashflowAddressService cashflowAddressService;
//	public static AllInOne all;
//	
//	public static void main(String[] args) {
//		initial();
//	}
//	private static void initial(){
//		all = new AllInOne("");
//	}
	
	public CashFlowRestController(HttpSession session, CartService cartService,
			MailService mailService, OrdersService ordersService, OrdersDetailService ordersDetailService,
			MemberService memberService, CashflowAddressService cashflowAddressService) {
		super();

		this.session = session;
		this.cartService = cartService;
		this.mailService = mailService;
		this.ordersService = ordersService;
		this.memberService = memberService;
		this.cashflowAddressService = cashflowAddressService;
		this.ordersDetailService = ordersDetailService;
	
	}

	@ResponseBody
	@GetMapping(path = "/shoppingCart/CashflowList2")
	public List<HashMap<Object, Object>> CashFlowTable(Model m, Long productId, Long memberId) {
		List<HashMap<Object, Object>> tables = new ArrayList<HashMap<Object, Object>>();
		List<CartBean> carts = cartService.selectItem((Long) session.getAttribute("userID"));
		List<OrdersBean> orders = ordersService.selectOrders((Long) session.getAttribute("userID"));

		for (CartBean cart : carts) {
			Product product = null;
			if (productId == cart.getProductId()) {
				product = cart.getProduct();
			}
			for (OrdersBean order : orders) {
				HashMap<Object, Object> table = new HashMap<Object, Object>();
				table.put("memberId", cart.getMemberId());
				table.put("memberName", cart.getMember().getMemberName());
				table.put("memberPhone", cart.getMember().getMemberPhone());
				table.put("memberMail", cart.getMember().getMemberMail());
				table.put("memberAddress", cart.getMember().getMemberAddress());
				table.put("productId", cart.getProductId());
				table.put("productName", cart.getProduct().getProductName());
				table.put("quantity", cart.getQuantity());
				table.put("productprice", cart.getProduct().getProductPrice());
				table.put("orderId", order.getOrdersId());
				table.put("orderTotal", order.getOrdersTotal());
				tables.add(table);
			}

		}
		return tables;
	}

	@PostMapping("/address.send")
	public void sendmail() {
		Member member = memberService.findByMemberId((Long) session.getAttribute("userID"));
		
		Date date = new Date();
		Timestamp timeStamp = new Timestamp(date.getTime());
		String memberName = member.getMemberName();

		String memberMail = member.getMemberMail(); 
		String memberPhone = member.getMemberPhone();
		String memberAddress = member.getMemberAddress();
	

		String url = "http://localhost:8080/memberOrders";

		SimpleDateFormat dateFormatAll = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		mailService.prepareAndSend(memberMail, "[FooDelicious]\t" + dateFormatAll.format(timeStamp) + "\t已收到您的訂單",
				"親愛的" + memberName + "先生/小姐，感謝您的訂單！\n以下是您的訂單資訊：\n收件人姓名：" + memberName + "\n收件人電話："
						+ memberPhone + "\n寄貨地址：" + memberAddress 
						+ "前往查看訂單詳細資訊：" + url);
		
	}

	@PostMapping("/address.insert")
	public void postAddress(@RequestBody Map<String, String> params) {
//		System.out.println("======================================================");
//		System.out.println(params.get("commonaddress"));
//		Long id = (Long) session.getAttribute("userID");
//		System.out.println(id);
		cashflowAddressService.pushAddress(params);
	}

//	@PostMapping("/Ecpay")
//	public EcPayBean  aioCheckOutALL(HttpServletRequest request) {
//		AioCheckOutALL aio = new AioCheckOutALL();
////		AllInOne aioOne = new AllInOne("");
//		EcPayBean ecpay = new EcPayBean();
//		
//		aio.setMerchantID("2000132");
//		aio.setMerchantTradeNo("foodelicious0001");
//		aio.setMerchantTradeDate("2022/01/27");
//		aio.setTotalAmount("1000");
//		aio.setTradeDesc("test shopping");
//		aio.setItemName("Product");
//		aio.setReturnURL("http://localhost:8080");
//		aio.setNeedExtraPaidInfo("N");
//		ecpay.setHi(all.aioCheckOut(aio, null));
////		String form = all.aioCheckOut(aio, null);
//		return ecpay;
//		
//		aio.setOrderResultURL("http://localhost:8080/Order/order/EcpayOrder");
//		AioCheckOutOneTime obj = new AioCheckOutOneTime();
////		obj.setMerchantTradeNo(orders.getUuid());
//		Date date = new Date();
//		SimpleDateFormat dt1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//		System.out.println(dt1.format(date));
//		
//		InvoiceObj invoiceObj = new InvoiceObj();
//	invoiceObj.setCustomerName(String.valueOf(session.getAttribute("memberName")));
//	invoiceObj.setCustomerPhone(String.valueOf(session.getAttribute("memberPhone")));
//	invoiceObj.setCustomerEmail(String.valueOf(session.getAttribute("memberEmail")));
//	String form = aioOne.aioCheckOut(obj, invoiceObj);
////	String form = aioOne.aioCheckOut(obj, null);
//	return form;
//	}

//	// 發送請求給綠界
//	@PostMapping(value = "/toPayECpay", consumes = MediaType.APPLICATION_JSON_VALUE)
//	@ResponseBody
//	public EcPayBean aioCheckOutALL(HttpServletRequest request) {
//		AioCheckOutALL aio = new AioCheckOutALL();
//		AllInOne aioOne = new AllInOne("");
//		EcPayBean ecpay = new EcPayBean();
//		Member m = memberService.findByMemberId((Long) session.getAttribute("userID"));
//		OrdersBean orderBean = cashflowordersService.selectOrdersId((Long) session.getAttribute("ordersId"));
//		aio.setMerchantID("2000132");
//		aio.setMerchantTradeNo("FoodeliciousYY" + String.valueOf(orderBean.getOrdersId()));
//		aio.setMerchantTradeDate(
//				String.valueOf(orderBean.getOrdersDate()).substring(0, 19).replace("T", " ").replace("-", "/"));
//		aio.setTotalAmount(String.valueOf(orderBean.getOrdersTotal().intValue()));
//		aio.setTradeDesc("test shopping");
//		aio.setItemName(orderBean.getOrdersName());
//		aio.setReturnURL("http://localhost:8080/Order/returnURL");
//		aio.setOrderResultURL("http://localhost:8080/order/EcpayOrder");
//		ecpay.setHi(aioOne.aioCheckOut(aio, null));
//		return ecpay;
//	}

//	// 0709給綠界的
//	@PostMapping("order/EcpayOrder")
//	public String getEcpayOrder(Model model, @RequestParam("RtnCode") int RtnCode,
//			@RequestParam("MerchantTradeNo") String MerchantTradeNo, HttpServletResponse response,
//			HttpServletRequest request) {
//		Member member = memberService.findByMemberId((Long) session.getAttribute("userID"));
//		Member memberCookie = null;
//		String userid = null;
//		Cookie[] cookieList = request.getCookies();
//
//		if (cookieList != null) {
//			for (Cookie cookie : cookieList) {
//				if (cookie.getName().equals("userId")) {
//					userid = cookie.getValue();
//				}
//			}
//		}
//		if (userid != null) {
//			 
//			memberCookie = memberService.findByMemberId((Long) session.getAttribute("userID"));
//		}
//		if (memberCookie != null) {
//			System.out.println("08是餅乾啦耖");
//			List<OrdersBean> order = CashflowOrdersService.findOrderByMember(member);
//			model.addAttribute("id", memberCookie);
//			model.addAttribute("orderSet", order);
//		} else if (member != null) {
//			System.out.println("08是Session啦");
//			List<OrdersBean> order = CashflowOrdersService.findOrderByMember(member);
//			model.addAttribute("id", member);
//			model.addAttribute("orderSet", order);
//		} else {
//			System.out.println("08是死人啦");
//			member = memberService.findByMemberId((Long) session.getAttribute("userID"));
//			List<OrdersBean> order = OrdersService.findOrderByMemberBean(member);
//			model.addAttribute("id", member);
//			model.addAttribute("orderSet", order);
//		}
//		if (RtnCode == 1) {
//			System.out.println("^_^凸，抓到你囉字串" + MerchantTradeNo);
//			String mno = MerchantTradeNo.replace("NeverStarveYY", "");
//			int ino = Integer.valueOf(mno);
//			OrdersBean findorder = OrdersService.findByPkOrderId(ino).get();
//			findorder.setTrading(1);
//			System.out.println("抓" + findorder);
//			OrdersBean.setOrdersId(OrdersBean.getOrdersId());
//			OrdersBean.update(findorder);
//
//		}
//
//		return "order/OrderMember";
//	}
//
//	@GetMapping("list/{id}")
//	public String getliString(@PathVariable int id, Model model) {
//		Optional<OrdersBean> order = CashflowOrdersService.selectOrdersId((Long) session.getAttribute("userID"));
//		OrdersBean o = order.get();
//		Set<OrdersDetailBean> list = o.getOrderDetail();
//		model.addAttribute("orderList", list);
//		return "order/OrderList";
//
//	}

}

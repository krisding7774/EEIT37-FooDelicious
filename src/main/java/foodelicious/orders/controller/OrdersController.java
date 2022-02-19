package foodelicious.orders.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import foodelicious.cart.model.CartBean;
import foodelicious.cart.service.CartService;
import foodelicious.mail.service.MailService;
import foodelicious.member.model.Member;
import foodelicious.member.service.MemberService;
import foodelicious.orders.model.OrdersBean;
import foodelicious.orders.model.OrdersDetailBean;
import foodelicious.orders.service.OrdersDetailService;
import foodelicious.orders.service.OrdersService;

@Controller
public class OrdersController {

	private HttpSession session;

	private CartService cartService;

	private MailService mailService;

	private OrdersService ordersService;

//	private SearchService searchService;

	private MemberService memberService;

	private OrdersDetailService ordersDetailService;

	public OrdersController(HttpSession session, CartService cartService, MailService mailService,
			OrdersService ordersService, MemberService memberService, OrdersDetailService ordersDetailService) {
		super();
		this.session = session;
		this.cartService = cartService;
		this.mailService = mailService;
		this.ordersService = ordersService;
		this.memberService = memberService;
		this.ordersDetailService = ordersDetailService;
	}

	@ResponseBody
	@PostMapping("/orders/insert")
	public void orders(@RequestBody OrdersBean orders) {

		List<CartBean> carts = cartService.selectItem((Long) session.getAttribute("userID"));

//		List<Product> products = searchService.findAll();

		OrdersBean ordersBean = new OrdersBean();

		Date date = new Date();

		Timestamp timeStamp = new Timestamp(date.getTime());

		ordersBean.setMemberId((Long) session.getAttribute("userID"));
		ordersBean.setOrderDate(timeStamp);
		ordersBean.setOrdersName(orders.getOrdersName());
		ordersBean.setOrdersPhone(orders.getOrdersPhone());
		ordersBean.setOrdersAddress(orders.getOrdersAddress());
		ordersBean.setOrdersState("訂單處理中");
		ordersBean.setOrdersTotal((Integer) session.getAttribute("priceTotal"));

		ordersService.insertOrders(ordersBean);

		for (CartBean cart : carts) {
			OrdersDetailBean ordersDetailBean = new OrdersDetailBean();
			ordersDetailBean.setOrdersId(ordersBean.getOrdersId());
			ordersDetailBean.setProduct_id(cart.getProductId());
			ordersDetailBean.setQuantity(cart.getQuantity());
			ordersDetailService.insertOrderDetail(ordersDetailBean);

//			==========very slow after use==========
//			for (Product product : products) {
//				if (cart.getProductId() == product.getProductId()) {
//					product.setProductId(cart.getProductId());
//					product.setProductCategories(product.getProductCategories());
//					product.setProductCategories_name(product.getProductCategories_name());
//					product.setProductName(product.getProductName());
//					product.setProductCompany(product.getProductCompany());
//					product.setProductPrice(product.getProductPrice());
//					product.setProductPics(product.getProductPics());
//					product.setProductContent(product.getProductContent());
//					product.setProductStock(product.getProductStock() - cart.getQuantity());
//					product.setProductStatus(product.getProductStatus());
//					product.setProductKeywords(product.getProductKeywords());
//					product.setProductInsertDate(product.getProductInsertDate());
//					product.setProductSalesFigures(product.getProductSalesFigures() + cart.getQuantity());
//					product.setProductCompanyId(product.getProductCompanyId());
//					searchService.save(product);
//				}
//			}
			cartService.deleteItem(cart.getCartId());
			session.removeAttribute("discountContent");
		}

		Member member = memberService.findByMemberId((Long) session.getAttribute("userID"));

		String memberName = member.getMemberName();

		String memberMail = member.getMemberMail();

		String url = "http://localhost:8080/memberOrders";

		SimpleDateFormat dateFormatAll = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		mailService.prepareAndSend(memberMail, "[FooDelicious]\t" + dateFormatAll.format(timeStamp) + "\t已收到您的訂單",
				"親愛的" + memberName + "先生/小姐，感謝您的訂單！\n以下是您的訂單資訊：\n收件人姓名：" + ordersBean.getOrdersName() + "\n收件人電話："
						+ ordersBean.getOrdersPhone() + "\n寄貨地址：" + orders.getOrdersAddress() + "\n訂單金額：NT$:"
						+ ordersBean.getOrdersTotal() + "元\n前往查看訂單詳細資訊：" + url);

	}

	@ResponseBody
	@GetMapping("/viewOrders")
	public List<OrdersBean> viewOrders() {
		return ordersService.selectOrders((Long) session.getAttribute("userID"));
	}

	@ResponseBody
	@GetMapping("/viewOrders/pages/{orderStatus}")
	public List<OrdersBean> findByStatus(@PathVariable String orderStatus) {
		return ordersService.selectIdAndStatus((Long) session.getAttribute("userID"), orderStatus);
	}

	@ResponseBody
	@GetMapping("/toOrderDetailPage/{ordersId}")
	public List<OrdersDetailBean> toOrdersDetailPage(@PathVariable Long ordersId) {
		List<OrdersDetailBean> details = ordersDetailService.selectOrdersDetail(ordersId);

		return details;
	}

	@GetMapping("/ordersEnd")
	public String ordersEnd() {
		return "app.OrdersEnd";
	}

	@GetMapping("/memberOrders")
	public String memberOrders() {
		return "app.ViewOrders";
	}

}

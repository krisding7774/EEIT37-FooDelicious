package foodelicious.orders.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import foodelicious.cart.model.CartBean;
import foodelicious.cart.service.CartService;
import foodelicious.cart.service.SearchService;
import foodelicious.orders.model.OrdersBean;
import foodelicious.orders.model.OrdersDetailBean;
import foodelicious.orders.service.OrdersDetailService;
import foodelicious.orders.service.OrdersService;
import foodelicious.product.model.Product;

@Controller
public class OrdersController {

	@Autowired
	private HttpSession session;

	@Autowired
	private CartService cartService;

	@Autowired
	private OrdersService ordersService;

	@Autowired
	private SearchService searchService;

	@Autowired
	private OrdersDetailService ordersDetailService;

	@ResponseBody
	@PostMapping("/orders/insert")
	public void orders(@RequestBody OrdersBean orders) {
		Long userId = (Long) session.getAttribute("userID");

		List<CartBean> carts = cartService.selectItem(userId);
		List<Product> products = searchService.findAll();

		Timestamp timeStamp = new Timestamp(new Date().getTime());

		OrdersBean ordersBean = new OrdersBean();
		ordersBean.setMemberId(userId);
		ordersBean.setOrderDate(timeStamp);
		ordersBean.setOrdersName(orders.getOrdersName());
		ordersBean.setOrdersPhone(orders.getOrdersPhone());
		ordersBean.setOrdersAddress(orders.getOrdersAddress());
		ordersBean.setOrdersState("訂單處理中");
		ordersBean.setOrdersTotal((Integer) session.getAttribute("priceTotal"));
		ordersService.insertOrders(ordersBean);

		for (CartBean cart : carts) {
			ordersDetailService.insertOrderDetail(
					new OrdersDetailBean(ordersBean.getOrdersId(), cart.getProductId(), cart.getQuantity()));
			for (Product product : products) {
				if (cart.getProductId() == product.getProductId()) {
					searchService.updateStock(product.getProductStock() - cart.getQuantity(), product.getProductId());
				}
			}
			cartService.deleteItem(cart.getCartId());
			session.removeAttribute("discountContent");
		}
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
		return ordersDetailService.selectOrdersDetail(ordersId);
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

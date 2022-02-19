package foodelicious.orders.service;

import java.util.List;

import foodelicious.orders.model.OrdersDetailBean;

public interface OrdersDetailService {

	OrdersDetailBean insertOrderDetail(OrdersDetailBean ordersDetailBean);

	List<OrdersDetailBean> selectOrdersDetail(Long ordersId);

}

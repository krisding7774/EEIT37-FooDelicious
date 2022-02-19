package foodelicious.orders.service;

import java.util.List;

import foodelicious.orders.model.OrdersBean;

public interface OrdersService {

	OrdersBean insertOrders(OrdersBean ordersBean);

	OrdersBean updateOrders(OrdersBean ordersBean);

	OrdersBean selectOrdersId(Long ordersId);

	List<OrdersBean> selectOrders(Long memberId);

	List<OrdersBean> selectAll();

	List<OrdersBean> selectIdAndStatus(Long ordersId, String ordersState);

}

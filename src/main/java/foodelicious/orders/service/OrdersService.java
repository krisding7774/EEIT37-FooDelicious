package foodelicious.orders.service;

import java.util.List;

import foodelicious.orders.model.OrdersBean;

public interface OrdersService {

	List<OrdersBean> selectIdAndStatus(Long ordersId, String ordersState);

	OrdersBean updateOrders(OrdersBean ordersBean);

	OrdersBean insertOrders(OrdersBean ordersBean);

	List<OrdersBean> selectOrders(Long memberId);

	OrdersBean selectOrdersId(Long ordersId);

	List<OrdersBean> selectAll();

}

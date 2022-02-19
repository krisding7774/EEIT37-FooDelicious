package foodelicious.compbackend.model;

import java.util.List;

import foodelicious.orders.model.OrdersBean;
import foodelicious.orders.model.OrdersDetailBean;

public interface CBKOrderDaoInterface {
	

	public List<OrdersDetailBean> findAllOrderByASC();



}

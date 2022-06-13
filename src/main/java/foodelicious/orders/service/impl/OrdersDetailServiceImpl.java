package foodelicious.orders.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import foodelicious.orders.model.OrdersDetailBean;
import foodelicious.orders.repository.OrdersDetailRepository;
import foodelicious.orders.service.OrdersDetailService;

@Service
public class OrdersDetailServiceImpl implements OrdersDetailService {

	@Autowired
	OrdersDetailRepository ordersDetailRepository;

	@Override
	public OrdersDetailBean insertOrderDetail(OrdersDetailBean ordersDetailBean) {
		return ordersDetailRepository.save(ordersDetailBean);
	}

	@Override
	public List<OrdersDetailBean> selectOrdersDetail(Long ordersId) {
		return ordersDetailRepository.findAllByOrdersId(ordersId);
	}

}

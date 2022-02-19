package foodelicious.orders.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import foodelicious.orders.model.OrdersBean;
import foodelicious.orders.repository.OrdersRepository;
import foodelicious.orders.service.OrdersService;

@Service
public class OrdersServiceImpl implements OrdersService {

	private OrdersRepository ordersRepository;

	public OrdersServiceImpl(OrdersRepository ordersRepository) {
		super();
		this.ordersRepository = ordersRepository;
	}

	@Override
	public OrdersBean insertOrders(OrdersBean ordersBean) {
		return ordersRepository.saveAndFlush(ordersBean);
	}

	@Override
	public OrdersBean updateOrders(OrdersBean ordersBean) {
		return ordersRepository.save(ordersBean);
	}

	@Override
	public OrdersBean selectOrdersId(Long ordersId) {
		return ordersRepository.findByOrdersId(ordersId);
	}

	@Override
	public List<OrdersBean> selectOrders(Long memberId) {
		return ordersRepository.findAllByMemberId(memberId);
	}

	@Override
	public List<OrdersBean> selectAll() {
		return ordersRepository.findAll();
	}

	@Override
	public List<OrdersBean> selectIdAndStatus(Long memberId, String ordersState) {
		return ordersRepository.findAllByMemberIdAndOrdersState(memberId, ordersState);
	}

}

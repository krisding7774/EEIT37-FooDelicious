package foodelicious.compbackend.model;


import java.util.List;

import org.springframework.stereotype.Repository;

import foodelicious.compbackend.repository.CBKOrderRepository;
import foodelicious.orders.model.OrdersDetailBean;

@Repository
public class CBKOrderDao implements CBKOrderDaoInterface {
	
	private final CBKOrderRepository cbkOrderRepository;
	
	

	public CBKOrderDao(final CBKOrderRepository cbkOrderRepository) {
		this.cbkOrderRepository = cbkOrderRepository;
	}


	@Override
	public List<OrdersDetailBean> findAllOrderByASC() {
		List<OrdersDetailBean> allOrderDetails = cbkOrderRepository.findAllOrderByASC();
		return allOrderDetails;
	}



	

}

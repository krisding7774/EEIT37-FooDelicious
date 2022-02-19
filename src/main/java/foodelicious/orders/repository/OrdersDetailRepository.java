package foodelicious.orders.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import foodelicious.orders.model.OrdersDetailBean;

public interface OrdersDetailRepository extends JpaRepository<OrdersDetailBean, Long> {

	List<OrdersDetailBean> findAllByOrdersId(Long ordersId);

}

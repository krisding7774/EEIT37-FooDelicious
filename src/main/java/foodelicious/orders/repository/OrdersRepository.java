package foodelicious.orders.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import foodelicious.orders.model.OrdersBean;

@Repository
public interface OrdersRepository extends JpaRepository<OrdersBean, Long> {

	OrdersBean findByOrdersId(Long ordersId);

	@Query(value = "SELECT * FROM orders WHERE member_id = ? ORDER BY orders_id DESC", nativeQuery = true)
	List<OrdersBean> findAllByMemberId(Long memberId);

	@Query(value = "SELECT * FROM orders WHERE member_id = ? AND orders_state = ? ORDER BY orders_id DESC", nativeQuery = true)
	List<OrdersBean> findAllByMemberIdAndOrdersState(Long memberId, String state);

}

package foodelicious.backend.orderPage.repository;

import foodelicious.backend.orderPage.model.BkOrderDetail;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BkOrderDetailRepository extends CrudRepository<BkOrderDetail, Long> {

    @Query(value = "SELECT * FROM orders_detail WHERE orders_id = ?",nativeQuery = true)
    public List<BkOrderDetail> findByOrderId(Long orderId);


}

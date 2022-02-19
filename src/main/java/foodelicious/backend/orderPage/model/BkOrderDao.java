package foodelicious.backend.orderPage.model;

import java.util.List;

public interface BkOrderDao {

    public List<BkOrder> findAllOrder();

    public BkOrder findById(Long orderId);

    public String update(Long orderId, BkOrder bkOrder);

    public List<BkOrder> findByStatus(String orderStatus);

    public List<BkOrder> findByStatusHandling(String orderStatus, String orderStatus2, String orderStatus3);

    public List<BkOrderDetail> findByOrderId(Long orderId);
}

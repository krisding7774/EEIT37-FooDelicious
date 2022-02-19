package foodelicious.backend.orderPage.service;

import foodelicious.backend.orderPage.model.BkOrder;
import foodelicious.backend.orderPage.model.BkOrderDao;
import foodelicious.backend.orderPage.model.BkOrderDetail;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BkOrderServiceImpl implements BkOrderService{

    private BkOrderDao bkOrderDao;

    public BkOrderServiceImpl(BkOrderDao bkOrderDao) {
        this.bkOrderDao = bkOrderDao;
    }

    @Override
    public List<BkOrder> findAllOrder() {
        return bkOrderDao.findAllOrder();
    }

    @Override
    public BkOrder findById(Long orderId) {
        return bkOrderDao.findById(orderId);
    }

    @Override
    public String update(Long orderId, BkOrder bkOrder) {
        return bkOrderDao.update(orderId, bkOrder);
    }

    @Override
    public List<BkOrder> findByStatus(String orderStatus) {
        return bkOrderDao.findByStatus(orderStatus);
    }

    @Override
    public List<BkOrder> findByStatusHandling(String orderStatus, String orderStatus2, String orderStatus3) {
        return bkOrderDao.findByStatusHandling(orderStatus, orderStatus2, orderStatus3);
    }

    @Override
    public List<BkOrderDetail> findByOrderId(Long orderId) {
        return bkOrderDao.findByOrderId(orderId);
    }
}

package foodelicious.backend.orderPage.controller;

import foodelicious.backend.orderPage.model.BkOrder;
import foodelicious.backend.orderPage.model.BkOrderDetail;
import foodelicious.backend.orderPage.service.BkOrderService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class BkOrderController {

    private BkOrderService bkOrderService;

    public BkOrderController(BkOrderService bkOrderService) {
        this.bkOrderService = bkOrderService;
    }

    @GetMapping("/bkorders")
    public List<BkOrder> findAllOrder(){
        return bkOrderService.findAllOrder();
    };

    @GetMapping("/bkorders/{orderId}")
    public BkOrder findById(@PathVariable Long orderId) {
        return bkOrderService.findById(orderId);
    }

    @PutMapping("/bkorders/update/{orderId}")
    public String update(@PathVariable Long orderId,
                         @RequestBody BkOrder bkOrder){
        return bkOrderService.update(orderId, bkOrder);
    }

    @GetMapping("/bkorders/pages/{orderStatus}")
    public List<BkOrder> findByStatus(@PathVariable String orderStatus) {
        return bkOrderService.findByStatus(orderStatus);
    }

    @GetMapping("/bkorders/pages/{orderStatus}/{orderStatus2}/{orderStatus3}")
    public List<BkOrder> findByStatusHandling(@PathVariable String orderStatus,
                                              @PathVariable String orderStatus2,
                                              @PathVariable String orderStatus3){
        return bkOrderService.findByStatusHandling(orderStatus, orderStatus2, orderStatus3);
    }

    @GetMapping("/bkordersDetail/{orderId}")
    public List<BkOrderDetail> findByOrderId(@PathVariable Long orderId){
        return bkOrderService.findByOrderId(orderId);
    }
}

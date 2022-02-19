package foodelicious.backend.orderPage.model;

import foodelicious.backend.productPage.model.BkProduct;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "orders_detail")
public class BkOrderDetail implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "orders_detail_id")
    private Long orderDetailId;

    @Column(name = "orders_id")
    private Long orderId;

    @Column(name = "product_id")
    private Integer productId;

    @Column(name = "quantity")
    private Integer quantity;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id",insertable = false, updatable = false)
    private BkProduct bkProduct;

    public Long getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(Long orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public BkProduct getBkProduct() {
        return bkProduct;
    }

    public void setBkProduct(BkProduct bkProduct) {
        this.bkProduct = bkProduct;
    }
}

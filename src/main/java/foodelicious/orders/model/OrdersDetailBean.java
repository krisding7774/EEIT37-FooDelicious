package foodelicious.orders.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import foodelicious.product.model.Product;

@Entity
@Table(name = "orders_detail")
@Component
public class OrdersDetailBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "orders_Detail_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long ordersDetailId;

	@Column(name = "orders_id")
	private Long ordersId;

	@Column(name = "product_id")
	private Long product_id;

	@Column(name = "quantity")
	private Integer quantity;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "orders_id", insertable = false, updatable = false)
	private OrdersBean ordersBean;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id", insertable = false, updatable = false)
	private Product product;

	public OrdersDetailBean() {
		super();
	}

	public OrdersDetailBean(Long ordersDetailId, Long ordersId, Long product_id, Integer quantity,
			OrdersBean ordersBean, Product product) {
		super();
		this.ordersDetailId = ordersDetailId;
		this.ordersId = ordersId;
		this.product_id = product_id;
		this.quantity = quantity;
		this.ordersBean = ordersBean;
		this.product = product;
	}

	public Long getOrdersDetailId() {
		return ordersDetailId;
	}

	public void setOrdersDetailId(Long ordersDetailId) {
		this.ordersDetailId = ordersDetailId;
	}

	public Long getOrdersId() {
		return ordersId;
	}

	public void setOrdersId(Long ordersId) {
		this.ordersId = ordersId;
	}

	public Long getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Long product_id) {
		this.product_id = product_id;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public OrdersBean getOrdersBean() {
		return ordersBean;
	}

	public void setOrdersBean(OrdersBean ordersBean) {
		this.ordersBean = ordersBean;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}

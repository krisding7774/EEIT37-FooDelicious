package foodelicious.orders.model;

import java.io.Serializable;
import java.sql.Timestamp;

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

import com.fasterxml.jackson.annotation.JsonFormat;

import foodelicious.member.model.Member;

@Entity
@Table(name = "orders")
@Component
public class OrdersBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orders_id")
	private Long ordersId;

	@Column(name = "member_id")
	private Long memberId;

	@Column(name = "orders_date")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	private Timestamp ordersDate;

	@Column(name = "orders_name")
	private String ordersName;

	@Column(name = "orders_phone")
	private String ordersPhone;

	@Column(name = "orders_address")
	private String ordersAddress;

	@Column(name = "orders_state")
	private String ordersState;

	@Column(name = "orders_total")
	private Integer ordersTotal;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "member_id", insertable = false, updatable = false)
	private Member member;

	public Long getOrdersId() {
		return ordersId;
	}

	public void setOrdersId(Long ordersId) {
		this.ordersId = ordersId;
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public java.sql.Timestamp getOrdersDate() {
		return ordersDate;
	}

	public void setOrderDate(Timestamp ordersDate) {
		this.ordersDate = ordersDate;
	}

	public String getOrdersName() {
		return ordersName;
	}

	public void setOrdersName(String ordersName) {
		this.ordersName = ordersName;
	}

	public String getOrdersPhone() {
		return ordersPhone;
	}

	public void setOrdersPhone(String ordersPhone) {
		this.ordersPhone = ordersPhone;
	}

	public String getOrdersAddress() {
		return ordersAddress;
	}

	public void setOrdersAddress(String ordersAddress) {
		this.ordersAddress = ordersAddress;
	}

	public String getOrdersState() {
		return ordersState;
	}

	public void setOrdersState(String ordersState) {
		this.ordersState = ordersState;
	}

	public Integer getOrdersTotal() {
		return ordersTotal;
	}

	public void setOrdersTotal(Integer ordersTotal) {
		this.ordersTotal = ordersTotal;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

}

package foodelicious.backend.orderPage.model;

import foodelicious.backend.memberpage.model.BkMember;
import foodelicious.member.model.Member;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "orders")
public class BkOrder implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "orders_id")
    private Long ordersId;

    @Column(name = "member_id")
    private Long memberId;

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

    @Column(name = "orders_date")
    private Date ordersDate;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "member_id",insertable = false, updatable = false)
    private BkMember bkMember;

    public BkMember getBkMember() {
        return bkMember;
    }

    public void setBkMember(BkMember bkMember) {
        this.bkMember = bkMember;
    }

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

    public Date getOrdersDate() {
        return ordersDate;
    }

    public void setOrdersDate(Date ordersDate) {
        this.ordersDate = ordersDate;
    }
}

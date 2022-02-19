package foodelicious.backend.memberpage.model;



import foodelicious.article.model.ShareArea;
import foodelicious.backend.orderPage.model.BkOrder;
import foodelicious.cashflow.model.CashflowAddressBean;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "member_data2")
public class BkMember implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "member_id")
    private Long memberId;

    @Column(name = "member_mail")
    private String memberMail;

    @Column(name = "pwd")
    private String pwd;

    @Column(name = "member_status")
    private String memberStatus;

    @Column(name = "member_name")
    private String memberName;

    @Column(name = "member_gender")
    private String memberGender;

    @Column(name = "member_birth")
    private String memberBirth;

    @Column(name = "member_phone")
    private String memberPhone;

    @Column(name = "member_address")
    private String memberAddress;

    @Column(name = "member_discount_id")
    private String discount;

    @Column(name = "member_coin")	
    private Integer memberCoin;

    @Column(name = "register_date")
    private Date registerDate;

    public Long getMemberId() {
        return memberId;
    }

    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }

    public String getMemberMail() {
        return memberMail;
    }

    public void setMemberMail(String memberMail) {
        this.memberMail = memberMail;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getMemberStatus() {
        return memberStatus;
    }

    public void setMemberStatus(String memberStatus) {
        this.memberStatus = memberStatus;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getMemberGender() {
        return memberGender;
    }

    public void setMemberGender(String memberGender) {
        this.memberGender = memberGender;
    }

    public String getMemberBirth() {
        return memberBirth;
    }

    public void setMemberBirth(String memberBirth) {
        this.memberBirth = memberBirth;
    }

    public String getMemberPhone() {
        return memberPhone;
    }

    public void setMemberPhone(String memberPhone) {
        this.memberPhone = memberPhone;
    }

    public String getMemberAddress() {
        return memberAddress;
    }

    public void setMemberAddress(String memberAddress) {
        this.memberAddress = memberAddress;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public Integer getMemberCoin() {
        return memberCoin;
    }

    public void setMemberCoin(Integer memberCoin) {
        this.memberCoin = memberCoin;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }
}

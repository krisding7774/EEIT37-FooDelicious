package foodelicious.cashflow.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import foodelicious.member.model.Member;

@Entity
@Table(name = "cashflow_address")
public class CashflowAddressBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	//member_id

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "address_id")
	private Long addressId;

	@Column(name="member_id")
	private Long memberId;
		
	//member 原住址
	@Column(name = "member_address")
	private String memberAddress;
		
	//member 新增的常用住址
	@Column(name = "common_address")
	private String commonAddress;
	
	@Transient
	@Column(name = "fk_member_id",insertable = false, updatable = false)
	private Long fkmemberid;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_member_id")
	private Member member;
	
	
	public CashflowAddressBean(Long memberId,Long addressId, String memberAddress, String commonAddress,
			Long fkmemberid,Member member) {
		super();
		this.memberId = memberId;
		this.addressId = addressId;
		this.memberAddress = memberAddress;
		this.commonAddress = commonAddress;
		this.fkmemberid = fkmemberid;
		this.member = member;
	}

	public CashflowAddressBean() {		
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public Long getAddressId() {
		return addressId;
	}

	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getCommonAddress() {
		return commonAddress;
	}

	public void setCommonAddress(String commonAddress) {
		this.commonAddress = commonAddress;
	}

	public Long getFk_member_id() {
		return fkmemberid;
	}

	public void setFk_member_id(Long fk_member_id) {
		this.fkmemberid = fk_member_id;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	

//	@Override
//	public String toString() {
//		return "CashflowAddressBean [addressId=" + addressId + ", memberAddress=" + memberAddress + ",commonAddress=" 
//				+ commonAddress + ", fkmemberid=" + fkmemberid + ", member=" + member + "]";
//	}
	
	
}

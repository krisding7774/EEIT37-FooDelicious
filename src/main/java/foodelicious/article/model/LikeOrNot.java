package foodelicious.article.model;

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
import javax.persistence.Transient;

import foodelicious.member.model.Member;

@Entity
@Table(name = "likeOrNot")
public class LikeOrNot implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Transient
	@Column(name = "fk_memberID")	
	private Long fk_memberID;
	
	@Transient
	@Column(name = "fk_articleID")	
	private Integer fk_articleID;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_memberID")
	private Member member;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_articleID", referencedColumnName = "share_id")
	private ShareArea shareArea;
	
	public LikeOrNot() {
	}

	public LikeOrNot(Long fk_memberID, Integer fk_articleID, Member member, ShareArea shareArea) {
		super();
		this.fk_memberID = fk_memberID;
		this.fk_articleID = fk_articleID;
		this.member = member;
		this.shareArea = shareArea;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getFk_memberID() {
		return fk_memberID;
	}

	public void setFk_memberID(Long fk_memberID) {
		this.fk_memberID = fk_memberID;
	}

	public Integer getFk_articleID() {
		return fk_articleID;
	}

	public void setFk_articleID(Integer fk_articleID) {
		this.fk_articleID = fk_articleID;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public ShareArea getShareArea() {
		return shareArea;
	}

	public void setShareArea(ShareArea shareArea) {
		this.shareArea = shareArea;
	}

}

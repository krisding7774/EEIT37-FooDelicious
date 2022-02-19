package foodelicious.article.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import foodelicious.member.model.Member;

@Entity
@Table(name = "msgArea")
public class MsgArea implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	// 先處理1對多 多對1關係
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_article_id")
	private ArticleData articleData;

	@Transient
	@Column(name = "fk_article_id")
	private int fk_article_id;

	// 先處理1對多 多對1關係
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_member_id")
	private Member member;

	@Transient
	@Column(name = "fk_member_id")
	private Long fk_member_id;

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd EEEE HH:mm:ss")
	@Column(name = "msgPostTime")
	private Date msgPostTime;

	@Column(name = "text")
	private String text;

	@Column(name = "memberName")
	private String memberName;
	
	@PrePersist // 設定物件轉換為 Persistent 以前執行
	private void onCreate() {
		if (msgPostTime == null) {
			msgPostTime = new Date();
		}
	}

	public MsgArea() {
	}

	public ArticleData getArticleData() {
		return articleData;
	}

	public void setArticleData(ArticleData articleData) {
		this.articleData = articleData;
	}

	public int getFk_article_id() {
		return fk_article_id;
	}

	public void setFk_article_id(int fk_article_id) {
		this.fk_article_id = fk_article_id;
	}

	public Date getMsgPostTime() {
		return msgPostTime;
	}

	public void setMsgPostTime(Date msgPostTime) {
		this.msgPostTime = msgPostTime;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Long getFk_member_id() {
		return fk_member_id;
	}

	public void setFk_member_id(Long memberId) {
		this.fk_member_id = memberId;
	}

	public MsgArea(String text) {
		super();
		this.text = text;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public MsgArea(Long id, Member member, String text) {
		super();
		this.id = id;
		this.member = member;
		this.text = text;
	}

}
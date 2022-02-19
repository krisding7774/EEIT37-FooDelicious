package foodelicious.article.model;

import java.io.Serializable;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import foodelicious.member.model.Member;



//import foodelicious.member.model.Account;

@Entity
@Table(name = "share_area")
public class ShareArea implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "share_id")
	private int share_id;

	@NotBlank(message = "標題不能空白喔")
	@Size(min = 3, max = 255, message = "最少要輸入3個字喔")
	@Column(name = "article_title")
	private String article_title;
	
	// 文章分類
	@Column(name = "article_clallify")
	private String article_clallify;
	
	//觀看數
	@Column(name = "viewNum")
	private int viewNum;

	//喜歡or收藏文章數
	@Column(name = "article_likes")
	private int article_likes;

	//自動生成 別寫
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "postTime")
	private Date postTime;

	@PrePersist // 設定物件轉換為 Persistent 以前執行
	private void onCreate() {
		if(postTime == null) {
			postTime = new Date();
		}
	}
	
	@Transient
	@Column(name = "fk_account_id")	
	private Long fk_account_id;

	@OneToOne(mappedBy = "shareArea")
	private ArticleData articleData;
	
	@OneToMany(mappedBy = "shareArea", fetch = FetchType.LAZY)
	private Set<LikeOrNot> likeOrNot = new LinkedHashSet<LikeOrNot>();

	// 多對一 這邊沒有cascade連動 所以要注意

	//=========引用到舊的Account先註解===========
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_account_id")
	private Member member;

	public ShareArea() {
	}

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public String getArticle_clallify() {
		return article_clallify;
	}

	public void setArticle_clallify(String article_clallify) {
		this.article_clallify = article_clallify;
	}

	public int getViewNum() {
		return viewNum;
	}

	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
	}

	public int getArticle_likes() {
		return article_likes;
	}

	public void setArticle_likes(int article_likes) {
		this.article_likes = article_likes;
	}

	public Long getFk_account_id() {
		return fk_account_id;
	}

	public void setFk_account_id(Long fk_account_id) {
		this.fk_account_id = fk_account_id;
	}

	public ArticleData getArticleData() {
		return articleData;
	}

	public void setArticleData(ArticleData articleData) {
		this.articleData = articleData;
	}

	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public int getShare_id() {
		return share_id;
	}

	public Date getPostTime() {
		return postTime;
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

	public void setShare_id(int share_id) {
		this.share_id = share_id;
	}

	public Set<LikeOrNot> getLikeOrNot() {
		return likeOrNot;
	}

	public void setLikeOrNot(Set<LikeOrNot> likeOrNot) {
		this.likeOrNot = likeOrNot;
	}
}
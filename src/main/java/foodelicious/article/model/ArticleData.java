package foodelicious.article.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

@Entity
@Table(name = "article_data")
public class ArticleData implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "article_id")
	private int article_id;

	@Size(min = 15, message = "內容不得小於15個字唷")
	@Column(name = "article")
	private String article;

	// 目前沒用到
//	@Column(name = "tag_name")
//	private String tag_name;

	// 沒用到 但先寫
//	@Column(name = "releaseOrder")
//	private int releaseOrder;// 該討論串的發布順序 編號1為第一篇文章

	@Transient
	@Column(name = "fk_share_id")
	private int fk_share_id;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fk_share_id", referencedColumnName = "share_id")
	private ShareArea shareArea;

	// 與MsgArea是一對多關係
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "articleData", cascade = CascadeType.ALL)
	private Set<MsgArea> msgAreas = new LinkedHashSet<MsgArea>();

	public ArticleData() {
	}

	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

//	public String getTag_name() {
//		return tag_name;
//	}
//
//	public void setTag_name(String tag_name) {
//		this.tag_name = tag_name;
//	}

//	public int getReleaseOrder() {
//		return releaseOrder;
//	}
//
//	public void setReleaseOrder(int releaseOrder) {
//		this.releaseOrder = releaseOrder;
//	}

	public ShareArea getShareArea() {
		return shareArea;
	}

	public void setShareArea(ShareArea shareArea) {
		this.shareArea = shareArea;
	}

	public int getArticle_id() {
		return article_id;
	}

	public int getFk_share_id() {
		return fk_share_id;
	}

	public void setFk_share_id(int fk_share_id) {
		this.fk_share_id = fk_share_id;
	}

	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}

}
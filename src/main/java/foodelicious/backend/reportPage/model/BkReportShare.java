package foodelicious.backend.reportPage.model;

import foodelicious.backend.memberpage.model.BkMember;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "share_area")
public class BkReportShare implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "share_id")
    private Integer shareId;

    @Column(name = "article_clallify")
    private String articleClallify;

    @Column(name = "article_title")
    private String article_title;

    @Column(name = "viewNum")
    private Integer viewNum;

    @Column(name = "postTime")
    private Date postTime;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "fk_account_id",insertable = false, updatable = false)
    private BkMember bkMember;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "share_id",insertable = false, updatable = false)
    private BkReportArticle bkReportArticle;

    public BkReportArticle getBkReportArticle() {
        return bkReportArticle;
    }

    public void setBkReportArticle(BkReportArticle bkReportArticle) {
        this.bkReportArticle = bkReportArticle;
    }

    public Integer getShareId() {
        return shareId;
    }

    public void setShareId(Integer shareId) {
        this.shareId = shareId;
    }

    public String getArticleClallify() {
        return articleClallify;
    }

    public void setArticleClallify(String articleClallify) {
        this.articleClallify = articleClallify;
    }

    public String getArticle_title() {
        return article_title;
    }

    public void setArticle_title(String article_title) {
        this.article_title = article_title;
    }

    public Integer getViewNum() {
        return viewNum;
    }

    public void setViewNum(Integer viewNum) {
        this.viewNum = viewNum;
    }

    public Date getPostTime() {
        return postTime;
    }

    public void setPostTime(Date postTime) {
        this.postTime = postTime;
    }

    public BkMember getBkMember() {
        return bkMember;
    }

    public void setBkMember(BkMember bkMember) {
        this.bkMember = bkMember;
    }
}

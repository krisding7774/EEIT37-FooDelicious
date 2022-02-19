package foodelicious.backend.reportPage.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "article_data")
public class BkReportArticle implements Serializable {

    @Id
    @Column(name = "article_id")
    private Integer articleId;

    @Column(name = "article")
    private String article;

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
    }
}

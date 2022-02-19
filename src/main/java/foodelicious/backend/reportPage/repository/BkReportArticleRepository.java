package foodelicious.backend.reportPage.repository;

import foodelicious.backend.reportPage.model.BkReportShare;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BkReportArticleRepository extends CrudRepository<BkReportShare, Integer> {

    @Query(value = "SELECT TOP 5* FROM share_area WHERE article_clallify = '食譜分享' ORDER BY viewNum DESC",nativeQuery = true)
    public List<BkReportShare> topFoodArticle();

    @Query(value = "SELECT TOP 5* FROM share_area WHERE article_clallify = '廚具開箱' ORDER BY viewNum DESC",nativeQuery = true)
    public List<BkReportShare> topToolArticle();

}

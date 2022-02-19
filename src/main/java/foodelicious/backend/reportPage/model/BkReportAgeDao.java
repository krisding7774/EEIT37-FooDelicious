package foodelicious.backend.reportPage.model;

import foodelicious.backend.productPage.model.BkProduct;

import java.util.List;

public interface BkReportAgeDao {

    public List countByAge();

    public List<BkProduct> topFood();

    public List<BkProduct> topTool();

    public List<BkReportShare> topFoodArticle();

    public List<BkReportShare> topToolArticle();
}

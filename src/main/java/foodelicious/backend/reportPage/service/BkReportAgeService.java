package foodelicious.backend.reportPage.service;

import foodelicious.backend.productPage.model.BkProduct;
import foodelicious.backend.reportPage.model.BkReportShare;

import java.util.List;

public interface BkReportAgeService {

    public List countByAge();

    public List<BkProduct> topFood();

    public List<BkProduct> topTool();

    public List<BkReportShare> topFoodArticle();

    public List<BkReportShare> topToolArticle();
}

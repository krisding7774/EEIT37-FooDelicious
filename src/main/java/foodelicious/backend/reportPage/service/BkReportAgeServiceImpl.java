package foodelicious.backend.reportPage.service;

import foodelicious.backend.productPage.model.BkProduct;
import foodelicious.backend.reportPage.model.BkReportAgeDao;
import foodelicious.backend.reportPage.model.BkReportShare;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BkReportAgeServiceImpl implements BkReportAgeService{

    private BkReportAgeDao bkReportAgeDao;

    public BkReportAgeServiceImpl(BkReportAgeDao bkReportAgeDao) {
        this.bkReportAgeDao = bkReportAgeDao;
    }

    @Override
    public List countByAge() {
        return bkReportAgeDao.countByAge();
    }

    @Override
    public List<BkProduct> topFood() {
        return bkReportAgeDao.topFood();
    }

    @Override
    public List<BkProduct> topTool() {
        return bkReportAgeDao.topTool();
    }

    @Override
    public List<BkReportShare> topFoodArticle() {
        return bkReportAgeDao.topFoodArticle();
    }

    @Override
    public List<BkReportShare> topToolArticle() {
        return bkReportAgeDao.topToolArticle();
    }
}

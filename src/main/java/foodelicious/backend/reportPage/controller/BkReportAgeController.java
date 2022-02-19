package foodelicious.backend.reportPage.controller;

import foodelicious.backend.productPage.model.BkProduct;
import foodelicious.backend.reportPage.model.BkReportShare;
import foodelicious.backend.reportPage.service.BkReportAgeService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
public class BkReportAgeController {

    private BkReportAgeService bkReportAgeService;

    public BkReportAgeController(BkReportAgeService bkReportAgeService) {
        this.bkReportAgeService = bkReportAgeService;
    }

    @GetMapping("/report/age")
    public List countByAge(){
        return bkReportAgeService.countByAge();
    }

    @GetMapping("/report/product/food")
    public List<BkProduct> topFood() {
        return bkReportAgeService.topFood();
    }

    @GetMapping("/report/product/tool")
    public List<BkProduct> topTool() {
        return bkReportAgeService.topTool();
    }

    @GetMapping("/report/article/food")
    public List<BkReportShare> topFoodArticle(){

        return bkReportAgeService.topFoodArticle();

    }

    @GetMapping("/report/article/tool")
    public List<BkReportShare> topToolArticle(){

        return bkReportAgeService.topToolArticle();

    }
}

package foodelicious.backend.reportPage.model;

import foodelicious.backend.productPage.model.BkProduct;
import foodelicious.backend.reportPage.repository.BkReportAgeRepository;
import foodelicious.backend.reportPage.repository.BkReportArticleRepository;
import foodelicious.backend.reportPage.repository.BkReportBestsellerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


@Repository
public class BkReportAgeDaoImpl implements BkReportAgeDao{

    @Autowired
    private BkReportAgeRepository bkReportAgeRepository;

    @Autowired
    private BkReportBestsellerRepository bkReportBestsellerRepository;

    @Autowired
    private BkReportArticleRepository bkReportArticleRepository;

    public BkReportAgeDaoImpl(BkReportAgeRepository bkReportAgeRepository,
                              BkReportBestsellerRepository bkReportBestsellerRepository,
                              BkReportArticleRepository bkReportArticleRepository) {
        this.bkReportAgeRepository = bkReportAgeRepository;
        this.bkReportBestsellerRepository = bkReportBestsellerRepository;
        this.bkReportArticleRepository = bkReportArticleRepository;
    }

    public BkReportAgeDaoImpl() {
    }

    @Override
    public List countByAge(){
        //取得當前年份
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        Integer nowYear = calendar.get(Calendar.YEAR);

        //建立數據陣的列
        List list = new ArrayList();

        //計算年齡區間
        //19以下
        String age1 = Integer.toString(nowYear-19);
        String age2 = Integer.toString(nowYear+1);
        Integer num = bkReportAgeRepository.countByAge(age1, age2);
        list.add(num);

        //20~29
        String age3 = Integer.toString(nowYear-29);
        String age4 = Integer.toString(nowYear-19);
        Integer num2 = bkReportAgeRepository.countByAge(age3, age4);
        list.add(num2);

        //30~39
        String age5 = Integer.toString(nowYear-39);
        String age6 = Integer.toString(nowYear-29);
        Integer num3 = bkReportAgeRepository.countByAge(age5, age6);
        list.add(num3);

        //40~49
        String age7 = Integer.toString(nowYear-49);
        String age8 = Integer.toString(nowYear-39);
        Integer num4 = bkReportAgeRepository.countByAge(age7, age8);
        list.add(num4);

        //50~59
        String age9 = Integer.toString(nowYear-59);
        String age10 = Integer.toString(nowYear-49);
        Integer num5 = bkReportAgeRepository.countByAge(age9, age10);
        list.add(num5);

        //60以上
        String age11 = Integer.toString(nowYear-99);
        String age12 = Integer.toString(nowYear-59);
        Integer num6 = bkReportAgeRepository.countByAge(age11, age12);
        list.add(num6);
        System.out.println("age1："+age1+"，age2"+age2);
        System.out.println("age3："+age3+"，age4"+age4);
        System.out.println("age5："+age5+"，age6"+age6);
        System.out.println("age7："+age7+"，age8"+age8);
        System.out.println("age9："+age9+"，age10"+age10);
        System.out.println("age11："+age11+"，age12"+age12);
        return list;

    }

    @Override
    public List<BkProduct> topFood() {

        List<BkProduct> foods = bkReportBestsellerRepository.topFood();

        return foods;
    }

    @Override
    public List<BkProduct> topTool() {

        List<BkProduct> tools = bkReportBestsellerRepository.topTool();

        return tools;
    }

    @Override
    public List<BkReportShare> topFoodArticle() {

        List<BkReportShare> foodArticle = bkReportArticleRepository.topFoodArticle();

        return foodArticle;
    }

    @Override
    public List<BkReportShare> topToolArticle() {

        List<BkReportShare> toolArticle = bkReportArticleRepository.topToolArticle();

        return toolArticle;
    }


}

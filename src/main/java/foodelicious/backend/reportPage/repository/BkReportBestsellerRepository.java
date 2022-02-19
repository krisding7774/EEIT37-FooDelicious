package foodelicious.backend.reportPage.repository;

import foodelicious.backend.productPage.model.BkProduct;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BkReportBestsellerRepository extends CrudRepository<BkProduct, Integer> {

    @Query(value = "SELECT TOP 5* FROM productNum WHERE categories = 1 ORDER BY product_sales_figures DESC",nativeQuery = true)
    public List<BkProduct> topFood();

    @Query(value = "SELECT TOP 5* FROM productNum WHERE categories = 0 ORDER BY product_sales_figures DESC",nativeQuery = true)
    public List<BkProduct> topTool();

}

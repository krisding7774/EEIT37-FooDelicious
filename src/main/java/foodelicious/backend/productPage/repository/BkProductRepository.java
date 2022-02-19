package foodelicious.backend.productPage.repository;

import foodelicious.backend.productPage.model.BkProduct;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BkProductRepository extends CrudRepository<BkProduct, Integer> {

    @Query(value = "SELECT * FROM productNum WHERE product_name LIKE %?%",nativeQuery = true)
    List<BkProduct> findByName(String productName);

    @Query(value = "SELECT * FROM productNum WHERE product_name LIKE %?% AND categories =?",nativeQuery = true)
    List<BkProduct> findByNameAndType(String productName,Integer categories);

    @Query(value = "SELECT * FROM productNum WHERE categories =?",nativeQuery = true)
    List<BkProduct> findByType(Integer categories);
}

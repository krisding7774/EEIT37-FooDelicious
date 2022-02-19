package foodelicious.backend.productPage.repository;

import foodelicious.backend.productPage.model.BkShoppingCar;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface BkShopCartRepository extends CrudRepository<BkShoppingCar, Integer> {

    @Query(value = "SELECT * FROM shopping_cart WHERE product_id=?",nativeQuery = true)
    List<BkShoppingCar> findByProductId(Integer productId);

}

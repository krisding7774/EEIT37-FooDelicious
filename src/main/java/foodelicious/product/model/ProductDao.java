package foodelicious.product.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import foodelicious.article.model.ShareArea;
import foodelicious.backend.productPage.model.BkProduct;


@Repository
public interface ProductDao extends JpaRepository<Product, Integer> {

//	@Query(value = "select product_id from productNum product_id where productId like ?1",nativeQuery = true)
	List<Product> findByProductId(Long productId);
	
	@Query(value = "SELECT * FROM productNum WHERE product_status=1",nativeQuery = true)
	List<Product> findAll();
	
	Product findByProductName(String productName);
	
	@Query(value = "SELECT * FROM productNum WHERE product_name LIKE %?%",nativeQuery = true)
    List<Product> findAllByName(String productName);

    @Query(value = "SELECT * FROM productNum WHERE product_name LIKE %?% AND categories =?",nativeQuery = true)
    List<Product> findByNameAndType(String productName,Integer categories);

    @Query(value = "SELECT * FROM productNum WHERE product_status=1 AND categories =?",nativeQuery = true)
    List<Product> findByType(Integer categories);
    
    @Query(value = "SELECT * FROM productNum WHERE product_keywords LIKE %?%",nativeQuery = true)
    List<Product> findByProductKeywords(String productKeywords);
	
	void deleteByProductId(Long productId);
	
//	void saveProduct(Product product);
	
}


package foodelicious.cart.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import foodelicious.cart.model.CartBean;
import foodelicious.cart.model.hesitantProduct;

@Repository
public interface CartRepository extends JpaRepository<CartBean, Long> {

	List<CartBean> findAllByMemberId(Long memberId);

	void deleteByProductId(Long productId);

	@Query(value = "SELECT product_id, SUM(quantity) AS quantity FROM shopping_cart GROUP BY product_id ORDER BY quantity DESC", nativeQuery = true)
	List<hesitantProduct> hesitantProduct();

}

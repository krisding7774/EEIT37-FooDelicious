package foodelicious.cart.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import foodelicious.product.model.Product;

@Repository
public interface SearchRepository extends JpaRepository<Product, Long> {

	List<Product> findByProductNameLike(String name);

}

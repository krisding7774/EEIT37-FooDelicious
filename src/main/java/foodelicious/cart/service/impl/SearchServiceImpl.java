package foodelicious.cart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import foodelicious.cart.repository.SearchRepository;
import foodelicious.cart.service.SearchService;
import foodelicious.product.model.Product;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	SearchRepository searchRepository;

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<Product> findByProductNameLike(String productName) {
		return searchRepository.findByProductNameLike("%" + productName + "%");
	}

	@Override
	public void updateStock(Integer stock, Long productId) {
		jdbcTemplate.update("UPDATE productNum SET product_stock = ? WHERE product_id = ?", stock, productId);
	}

	@Override
	public Product getHesitantProduct(Long productId) {
		return searchRepository.findById(productId).get();
	}

	@Override
	public List<Product> findAll() {
		return searchRepository.findAll();
	}

}

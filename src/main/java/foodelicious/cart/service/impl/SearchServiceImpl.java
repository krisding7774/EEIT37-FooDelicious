package foodelicious.cart.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import foodelicious.cart.repository.SearchRepository;
import foodelicious.cart.service.SearchService;
import foodelicious.product.model.Product;

@Service
public class SearchServiceImpl implements SearchService {

	SearchRepository searchRepository;

	public SearchServiceImpl(SearchRepository searchRepository) {
		super();
		this.searchRepository = searchRepository;
	}

	@Override
	public List<Product> findByProductNameLike(String productName) {
		return searchRepository.findByProductNameLike("%" + productName + "%");
	}

	@Override
	public List<Product> findAll() {
		return searchRepository.findAll();
	}

	@Override
	public Product save(Product product) {
		return searchRepository.save(product);
	}

	@Override
	public Product getHesitantProduct(Long productId) {
		return searchRepository.findById(productId).get();
	}

}

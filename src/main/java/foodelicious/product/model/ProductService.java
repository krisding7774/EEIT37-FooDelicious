package foodelicious.product.model;



import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

	@Autowired
	private ProductDao productDao;
	//查詢
	public List<Product> findAll() {
		return productDao.findAll();
	}
	
	public List<Product> findByProductId(Long productId) {
		return productDao.findByProductId(productId);
	}
	
	public List<Product> findAllByName(String productName) {
		return productDao.findAllByName(productName);
	}
	
	public List<Product> findByNameAndType(String productName,Integer categories) {
		return productDao.findByNameAndType(productName,categories);
	}
	
	public List<Product> findByType(Integer categories) {
		return productDao.findByType(categories);
	}

	public List<Product> findByProductKeywords(String productKeywords) {
		return productDao.findByProductKeywords(productKeywords);
	}
	
	//刪除
	public void deleteByProductId(Long productId) {
		productDao.deleteByProductId(productId);
	}
	//新增
	public void saveProduct(Product product) {
		 this.productDao.save(product);
	}

	
}
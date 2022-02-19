package foodelicious.compbackend.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import foodelicious.cart.model.CartBean;
import foodelicious.cart.service.CartService;
import foodelicious.compbackend.repository.CBKProductRepository;
import foodelicious.mail.service.MailService;
import foodelicious.product.model.Product;

@Repository
@Transactional
public class CBKProductDao implements CBKProductDaoInterface {

	@PersistenceContext
	EntityManager em;

	private CBKProductRepository cbkProdRepository;
	
	private CartService cartService;
	
	private MailService mailService;
	

	public CBKProductDao(final CBKProductRepository cbkProdRepository, CartService cartService, MailService mailService) {
		this.cbkProdRepository = cbkProdRepository;
		this.cartService = cartService;
		this.mailService = mailService;
	
	}

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	// 找到所有的商品
	@Override
	public List<Product> getAllProducts(HttpSession session) {
		Long id = (Long) session.getAttribute("userID");
		List<Product> products = cbkProdRepository.findAllByProductCompanyId(id);
		return products;

	}

	// 刪除商品
	@Override
	public String deleteProduct(Long productId) {
		Product product = em.find(Product.class, productId);
		
		//先檢查購物車裡面有沒有此產品 有的話 先在購物車中刪除
		List<CartBean>  carts = cartService.selectAll();
		
		for (CartBean cart : carts) {
			if (cart.getProductId() == productId) {
				cartService.deleteItem(cart.getCartId());
				
			}
		}
		
		if (product != null) {
			em.remove(product);
			return "商品刪除成功!";
		} else {
			return "商品刪除失敗。請重新試一次。";
		}

	}

	// 商品id
	@Override
	public Product findByProductId(Long productId) {
		Product product = em.find(Product.class, productId);
		return product;
	}

	// 更新商品
	@Override
	public String updateProduct(Long productId, Product product) {
		
		String message; 
		Product newProduct = cbkProdRepository.findByProductId(productId);
		
		
		
		if (newProduct != null) {
			
			//舊價 vs 新價
			if(newProduct.getProductPrice() > product.getProductPrice()) {
				message = "在購物車的 "+ product.getProductName()+ " 商品價格降價了!! 趕快購買!";
			}else {
				message = "在購物車的 "+ product.getProductName()+ " 商品價格提高了! 還不快買?";
			}

			newProduct.setProductCompany(product.getProductCompany());
			newProduct.setProductName(product.getProductName());
			newProduct.setProductCategories_name(newProduct.getProductCategories_name());
			newProduct.setProductCategories(product.getProductCategories());
			newProduct.setProductPrice(product.getProductPrice());
			newProduct.setProductContent(product.getProductContent());
			newProduct.setProductStock(product.getProductStock());
			newProduct.setProductStatus(product.getProductStatus());
			newProduct.setProductKeywords(product.getProductKeywords());
			cbkProdRepository.save(newProduct);
			
			
			List<CartBean> carts = cartService.selectAll();
			for(CartBean cart: carts) {
				if(cart.getProductId() == productId) {
					String memberMail = cart.getMember().getMemberMail();
					mailService.sendPriceChange(memberMail, message);
				}
			}
			
			return "商品更新成功!";
		} else {

			return "商品更新失敗。請重新再試一次。";
		}

	}

	// 分類找到商品
	@Override
	public List<Product> findByType(Integer category, Long productCompanyId) {
		List<Product> catProd = cbkProdRepository.findByType(category, productCompanyId);
		return catProd;
	}

	// 名字
	@Override
	public List<Product> findByName(String productName) {

		List<Product> products = cbkProdRepository.findByName(productName);

		return products;
	}

	// 名字跟分類
	@Override
	public List<Product> findByNameAndType(String productName, Integer categories, Long productCompanyId) {
		List<Product> products = cbkProdRepository.findByNameAndType(productName, categories, productCompanyId);
		return products;
	}
	// insert商品
	@Override
	public boolean saveProduct(Product product) {
		Product theSavedProduct = cbkProdRepository.save(product);
		if (theSavedProduct != null) {
			return true;
		} else {
			return false;
		}

	}


	@Override
	public List<Product> getCompanyTopTenSellingProduct(Long companyId) {
		
		return cbkProdRepository.getCompanyTopTenSellingProduct(companyId);
	}

	// 刪除商品 (好像跟某個table有衝突 無法刪除)
//	@Override
//	public String deleteProduct(Long productId) {
//		String sql = "DELETE FROM productNum WHERE product_id = :productId";
//		Map<String, Object> map = new HashMap<>();
//		map.put("productId", productId);
//		namedParameterJdbcTemplate.update(sql, map);
//		return "刪除資料成功";
//	}

//	public List<Product> getAllProducts(Long id,HttpSession session){
//		Query query = null;
//		id = (Long)session.getAttribute("userID");
//		System.out.println(id);
//		//Long 轉換 int
//		String hqlstr = "FROM Product WHERE product_company_id=?1";
//		System.out.println(hqlstr);
//		query = em.createQuery(hqlstr)
//			    .setParameter("1", id);
//		
//		List<Product> productData = query.getResultList();
//		System.out.println(productData);
//		em.close();
//		
//		if(productData != null) {
//			
//			return productData;
//		}
//				
//
//		return null;
//	}

}

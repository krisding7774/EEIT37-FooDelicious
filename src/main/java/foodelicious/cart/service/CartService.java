package foodelicious.cart.service;

import java.util.List;

import foodelicious.cart.model.CartBean;
import foodelicious.cart.model.hesitantProduct;

public interface CartService {

	CartBean insertAndUpdateItem(CartBean cartBean);

	void deleteItem(Long cartId);

	void deleteProduct(Long productId);

	List<CartBean> selectItem(Long memberId);

	List<CartBean> selectAll();

	List<hesitantProduct> hesitantProduct();

}
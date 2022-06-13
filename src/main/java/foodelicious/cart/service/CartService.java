package foodelicious.cart.service;

import java.util.List;

import foodelicious.cart.model.CartBean;
import foodelicious.cart.model.hesitantProduct;

public interface CartService {

	CartBean insertAndUpdateItem(CartBean cartBean);

	List<CartBean> selectItem(Long memberId);

	List<hesitantProduct> hesitantProduct();

	void deleteProduct(Long productId);

	void deleteItem(Long cartId);

	List<CartBean> selectAll();

}

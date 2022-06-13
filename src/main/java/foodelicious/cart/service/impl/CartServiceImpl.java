package foodelicious.cart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import foodelicious.cart.model.CartBean;
import foodelicious.cart.model.hesitantProduct;
import foodelicious.cart.repository.CartRepository;
import foodelicious.cart.service.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartRepository cartRepository;

	@Override
	public CartBean insertAndUpdateItem(CartBean cartBean) {
		return cartRepository.save(cartBean);
	}

	@Override
	public List<CartBean> selectItem(Long memberId) {
		return cartRepository.findAllByMemberId(memberId);
	}

	@Override
	public List<hesitantProduct> hesitantProduct() {
		return cartRepository.hesitantProduct();
	}

	@Override
	public void deleteProduct(Long productId) {
		cartRepository.deleteByProductId(productId);
	}

	@Override
	public void deleteItem(Long cartId) {
		cartRepository.deleteById(cartId);
	}

	@Override
	public List<CartBean> selectAll() {
		return cartRepository.findAll();
	}

}

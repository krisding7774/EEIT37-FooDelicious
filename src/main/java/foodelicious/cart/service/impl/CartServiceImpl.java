package foodelicious.cart.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import foodelicious.cart.model.CartBean;
import foodelicious.cart.model.hesitantProduct;
import foodelicious.cart.repository.CartRepository;
import foodelicious.cart.service.CartService;

@Service
public class CartServiceImpl implements CartService {

	private CartRepository cartRepository;

	public CartServiceImpl(CartRepository cartRepository) {
		this.cartRepository = cartRepository;
	}

	@Override
	public CartBean insertAndUpdateItem(CartBean cartBean) {
		return cartRepository.save(cartBean);
	}

	@Override
	public void deleteItem(Long cartId) {
		cartRepository.deleteById(cartId);
	}

	@Override
	public void deleteProduct(Long productId) {
		cartRepository.deleteByProductId(productId);
	}

	@Override
	public List<CartBean> selectItem(Long memberId) {
		return cartRepository.findAllByMemberId(memberId);
	}

	@Override
	public List<CartBean> selectAll() {
		return cartRepository.findAll();
	}

	@Override
	public List<hesitantProduct> hesitantProduct() {
		return cartRepository.hesitantProduct();
	}

}

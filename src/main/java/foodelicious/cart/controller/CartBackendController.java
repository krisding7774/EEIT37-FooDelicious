package foodelicious.cart.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import foodelicious.cart.model.CartBean;
import foodelicious.cart.model.hesitantProduct;
import foodelicious.cart.service.CartService;
import foodelicious.cart.service.SearchService;

@RestController
public class CartBackendController {

	@Autowired
	private CartService cartService;

	@Autowired
	private SearchService searchService;

	@GetMapping("/report/cart")
	public List<CartBean> findAll() {
		List<hesitantProduct> carts = cartService.hesitantProduct();

		return carts.stream().map(cart -> new CartBean(cart.getQuantity(),
						searchService.getHesitantProduct(Long.parseLong(cart.getProduct_id()))))
				.collect(Collectors.toList());
	}

}

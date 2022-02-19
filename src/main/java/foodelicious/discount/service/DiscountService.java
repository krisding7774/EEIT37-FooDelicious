package foodelicious.discount.service;

import java.util.List;

import foodelicious.discount.model.DiscountBean;

public interface DiscountService {

	DiscountBean insertItem(DiscountBean discountBean);

	void deleteItem(Long discountId);

	List<DiscountBean> selectItem(Long memberId);

}

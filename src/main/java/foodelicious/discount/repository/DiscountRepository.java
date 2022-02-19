package foodelicious.discount.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import foodelicious.discount.model.DiscountBean;

@Repository
public interface DiscountRepository extends JpaRepository<DiscountBean, Long> {

	List<DiscountBean> findAllByMemberId(Long memberId);

}

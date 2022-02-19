package foodelicious.cashflow.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import foodelicious.cashflow.model.CashflowAddressBean;
import foodelicious.member.model.Member;

@Repository
public interface CashAddressRepository {

	List<CashflowAddressBean> deleteById(Long addressId);

	List<CashflowAddressBean> useIdfindAddress(int id);
		
	List<CashflowAddressBean> insertAndUpdateAddress(Member members);

	List<CashflowAddressBean> findAll();

	void useAddressIdDelete(Long id);

	void UpdateAddress(String commonaddress);

	void save(String commonaddress);

	void pushAddress(Map<String, String> params);

	

	
	
}

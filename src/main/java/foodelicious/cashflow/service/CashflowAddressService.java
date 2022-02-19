package foodelicious.cashflow.service;

import java.util.List;
import java.util.Map;

import foodelicious.cashflow.model.CashflowAddressBean;
import foodelicious.member.model.Member;




//@Service
public interface CashflowAddressService {
	
	List<CashflowAddressBean> findAll();

	List<CashflowAddressBean> deleteById(Long addressId);

	List<CashflowAddressBean> useIdfindAddress(int id);
		
	List<CashflowAddressBean> insertAndUpdateAddress(Member members);

	void useAddressIdDelete(Long id);

	void UpdateAddress(String commonaddress);
	
	void save(String commonaddress);

	void pushAddress(Map<String, String> params);
	

}

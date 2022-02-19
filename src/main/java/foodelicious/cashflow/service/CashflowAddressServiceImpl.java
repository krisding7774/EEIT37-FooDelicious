package foodelicious.cashflow.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import foodelicious.cashflow.model.CashflowAddressBean;
import foodelicious.cashflow.repository.CashAddressRepository;
import foodelicious.member.model.Member;
import foodelicious.member.repository.MemberRepositoryImpl;

@Service
public class CashflowAddressServiceImpl implements CashflowAddressService {

	private CashAddressRepository cashAddressRepository;

	public CashflowAddressServiceImpl(CashAddressRepository cashAddressRepository) {
		this.cashAddressRepository = cashAddressRepository;
	}

	@Override
	public List<CashflowAddressBean> deleteById(Long addressId) {
		return cashAddressRepository.deleteById(addressId);
	}

	@Override
	public List<CashflowAddressBean> useIdfindAddress(int id) {
		return cashAddressRepository.useIdfindAddress(id);
	}

	@Override
	public List<CashflowAddressBean> insertAndUpdateAddress(Member members) {
		return cashAddressRepository.insertAndUpdateAddress(members);
	}

	@Override
	public List<CashflowAddressBean> findAll() {
		return cashAddressRepository.findAll();
	}

	@Override
	public void useAddressIdDelete(Long id) {
		cashAddressRepository.useAddressIdDelete(id);		
	}

	@Override
	public void pushAddress(Map<String, String> params) {
		cashAddressRepository.pushAddress(params);	
	}

	public void UpdateAddress(String commonaddress) {
		cashAddressRepository.UpdateAddress(commonaddress);
		
	}

	@Override
	public void  save(String commonaddress) {
		 cashAddressRepository.save(commonaddress);
	}


}

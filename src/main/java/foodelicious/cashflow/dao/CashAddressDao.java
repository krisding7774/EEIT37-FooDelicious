//package foodelicious.cashflow.dao;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//import org.springframework.stereotype.Service;
//
//import foodelicious.cashflow.model.CashflowAddressBean;
//import foodelicious.cashflow.repository.CashAddressRepository;
//
//@Repository
//public class CashAddressDao {
//
//	@Autowired
//
//	private CashAddressRepository cashAR;
//	
//	public List<CashflowAddressBean> findById(Long id) {
//		
//		List<CashflowAddressBean> cashflowAB = cashAR.findAllByFkmemberid(id);
//		return cashflowAB;
//		
//	}
//	
//
//
//}

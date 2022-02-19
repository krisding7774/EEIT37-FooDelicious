package foodelicious.CustomerService.service;

import java.util.List;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import foodelicious.CustomerService.model.CustomerService;
import foodelicious.CustomerService.model.CustomerServiceDao;
import foodelicious.CustomerService.model.CustomerServiceDaoInterface;
import foodelicious.CustomerService.repository.CustomerServiceRepository;

@Service // 商業邏輯的開發
@Transactional
public class CustomerService_Service implements CustomerService_ServiceImpl{
	
	@Autowired
	private CustomerServiceDaoInterface customerServiceDao;
	
	public CustomerService_Service() {
//		this.customerServiceRepository = customerServiceRepository;
	}
	
	public boolean addProblem(CustomerService customerService) {
		var answer = customerServiceDao.addProblem(customerService);
		return answer;
	}

	public List<CustomerService> queryProblem(String email, String ptype) {
		var queryAnswer = customerServiceDao.queryProblem(email, ptype);
		return queryAnswer;
	}
	
	public CustomerService getItem(Long Id) {
		var item = customerServiceDao.getItem(Id);
		return item;
	}

	public boolean deleteProblem(Long Id) {
		var deleteAnswer = customerServiceDao.deleteProblem(Id);
		return deleteAnswer;
	}

	public boolean updateProblem(CustomerService customerService) {
		var updateAnswer = customerServiceDao.updateProblem(customerService);
		return updateAnswer;
	}


}

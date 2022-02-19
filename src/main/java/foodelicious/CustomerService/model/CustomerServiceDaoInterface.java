package foodelicious.CustomerService.model;

import java.util.List;

public interface CustomerServiceDaoInterface {

	public boolean addProblem(CustomerService customerService);
	
	public boolean updateProblem(CustomerService customerService);
	
	public boolean deleteProblem(Long Id);

	public List<CustomerService> queryProblem(String email, String ptype);

	public CustomerService getItem(Long Id);
}

package foodelicious.CustomerService.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;

import foodelicious.CustomerService.repository.CustomerServiceRepository;

@Repository
public class CustomerServiceDao implements CustomerServiceDaoInterface {
	
	
	public CustomerServiceDao(CustomerServiceRepository customerServiceRepository) {
		csrep = customerServiceRepository;
	}

	CustomerServiceRepository csrep;

	public boolean addProblem(CustomerService customerService) {
		var isSuccess = true;
		try {
			csrep.save(customerService);
		} catch (Exception e) {
			isSuccess = false;
		} 
		return isSuccess;
		
	}
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<CustomerService> queryProblem(String email, String ptype) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        
        CriteriaQuery<CustomerService> cq = cb.createQuery(CustomerService.class); 

        Root<CustomerService> root = cq.from(CustomerService.class); 
        var list = new ArrayList<Predicate>();

        if (email != "")
        {
            Predicate predEmail = cb.equal(root.get("cstm_email"), email);
           // cq.where(predEmail);
            list.add(predEmail);
            
        } else {
        	System.out.println("test response " + email);
        	Predicate predResponseMessage = cb.isNull(root.get("responseMessage"));
            //cq.where(predResponseMessage);
            list.add(predResponseMessage);

        }
        
        if (ptype != "")
        {
            Predicate predPtype = cb.equal(root.get("problem_Type"), ptype);
            //cq.where(predPtype);
            list.add(predPtype);

        } 
        Predicate[] arr = new Predicate[list.size()];
        cq.where(list.toArray(arr));
        TypedQuery<CustomerService> tq = em.createQuery(cq);
        return tq.getResultList();
	}
	
	@Override
	public CustomerService getItem(Long Id) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        
        CriteriaQuery<CustomerService> cq = cb.createQuery(CustomerService.class); 

        Root<CustomerService> root = cq.from(CustomerService.class); 

        Predicate predId = cb.equal(root.get("Id"), Id);
        cq.where(predId); 

        TypedQuery<CustomerService> tq = em.createQuery(cq);
        return tq.getSingleResult();
	}

	public boolean updateProblem(CustomerService customerService) {
		var isSuccess = true;
		try {
			csrep.save(customerService);
		} catch (Exception e) {
			isSuccess = false;
		} 
		return isSuccess;
	}

	@Override
	public boolean deleteProblem(Long Id) {
		var isSuccess = true;
		try {
			csrep.deleteById(Id);
		} catch (Exception e) {
			isSuccess = false;
		}
		return isSuccess;
	}

}

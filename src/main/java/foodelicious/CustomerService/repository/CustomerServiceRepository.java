package foodelicious.CustomerService.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import foodelicious.CustomerService.model.CustomerService;

@Repository
public interface CustomerServiceRepository extends CrudRepository<CustomerService, Long>{

}

package foodelicious.compbackend.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import foodelicious.backend.productPage.model.BkProduct;
import foodelicious.compbackend.model.CBKDetailDaoInterface;
import foodelicious.compbackend.model.CBKOrderDaoInterface;
import foodelicious.compbackend.model.CBKProblemDaoInterface;
import foodelicious.compbackend.model.CBKProductDaoInterface;
import foodelicious.compbackend.model.ProblemsBean;
import foodelicious.member.model.Member;
import foodelicious.orders.model.OrdersDetailBean;
import foodelicious.product.model.Product;

@Service
@Transactional
public class CompanyBackEndService implements CompanyBackEndServiceInterface {

	private CBKProductDaoInterface cbkProductDaoInterface;

	private CBKOrderDaoInterface cbkOrderDaoInterface;
	
	private CBKDetailDaoInterface cbkDetailDaoInterface;

	private CBKProblemDaoInterface cbkProblemDaoInterface;

	public CompanyBackEndService(final CBKProductDaoInterface cbkProductDaoInterface,
			CBKOrderDaoInterface cbkOrderDaoInterface,CBKDetailDaoInterface cbkDetailDaoInterface,CBKProblemDaoInterface cbkProblemDaoInterface) {
		this.cbkProductDaoInterface = cbkProductDaoInterface;
		this.cbkOrderDaoInterface = cbkOrderDaoInterface;
		this.cbkDetailDaoInterface = cbkDetailDaoInterface;
		this.cbkProblemDaoInterface = cbkProblemDaoInterface;
	}
	
//============Product Dao============================================

	@Override
	public List<Product> getAllProducts(HttpSession session) {
		
		return cbkProductDaoInterface.getAllProducts(session);
	}
	
	@Override
	public String deleteProduct(Long productId) {
		return cbkProductDaoInterface.deleteProduct(productId);
	}

	@Override
	public Product findByProductId(Long productId) {
		
		return cbkProductDaoInterface.findByProductId(productId);
	}
	
	@Override
	public String updateProduct(Long productId, Product product) {

		return cbkProductDaoInterface.updateProduct(productId, product);
	}

	@Override
	public List<Product> findByType(Integer categories, Long productCompanyId) {
		 
		return cbkProductDaoInterface.findByType(categories, productCompanyId);
	}
	
	@Override
	public List<Product> findByName(String productName) {
		
		return cbkProductDaoInterface.findByName(productName);
	}

	@Override
	public List<Product> findByNameAndType(String productName, Integer categories, Long productCompanyId) {
		
		return cbkProductDaoInterface.findByNameAndType(productName, categories, productCompanyId);
	}
	
	@Override
	public boolean saveProduct(Product product) {
		
		return cbkProductDaoInterface.saveProduct(product);
	}
	


	@Override
	public List<Product> getCompanyTopTenSellingProduct(Long companyId) {
		
		return cbkProductDaoInterface.getCompanyTopTenSellingProduct(companyId);
	}
	
	
//=============Detail Dao============================================================
	
	
	@Override
	public Member findByCompanyId(Long companyId) {
		
		return cbkDetailDaoInterface.findByCompanyId(companyId);
	}

	@Override
	public String updateCompanyDetail(Long companyId, Member company) {
		
		return cbkDetailDaoInterface.updateCompanyDetail(companyId, company);
	}
	
	
//============Problem Dao==========================================================================
	
	@Override
	public String insertProblem(ProblemsBean problem) {
	
		return cbkProblemDaoInterface.insertProblem(problem);
	}
	
	@Override
	public List<ProblemsBean> getAllProblems() {
		
		return cbkProblemDaoInterface.getAllProblems();
	}

	
	@Override
	public List<ProblemsBean> findAllProblemsByStatus(String status) {
		
		return cbkProblemDaoInterface.findAllProblemsByStatus(status);
	}
	

	@Override
	public List<ProblemsBean> findAllProblemsByCategory(Integer catNum) {
		
		return cbkProblemDaoInterface.findAllProblemsByCategory(catNum);
	}
	
	@Override
	public List<ProblemsBean> findAllProblemsByKeywords(String keywords) {
		
		return cbkProblemDaoInterface.findAllProblemsByKeywords(keywords);
	}
	
	@Override
	public String updateCompanyProblem(Integer problemId, ProblemsBean problem) {
		
		return cbkProblemDaoInterface.updateCompanyProblem(problemId, problem);
	}
	
	
	@Override
	public ProblemsBean findProblemById(Integer problemId) {
		
		return cbkProblemDaoInterface.findProblemById(problemId);
	}
	
	@Override
	public String updateCompanyResponse(Integer problemId, ProblemsBean problem) {
		
		return cbkProblemDaoInterface.updateCompanyResponse(problemId, problem);
	}



	
//============Order Dao=========================================================================

	@Override
	public List<OrdersDetailBean> findAllOrderByASC() {
		
		return cbkOrderDaoInterface.findAllOrderByASC();
	}




	
	
	

	
	

	

	
}

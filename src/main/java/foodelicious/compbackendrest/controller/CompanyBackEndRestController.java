package foodelicious.compbackendrest.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import foodelicious.compbackend.model.ProblemsBean;
import foodelicious.compbackend.service.CompanyBackEndServiceInterface;
import foodelicious.mail.service.MailService;
import foodelicious.member.model.Member;
import foodelicious.orders.model.OrdersDetailBean;
import foodelicious.product.model.Product;

@RestController
public class CompanyBackEndRestController {

	private final CompanyBackEndServiceInterface cbkServiceInterface;

	private final MailService mailService;

	// use the final method instead of @autowired. it's the GOOD Way of writing it
	// 跟spring DI有關 Search for spring DI 好的 壞的 醜的
	public CompanyBackEndRestController(final CompanyBackEndServiceInterface cbkServiceInterface,
			MailService mailService) {
		this.cbkServiceInterface = cbkServiceInterface;
		this.mailService = mailService;
	}

//==========CompanyProduct.jsp============================================	

	// Important! /companyProduct is controller, /companyProducts is RESTController
	@GetMapping("/companyProducts")
	public List<Product> findAllProducts(HttpSession session) {

		List<Product> products = cbkServiceInterface.getAllProducts(session);
		return products;

	}

	@GetMapping("/companyProducts/search/{categories}")
	public List<Product> findAllByName(@PathVariable Integer categories, HttpSession session) {
		Long productCompanyId = (Long) session.getAttribute("userID");
		return cbkServiceInterface.findByType(categories, productCompanyId);
	}

	@GetMapping("/companyProducts/{productName}")
	public List<Product> findAllByName(@PathVariable String productName) {
		List<Product> products = cbkServiceInterface.findByName(productName);
		return products;
	}

	@GetMapping("/companyProducts/{productName}/{categories}")
	public List<Product> findByNameAndType(@PathVariable String productName, @PathVariable Integer categories,
			HttpSession session) {
		Long productCompanyId = (Long) session.getAttribute("userID");
		List<Product> products = cbkServiceInterface.findByNameAndType(productName, categories, productCompanyId);
		return products;
	}

//============CompanyProductUpdate.jsp===========================

	@GetMapping("/companyProducts/update/{productId}")
	public Product findByProductId(@PathVariable Long productId) {

		return cbkServiceInterface.findByProductId(productId);
	}

	@PutMapping("/companyProducts/update/{productId}")
	public String updateProduct(@PathVariable Long productId, @RequestBody Product product) {
		return cbkServiceInterface.updateProduct(productId, product);
	}

	@DeleteMapping("/companyProducts/delete/{productId}")
	public String deleteProduct(@PathVariable Long productId) {

		return cbkServiceInterface.deleteProduct(productId);
	}
	
	
//================CompanyDefault.jsp (Problem report)===================================================

	@PutMapping("/companyProblemReport/{companyId}")
	public String companyProblem(@RequestBody ProblemsBean problem, HttpSession session) {

		String sender = (String) session.getAttribute("memberMail");
		String companyName = (String) session.getAttribute("userName");
		String mailSentStatus = mailService.receiveProblemReports(sender, companyName);

		return cbkServiceInterface.insertProblem(problem);
	}

//===========CompanyMain.jsp=========================================

	@GetMapping("/companyDetails")
	public Member findDetailByCompanyId(HttpSession session) {
		Long companyId = (Long) session.getAttribute("userID");
		
		return cbkServiceInterface.findByCompanyId(companyId);

	}

	@PutMapping("/companyDetailUpdate/{companyId}")
	public String updateCompanyDetail(@PathVariable Long companyId, @RequestBody Member company) {

		return cbkServiceInterface.updateCompanyDetail(companyId, company);
	}

	@GetMapping("/companyDetailUpdate/{companyId}")
	public Member getCompanyDetail(@PathVariable Long companyId, HttpSession session) {
		Member member = cbkServiceInterface.findByCompanyId(companyId);
		
		//傳新的資訊在jsp頁面
		session.setAttribute("userName", member.getMemberName());
		session.setAttribute("memberAddress", member.getMemberAddress());
		session.setAttribute("memberMail", member.getMemberMail());
		session.setAttribute("memberPhone", member.getMemberPhone());
		
		return cbkServiceInterface.findByCompanyId(companyId);
	}

//===============CompanyOrder.jsp=================================

	// this is rest controller , /companyOrder is controller
	@GetMapping("/companyOrderDetails")
	public List<OrdersDetailBean> findAllOrderByASC() {
		
	return cbkServiceInterface.findAllOrderByASC();
	}
	


	
	
//=================BackendProblemReport.jsp===================================
	
	@GetMapping("/companyProblems")
	public List<ProblemsBean> findAllProblems() {
		
		List<ProblemsBean> problems = cbkServiceInterface.getAllProblems();
		
		return problems;

	}
	
	@GetMapping("/companyProblems/status/{statusNum}")
    public List<ProblemsBean> findAllProblemsByStatus(@PathVariable Integer statusNum){
		String status;
		if(statusNum == 0) {
			status = "unresolved";
		}else {
			status = "resolved";
		}
		
        return cbkServiceInterface.findAllProblemsByStatus(status);
    }
	
	@GetMapping("/companyProblems/category/{catNum}")
    public List<ProblemsBean> findAllProblemsByCategory(@PathVariable Integer catNum){
		
	
        return cbkServiceInterface.findAllProblemsByCategory(catNum);
    }
	
	@GetMapping("/companyProblems/{keywords}")
    public List<ProblemsBean> findAllProblemsByKeywords(@PathVariable String keywords){
        return cbkServiceInterface.findAllProblemsByKeywords(keywords);
    }
	
	@GetMapping("/companyProblems/find/{problemId}")
	public ProblemsBean findProblemById(@PathVariable Integer problemId) {
		return cbkServiceInterface.findProblemById(problemId);
	}
	
	@PutMapping("/companyProblems/update/{problemId}")
	public String updateCompanyProblem(@PathVariable Integer problemId, @RequestBody ProblemsBean problem) {
		return cbkServiceInterface.updateCompanyProblem(problemId, problem);
	}
	
	@PutMapping("/companyProblemReport/response/{problemId}")
	public String updateProblemResponse(@PathVariable Integer problemId, @RequestBody ProblemsBean problem) {
		return cbkServiceInterface.updateCompanyResponse(problemId, problem);
	}
	
	//=========CompanyBestSeller.jsp===================
	
	@GetMapping("/companyBestSeller/topten")
	public List<Product> getCompanyTopTenSellingProduct(HttpSession session){
		Long companyId = (Long)session.getAttribute("userID");
		return cbkServiceInterface.getCompanyTopTenSellingProduct(companyId);
	}
	
	
	
	
	


}

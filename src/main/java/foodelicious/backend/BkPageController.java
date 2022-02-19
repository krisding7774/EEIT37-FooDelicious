package foodelicious.backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BkPageController {

	@GetMapping("/backend")
	public String main() {
		return "app.BackendMain";
	}

	@GetMapping("/backend/ProductAdd")
	public String backendProductAdd() {
		return "app.BackendProductAdd";
	}

	@GetMapping("/backend/member")
	public String backendMember() {
		return "app.BackendMember";
	}

	@GetMapping("/backend/memberUpdate")
	public String backendMemberUpdate() {
		return "app.BackendMemberUpdate";
	}

	@GetMapping("/backend/manager")
	public String BackendManager() {
		return "app.BackendManager";
	}

	@GetMapping("/backend/manager/update")
	public String BackendManagerUpdate() {
		return "app.BackendManagerUpdate";
	}

	@GetMapping("/backend/product")
	public String BackendProduct() {
		return "app.BackendProduct";
	}

	@GetMapping("/backend/product/update")
	public String BackendProductUpdate() {
		return "app.BackendProductUpdate";
	}

	@GetMapping("/backend/report/age")
	public String BackendReportAge() {
		return "app.BackendReportAge";
	}

	@GetMapping("/backend/order")
	public String BackendOrder() {
		return "app.BackendOrder";
	}

	@GetMapping("/backend/article")
	public String BackendArticle() {
		return "app.BackendArticle";
	}

	@GetMapping("/backend/order/update")
	public String BackendOrderUpdate() {
		return "app.BackendOrderUpdate";
	}

	@GetMapping("/backend/report/product")
	public String BackendReportProduct() {
		return "app.BackendReportProduct";
	}


    @GetMapping("/backend/report/article")
    public String BackendReportArticle(){
        return "app.BackendReportArticle";
    }
    
    @GetMapping("/backend/problemReport")
    public String BackendProblemReport() {
    	return "app.BackendProblemReport";
    }
    
    @GetMapping("/backend/problemReportUpdate")
    public String BackendProblemReportUpdate() {
    	return "app.BackendProblemReportUpdate";
    }
    
    @GetMapping("/backend/problemReportResponse")
    public String BackendProblemReportResponse() {
    	return "app.BackendProblemReportResponse";
    }
    
	
	@GetMapping("/backend/report/cart")
	public String BackendReportCart() {
		return "app.HesitantProduct";
	}

	@GetMapping("/backend/index")
	public String index(){
		return "app.index";
	}

}


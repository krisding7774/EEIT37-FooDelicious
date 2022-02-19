package foodelicious.cashflow.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CashFlowController {
	
	@GetMapping(path = "/CashflowList")
	public String CashflowList() {
		return "app.CashflowList";
	}
//	@GetMapping(path="/ecpay")
//	public String Ecpay() {
//		return "app.Ecpay";
//	}
	
}

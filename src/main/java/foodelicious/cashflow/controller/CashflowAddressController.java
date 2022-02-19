package foodelicious.cashflow.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CashflowAddressController {

	@GetMapping(path = "/CashFlowAddress")
	public String CasdflowAddress() {
		return "app.CashFlowAddress";
	}
	

}

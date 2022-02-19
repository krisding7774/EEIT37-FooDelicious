package foodelicious.mainpage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {

	// 首頁
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homepage() {
		return "app.index";
	}


	@GetMapping("/postArticle")
	public String goPostArticle() {
		return "app.PostArticle";
	}
		
	@RequestMapping(value="/goShareArea", method= {RequestMethod.GET, RequestMethod.DELETE})
	public String goShareArea() {
		return "app.ShareArea";
	}
	
	@GetMapping("/goArticleArea")
	public String goArticleArea() {
		return "app.ShowAtricle";
	}
	
	@GetMapping("/ProductDetail")
	public String productDetailpage() {
		return "app.ProductDetail";
	}
}

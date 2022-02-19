package foodelicious.article.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import foodelicious.article.service.ArticleService;

@RestController
public class mainPageRestController {

	ArticleService articleService;
	HttpSession session;

	public mainPageRestController(ArticleService articleService, HttpSession session) {
		super();
		this.articleService = articleService;
		this.session = session;
	}

	// 點閱率排序
	@GetMapping("/VNArticleData")
	public Map<String, Object> VNArticleData() {
		Map<String, Object> data = new HashMap<>();
		data.put("session", session.getAttribute("userID"));
		data.put("userName", session.getAttribute("userName"));
		data.put("title", articleService.findVNAll());
		return data;
	}

	// 點閱率排序-食譜相關
	@GetMapping("/VNRecipeData")
	public Map<String, Object> VNRecipeData() {
		Map<String, Object> data = new HashMap<>();
		data.put("session", session.getAttribute("userID"));
		data.put("title", articleService.findVNRecipe());
		return data;
	}

	// 點閱率排序-廚具相關
	@GetMapping("/VNKitchenwareData")
	public Map<String, Object> VNKitchenwareData() {
		Map<String, Object> data = new HashMap<>();
		data.put("session", session.getAttribute("userID"));
		data.put("title", articleService.findVNKitchenware());
		return data;
	}
	
	
}

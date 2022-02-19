package foodelicious.article.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import foodelicious.article.model.MsgArea;
import foodelicious.article.service.ArticleService;
import foodelicious.article.service.MsgService;
import foodelicious.mail.service.MailService;
import foodelicious.member.service.MemberService;

@Controller
public class ArticleController {

	ArticleService articleService;
	HttpSession session;
	MemberService memberService;
	MailService mailService;
	MsgService msgService;

	public ArticleController(ArticleService articleService, HttpSession session, MemberService memberService,
			MailService mailService, MsgService msgService) {
		this.articleService = articleService;
		this.session = session;
		this.memberService = memberService;
		this.mailService = mailService;
		this.msgService = msgService;
	}

	// 測試中
	@GetMapping("/websocket")
	public String webSocket() {
		return "app.websocket";
	}

	// 圖像綁定使用 用於CKEditor
	@ResponseBody
	@RequestMapping(path = "/imgArticle", consumes = "multipart/form-data", method = RequestMethod.POST)
	public Map<String, String> imgArticle(@RequestPart("upload") MultipartFile file, HttpServletRequest request) {
//			System.out.println("輸出測試");
//			System.out.println("file測試：" + file.getOriginalFilename());

		return new Attachment().ckEditorUploadImage(file, request);
	}

	// 新增文章 儲存用
	@PostMapping("/postarticle.controller")
	public void postArticle(@RequestBody Map<String, String> params, HttpSession session) {

		Long id = (Long) session.getAttribute("userID");
		articleService.pushArticle(params, id);
	}

	// 所有食譜相關
	@ResponseBody
	@GetMapping("/totalRecipeData")
	public Map<String, Object> totalRecipeData() {
		Map<String, Object> data = new HashMap<>();
		data.put("session", session.getAttribute("userID"));
		data.put("title", articleService.findRecipe());
		return data;
	}

	// 所有廚具相關
	@ResponseBody
	@GetMapping("/totalKitchenwareData")
	public Map<String, Object> totalKitchenwareData() {
		Map<String, Object> data = new HashMap<>();
		data.put("session", session.getAttribute("userID"));
		data.put("title", articleService.findKitchenware());
		return data;
	}

	// 顯示所有文章
	@ResponseBody
	@GetMapping("/totalArticleData")
	public Map<String, Object> totalArticleData() {
		Map<String, Object> data = new HashMap<>();
		data.put("session", session.getAttribute("userID"));
		data.put("userName", session.getAttribute("userName"));
		data.put("title", articleService.findAll());
		return data;
	}

	// 使用id顯示文章所有內容
	@ResponseBody
	@GetMapping("/responseArticle")
	public Map<String, Object> useIdFinfAll() {
		int id = (int) session.getAttribute("ArticleId");
		// System.out.println("ArticleId2： " + id);
		articleService.viewNumUpdate(id);
		Map<String, Object> data = new HashMap<>();
		data.put("LoginId", session.getAttribute("userID"));
		data.put("title", articleService.useIdFindShareArea(id));
		data.put("article", articleService.useIdFindArticleArea(id));

		return data;
	}

	// 儲存ArticleId並轉往文章顯示區域
	@GetMapping("/intIDFindAll/{id}")
	public String goSpecifyArticle(@PathVariable(value = "id", required = false) Integer id, Model model) {
		session.setAttribute("ArticleId", id);
		System.out.println("ArticleId~~~~~~~~~~~~~~~~~~"+id);
		model.addAttribute("articleContent", articleService.articleContent(id));
		// System.out.println("ArticleId： " + id);
		return "app.ShowAtricle";
	}

	// 儲存ArticleId並轉往管理者文章顯示區域
	@GetMapping("/adminIDFindAll/{id}")
	public String goAdminSpecifyArticle(@PathVariable(value = "id", required = false) Integer id, Model model) {
		session.setAttribute("ArticleId", id);
		model.addAttribute("ArticleId", id);
		model.addAttribute("articleContent", articleService.articleContent(id));
		// System.out.println("ArticleId： " + id);
		return "app.BackendArticleContent";
	}

	// 透過id刪除文章
	@ResponseBody
	@DeleteMapping("/deleteData/{id}")
	public void deleteAtricle(@PathVariable(value = "id", required = false) Integer id) {
		System.out.println(id);
		articleService.useArticleIdDelete(id);
//		Map<String, Object> data = new HashMap<>();
//		data.put("session", session.getAttribute("userID"));
//		data.put("title", articleService.findAll());
	}

	// 管理者透過id刪除文章
	@ResponseBody
	@DeleteMapping("/adminDeleteData/{id}")
	public void adminDeleteAtricle(@PathVariable(value = "id", required = false) Integer id) {
		// System.out.println(id);
		Long userID = articleService.useIdFindShareArea(id).get(0).getFk_account_id();
		String title = articleService.useIdFindShareArea(id).get(0).getArticle_title();
		String userMail = memberService.findByMemberId(userID).getMemberMail();
		articleService.useArticleIdDelete(id);
		mailService.prepareAndSend(userMail, "違反版規通知信件", "敬愛的貴賓您好 \n 您的文章『" + title + "』 \n 已違反版規 \n 該文章已刪除");
	}

	// 前往修改頁面 同時使用model 將資料轉移
	@GetMapping("/goUpdatePage")
	public String goUpdatePage(Model model) {
		int id = (int) session.getAttribute("ArticleId");
		model.addAttribute("LoginId", session.getAttribute("userID"));
		model.addAttribute("title", articleService.useIdFindShareArea(id));
		model.addAttribute("article", articleService.useIdFindArticleArea(id));
		model.addAttribute("article", articleService.useIdFindArticleArea(id));

		return "app.UpdateArticle";
	}

	// 文章更新用
	@ResponseBody
	@PutMapping("/articleUpdate/{id}")
	public void updateArticle(@RequestBody Map<String, String> params, @PathVariable("id") Integer shareId) {
		articleService.UpdateArticle(params, shareId);
	}

	// 動態搜尋
	@ResponseBody
	@GetMapping("/fuzzySearch/{clasify}/{AssociateString}")
	public Map<String, Object> FuzzySearch(@PathVariable("clasify") String clasify,
			@PathVariable("AssociateString") String AssociateString) {
		Map<String, Object> data = new HashMap<>();
		System.out.println(clasify + "&" + AssociateString);
		data.put("session", session.getAttribute("userID"));
		data.put("title", articleService.articleFuzzySearch(clasify, AssociateString));
		return data;
	}

	// 文章留言板製作
	@ResponseBody
	@PostMapping("/insertMsg")
	public void insertMsg(@RequestBody Map<String, String> params) {
		msgService.insertMsg(params);
	}

	// 顯示所有留言
	@ResponseBody
	@GetMapping("/showAllMsg/{id}")
	public Map<String, Object> showMessage(@PathVariable("id") Integer articleId) {
		Map<String, Object> data = new HashMap<>();
		data.put("msg" , msgService.useIdFindAllMSG(articleId));
		return data;
	}

	// 喜歡文章
	@ResponseBody
	@PostMapping("/likeArticle")
	public void likeOrNot(@RequestBody Map<String, String> params) {
		System.out.println("@RequestBody userId：" + params.get("userId"));
		msgService.likeOrNot(params);
		System.out.println("喜歡");
	}
	
	//取消喜歡
	@ResponseBody
	@PostMapping("/unlike")
	public void unlike(@RequestBody Map<String, String> params) {
//		System.out.println("userId：" + params.get("userId"));
//		System.out.println("articleId：" + params.get("articleId"));
		System.out.println("取消喜歡");
		msgService.unlikeArticle(params);	
		System.out.println("取消喜歡");
	}
	//判斷是否喜歡
	@ResponseBody
	@GetMapping("/checkLick/{userId}/{articleId}")
	public boolean checkLike(@PathVariable(value = "userId") Long userId, @PathVariable(value = "articleId") Integer articleId) {
		//System.out.println("userId：" + userId);
		//System.out.println("articleId!!：" + articleId);
		boolean check = msgService.checkLike(userId, articleId);
		return check;
	}
	
	//轉跳頁面用的
	@GetMapping("/userFocusePage")
	public String userFocusePage() {
		
		return "app.userFocusePage";
	}
	@ResponseBody
	@GetMapping("/focuseData")
	public Map<String, Object> focuseData() {
		Long userID = (Long) session.getAttribute("userID");
		
		Map<String, Object> data = new HashMap<>();
		data.put("session", session.getAttribute("userID"));
		data.put("userName", session.getAttribute("userName"));
		data.put("title", articleService.focuseData(userID));
		
		return data;
	}
	@ResponseBody
	@PutMapping("/updateMsg/{id}")
	public void updateMsg(@PathVariable(value = "id") Long id, @RequestBody Map<String, String> params) {
//		System.out.println("留言id："+id);
//		System.out.println("newMsgData："+params.get("msgID"));
		msgService.updateMessage(id, params.get("msgID"));
	}
	
	@DeleteMapping("/deleteMessage/{id}")
	public void deleteMessage(@PathVariable(value = "id") Long id) {
		msgService.deleteMessage(id);
	}
}

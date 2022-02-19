package foodelicious.member.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import foodelicious.member.model.Member;
import foodelicious.member.service.MemberService;
import foodelicious.member.validator.MemberValidator;

@Controller
public class MemberUpdateController {

	MemberService memberService;

	MemberValidator memberValidator;

	@Autowired
	public MemberUpdateController(MemberService memberService, MemberValidator memberValidator) {
		this.memberService = memberService;
		this.memberValidator = memberValidator;
	}

	public MemberUpdateController(MemberService memberService) {
		this.memberService = memberService;
	}

	// 刪除會員
	@DeleteMapping("/members/{memberId}")
	public String deleteById(@PathVariable(value = "memberId", required = false) Long memberId) {
		memberService.deleteByMemberId(memberId);
		return "redirect:/members";
	}
	
	//傳圖片檔
	@PostMapping("/uploadPage.Controller")
	public String uploadPage(@RequestParam("memberMail")String memberMail, HttpSession session, Model m) {
		memberService.findByMemberMail(memberMail);
		Member mb = memberService.findByMemberMail(memberMail);
		session.setAttribute("member", mb);
		m.addAttribute("圖片檔名" + mb.getMemberPic());
		return "app.memberIndex";
	}
	
	@PostMapping("/upload")
	public String upload(HttpServletRequest request, @RequestParam("file") MultipartFile file, Model m,
			HttpSession session, @RequestParam("memberMail") String memberMail){
		System.out.println("====================================");
		try {
			//根據時間建立新的檔名，即便是二次上傳相同名稱的檔案，也不會覆蓋
			String fileName = System.currentTimeMillis() + file.getOriginalFilename();
			//透過request.getServletContext().getRealPath("")獲取當前路徑，然後銜接前面的檔名 File.separator=/
			String dataFileName = request.getServletContext().getRealPath("")+ "img" +File.separator + fileName;
			//建立目錄
			File dataFile = new File(dataFileName);
			dataFile.getParentFile().mkdirs();
			//把瀏覽器上傳的檔案複製到希望的位置
			file.transferTo(dataFile);
			//把檔名放在model裡，方便之後使用
			m.addAttribute("fileName", fileName);
			
			//記錄在資料庫
			memberService.findByMemberMail(memberMail);
			Member mb = memberService.findByMemberMail(memberMail);
			System.out.println(memberMail +"========================================");
			mb.setMemberPic(fileName);
			memberService.update(mb);
			session.setAttribute("memberPic", fileName);
		} catch(FileNotFoundException e){
			e.printStackTrace();
			return "上傳失敗" + e.getMessage();
		} catch(IOException e) {
			e.printStackTrace();
			return "上傳失敗" + e.getMessage();
		}
		return "app.memberIndex";
	}
	
	//會員中心
	@GetMapping("/memberIndex")
	public String tomemberIndex() {
		return "app.memberIndex";
	}
	
	//後台更新註冊
	@GetMapping("/updatePage") // 和網址相同
	public String sendMemberDataToModified(Model model,
			@RequestParam(value = ("MemberId"), required = true) Long memberId) {// spring會讀三種： 請求參數、路徑變數、表單綁定
		Member member = memberService.findByMemberId(memberId);
		model.addAttribute("member", member);
		model.addAttribute("memberId", memberId);
		return "app.updatePage";
	}
	
	//更新會員==後台
		@PostMapping({"/members/{memberId}","/members/{userID}"}) 
		public String updateMemberDataBack(
				@Valid @ModelAttribute Member member, 
				BindingResult result, 
				@PathVariable Long memberId,
				Model model,
				RedirectAttributes ra) {
			System.out.println("pmember=" + member);

			List<ObjectError> errors = result.getAllErrors();
			for (ObjectError oe : errors) {
				System.out.println(oe.getCode() + "," + oe.getDefaultMessage() + "," + oe.getObjectName());
			}
			memberValidator.validate(member, result);// bindingResult的父介面就是Errors
			errors = result.getAllErrors();
			for(ObjectError oe: errors) {
				System.out.println("oe=>" + oe);
			}
			if (result.hasErrors()) {
				return "app.updatePage";
			}
				memberService.update(member);
				ra.addFlashAttribute("insertSuccess", "更新成功");
				return "redirect:/members";
		}
	
	@InitBinder
	public void initBinder(WebDataBinder binder, WebRequest request) {
		// java.util.Date
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		CustomDateEditor ce = new CustomDateEditor(dateFormat, true);
		binder.registerCustomEditor(java.util.Date.class, ce);
		// java.sql.Date
		DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat2.setLenient(false);
		CustomDateEditor ce2 = new CustomDateEditor(dateFormat2, true);
		binder.registerCustomEditor(java.sql.Date.class, ce2);
	}

	@ModelAttribute("member")
	public void findMember(@PathVariable(required = false) Long memberId, Model model) {// 為避免有15個欄位但只有6個更新且剩9個變成null，所以可使用此方法做前置，
//		先用pathVariable去讀所有欄位，用這個讀取的物件去接前端的6個更新欄位
		Member member;
		if (memberId != null) {
			member = memberService.findByMemberId(memberId);
		} else {
			member = new Member();
		}
	}

}
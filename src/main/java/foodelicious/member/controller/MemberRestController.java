package foodelicious.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import foodelicious.member.model.Member;
import foodelicious.member.service.MemberService;
import foodelicious.member.validator.MemberValidator;

@RestController
public class MemberRestController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	MemberValidator memberValidator;

	public MemberRestController(MemberService memberService, MemberValidator memberValidator) {
		super();
		this.memberService = memberService;
		this.memberValidator = memberValidator;
	}
	
	@GetMapping("/memberIndexes/{memberId}")
	public Member findDetailByMemberId(HttpSession session, Long memberId) {
		Long Id = (Long) session.getAttribute("userID");
		Member memberDetails = memberService.findByMemberId(Id);//
		session.setAttribute("userName", memberDetails.getMemberName());
		session.setAttribute("memberBirth", memberDetails.getMemberBirth());
		session.setAttribute("memberPhone", memberDetails.getMemberPhone());
		session.setAttribute("memberAddress", memberDetails.getMemberAddress());
		return memberDetails;
	}
	
	@PutMapping("/memberDetailUpdate/{memberId}")
	public String updateMemberDetail(@PathVariable Long memberId, @RequestBody Member member) {

		return memberService.update(memberId, member);
	}
	

}

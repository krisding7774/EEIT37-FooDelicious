package foodelicious.member.service;

import java.util.List;

import foodelicious.member.model.Member;

public interface MemberService {

	
	Member findByMemberMail(String memberMail);

	Member save(Member member);

	List<Member> findAll();

	Member findByMemberId(Long memberId);

	void update(Member member);

	void deleteByMemberId(Long memberId);

	List<Member> findByMemberMailJpa(String memberMail);

	String useIdFindEmail(Long id);

	String useIdFindName(Long memberId);

	String update(Long memberId, Member member);

}

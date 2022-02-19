package foodelicious.member.repository;

import java.util.List;

import foodelicious.member.model.Member;

public interface MemberRepository {
	
	Member save(Member member);

	Member findByMemberMail(String memberMail);

	List<Member> findAll();

	Member findByMemberId(Long memberId);

	void update(Member member);

	void deleteByMemberId(Long memberId);

	String useIdFindEmail(Long id);

	String useIdFindName(Long id);

	String update(Long memberId, Member member);
	

}

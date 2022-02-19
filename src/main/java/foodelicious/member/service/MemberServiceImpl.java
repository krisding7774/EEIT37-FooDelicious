package foodelicious.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import foodelicious.member.model.Member;
import foodelicious.member.repository.MemberJpaRepository;
import foodelicious.member.repository.MemberRepository;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	MemberRepository memberRepository;
	
	@Autowired
	MemberJpaRepository jpa;

//	@Autowired
	public MemberServiceImpl(MemberRepository memberRepository) {
		super();
		this.memberRepository = memberRepository;
	}

	@Override
	public Member save(Member member) {
		return memberRepository.save(member);
	}

	@Override
	public List<Member> findAll() {
		return memberRepository.findAll();
	}

	@Override
	public Member findByMemberId(Long memberId) {
		return memberRepository.findByMemberId(memberId);
	}
	
	@Override
	public List <Member> findByMemberMailJpa (String memberMail){
		return jpa.findByMemberMail(memberMail);
	}

	@Override
	public void update(Member member) {
		memberRepository.update(member);
	}

	@Override
	public void deleteByMemberId(Long memberId) {
		memberRepository.deleteByMemberId(memberId);
	}

	@Override
	public Member findByMemberMail(String memberMail) {
		return memberRepository.findByMemberMail(memberMail);
	}

	@Override
	public String useIdFindEmail(Long id) {
		return memberRepository.useIdFindEmail(id);
	}

	@Override
	public String useIdFindName(Long memberId) {
		return memberRepository.useIdFindName(memberId);
	}

	@Override
	public String update(Long memberId, Member member) {
		return memberRepository.update(memberId, member);
	}






}
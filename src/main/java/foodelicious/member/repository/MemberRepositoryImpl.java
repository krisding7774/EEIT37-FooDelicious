package foodelicious.member.repository;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import foodelicious.member.model.Member;

@Repository
public class MemberRepositoryImpl implements MemberRepository {

	@PersistenceContext // 類似autowired的工作
	EntityManager em;// 類似session

	@Resource
	MemberJpaRepository jpaa;

	@Override
	public Member save(Member member) {
		em.persist(member);
		return em.find(Member.class, member.getMemberId());
	}

	@Override
	public List<Member> findAll() {
//		String hql = "FROM Member";//Member類別名稱
//		List<Member> members = em.createQuery(hql, Member.class).getResultList();
		List<Member> members = jpaa.findAll();
		return members;
	}

	@Override
	public Member findByMemberId(Long memberId) {
		return em.find(Member.class, memberId);
	}

	@Override
	public void update(Member member) {
		em.merge(member);
	}

	@Override
	public void deleteByMemberId(Long memberId) {
		Member member = em.find(Member.class, memberId);
		em.remove(member);
	}

	@Override
	public Member findByMemberMail(String memberMail) {
		String hql = "FROM member_data2 m WHERE m.memberMail = :mail";
		List<Member> members = em.createQuery(hql, Member.class).setParameter("mail", memberMail).getResultList();

		if (members.size() > 0) {
			System.out.println(members.get(0));
			return members.get(0);

		} else {
			return null;
		}
	}

	@Override
	public String useIdFindEmail(Long id) {
		Member member = em.find(Member.class, id);
		return member.getMemberMail();
	}

	@Override
	public String useIdFindName(Long id) {
		Member member = em.find(Member.class, id);
		return member.getMemberName();
	}

	public String update(Long memberId, Member member) {
		Member updatedMemberDetail = jpaa.findById(memberId).orElse(null);
		System.out.println(member.getMemberId()+ "=================================");
		System.out.println(updatedMemberDetail.getMemberMail()+"==========================");

		if (updatedMemberDetail != null) {
			updatedMemberDetail.setMemberId(member.getMemberId());
			updatedMemberDetail.setMemberMail(member.getMemberMail());
			updatedMemberDetail.setPwd(member.getPwd());
			updatedMemberDetail.setMemberName(member.getMemberName());
			updatedMemberDetail.setMemberBirth(member.getMemberBirth());
			updatedMemberDetail.setMemberPhone(member.getMemberPhone());
			updatedMemberDetail.setMemberAddress(member.getMemberAddress());

			updatedMemberDetail.setMemberDiscountId(updatedMemberDetail.getMemberDiscountId());
			updatedMemberDetail.setMember_status(updatedMemberDetail.getMember_status());
			updatedMemberDetail.setMemberCoin(updatedMemberDetail.getMemberCoin());
			updatedMemberDetail.setRegister_date(updatedMemberDetail.getRegister_date());

			jpaa.save(updatedMemberDetail);

			return "更新資料成功";
		} else {
			return "更新資料失敗";
		}
	}

}

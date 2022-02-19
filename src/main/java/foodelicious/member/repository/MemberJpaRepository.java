package foodelicious.member.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import foodelicious.member.model.Member;

public interface MemberJpaRepository extends JpaRepository<Member, Long> {
	
	List <Member> findByMemberMail(String memberMail);
}

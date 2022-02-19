package foodelicious.compbackend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import foodelicious.member.model.Member;

@Repository
public interface CBKCompanyDetailRepository extends JpaRepository<Member, Long>{
	
}

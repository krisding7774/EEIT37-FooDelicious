package foodelicious.backend.reportPage.repository;

import foodelicious.backend.memberpage.model.BkMember;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BkReportAgeRepository extends CrudRepository<BkMember, Long> {

    @Query(value="SELECT count(member_birth) FROM member_data2 WHERE member_birth between ? and ?", nativeQuery = true)
    Integer countByAge(String age1, String age2);

}

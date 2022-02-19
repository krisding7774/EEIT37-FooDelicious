package foodelicious.compbackend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import foodelicious.compbackend.model.ProblemsBean;

@Repository
public interface CBKProblemRepository extends JpaRepository<ProblemsBean, Integer> {

	@Query(value = "SELECT * FROM problem_report ORDER BY problem_id DESC", nativeQuery = true)
	List<ProblemsBean> findAll();
	
	
	@Query(value = "SELECT * FROM problem_report WHERE problem_status = ? ORDER BY problem_id DESC", nativeQuery = true)
	List<ProblemsBean> findProblemsByStatus(String status);

	@Query(value = "SELECT * FROM problem_report WHERE problem_category = ? ORDER BY problem_id DESC", nativeQuery = true)
	List<ProblemsBean> findAllProblemsByCategory(Integer catNum);

	@Query(value = "SELECT * FROM problem_report WHERE problem_content LIKE %?% ORDER BY problem_id DESC" , nativeQuery = true)
	List<ProblemsBean> findAllProblemsByKeywords(String keywords);


}
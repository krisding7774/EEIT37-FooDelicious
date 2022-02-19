package foodelicious.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import foodelicious.backend.memberpage.model.AdminRowMapper;

@Repository
@Transactional
public class TotalUseEMDao {

	@PersistenceContext
	EntityManager em;

	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	// 管理登入
	public boolean checkLogin(Member users) {
		  TypedQuery<Member> member = null;
		  String hqlstr = "FROM member_data2 WHERE member_mail =:user AND pwd = :pwd";
		  member = em.createQuery(hqlstr, Member.class);
		  member.setParameter("user", users.getMemberMail());
		  member.setParameter("pwd", users.getPwd());
		  List<Member> accountData = member.getResultList();
		  boolean result = (accountData.size() != 0) ? true : false;
		  return result;
		 }

	public Long findId(Member users) {
		TypedQuery<Member> query = null;
		String hqlstr = "FROM member_data2 WHERE member_mail =:user AND pwd = :pwd";
		query = em.createQuery(hqlstr, Member.class);
		query.setParameter("user", users.getMemberMail());
		query.setParameter("pwd", users.getPwd());

		Member account = query.getSingleResult();
		em.close();
		return account.getMemberId();
	}

	public String findId2(Long id) {
		String sql = "SELECT member_status FROM member_data2 WHERE member_id =:memberId";
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", id);

		List<Member> list = namedParameterJdbcTemplate.query(sql, map, new AdminRowMapper());
		if (list.size() > 0) {
			String memberStatus = list.get(0).getMember_status();
			return memberStatus;
		} else {
			return "null";
		}

	}

}
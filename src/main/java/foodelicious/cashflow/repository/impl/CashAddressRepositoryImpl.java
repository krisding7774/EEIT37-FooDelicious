package foodelicious.cashflow.repository.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import foodelicious.article.container.ShareAreaRowMapper;
import foodelicious.article.model.ShareArea;
import foodelicious.cashflow.container.CashflowAddressRowMapper;
import foodelicious.cashflow.model.CashflowAddressBean;
import foodelicious.cashflow.repository.CashAddressRepository;
import foodelicious.member.model.Member;
import foodelicious.orders.model.OrdersBean;

@Repository
public class CashAddressRepositoryImpl implements CashAddressRepository {
	@PersistenceContext
	EntityManager em;

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	HttpSession session;

	public CashAddressRepositoryImpl(NamedParameterJdbcTemplate namedParameterJdbcTemplate,HttpSession session) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
		this.session = session;
	}


	@Override
	public List<CashflowAddressBean> useIdfindAddress(int id) {
		String hql = "SELECT * FROM cashflow_address WHERE member_id = :id";
		Map<String, Object> AllData = new HashMap<>();
		AllData.put("id", id);
		List<CashflowAddressBean> list = namedParameterJdbcTemplate.query(hql, AllData, new CashflowAddressRowMapper());
		return list;
	}


	@Override
	public List<CashflowAddressBean> deleteById(Long addressId) {
		String hql = "DELETE * FROM cashflow_address WHERE member_id = :id";
		Map<String, Object> AllData = new HashMap<>();
		AllData.put("id", addressId);
		List<CashflowAddressBean> list = namedParameterJdbcTemplate.query(hql, AllData, new CashflowAddressRowMapper());
		return list;
	}

	@Override
	public List<CashflowAddressBean> insertAndUpdateAddress(Member members) {
		String hql = "UPDATE cashflow_address SET common_address=?, WHERE member_id = :id";
		Map<String, Object> AllData = new HashMap<>();
		AllData.put("id", members);
		List<CashflowAddressBean> list = namedParameterJdbcTemplate.query(hql, AllData, new CashflowAddressRowMapper());
		return list;
	}


	@Override
	public List<CashflowAddressBean> findAll() {
		String hql = "SELECT * FROM cashflow_address";
		Map<String, Object> AllData = new HashMap<>();
		List<CashflowAddressBean> list = namedParameterJdbcTemplate.query(hql, AllData, new CashflowAddressRowMapper());
		return list;
	}


	@Override
	public void useAddressIdDelete(Long id) {
		CashflowAddressBean cashflowAddressBean = em.find(CashflowAddressBean.class, id);
		em.remove(cashflowAddressBean);
	}


	@Override
	public void UpdateAddress(String commonaddress) {
		CashflowAddressBean cashflowAddressBean = em.find(CashflowAddressBean.class, commonaddress);
		cashflowAddressBean.setCommonAddress(commonaddress);
		em.merge(cashflowAddressBean);
	}


	@Override
	public void pushAddress(Map<String, String> params) {
		System.out.println("===================");
		System.out.println(params.get("commonaddress"));
				
//		Long addressId = Long.parseLong(params.get("addressId"));
//		CashflowAddressBean cashflowAddressBean = em.find(CashflowAddressBean.class, addressId);
		
		Long memberId = (Long) session.getAttribute("userID");
		Member member = em.find(Member.class, memberId);
		
		CashflowAddressBean cashflowAddressBean = new CashflowAddressBean();

		cashflowAddressBean.setCommonAddress(params.get("commonaddress"));
		cashflowAddressBean.setMemberAddress(member.getMemberAddress());
		cashflowAddressBean.setMember(member);
		em.persist(cashflowAddressBean);
		
		
	}



	@Override
	public void save(String commonaddress) {
		CashflowAddressBean cashflowAddressBean = new CashflowAddressBean();
		cashflowAddressBean.setCommonAddress(commonaddress);
		
		em.persist(commonaddress);
		
	}

	

}

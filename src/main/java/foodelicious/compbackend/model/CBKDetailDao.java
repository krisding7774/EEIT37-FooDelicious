package foodelicious.compbackend.model;

import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import foodelicious.compbackend.repository.CBKCompanyDetailRepository;
import foodelicious.member.model.Member;
import foodelicious.product.model.Product;

@Repository
@Transactional
public class CBKDetailDao implements CBKDetailDaoInterface {
	
	@PersistenceContext
	EntityManager em;
	
	private CBKCompanyDetailRepository cbkDetailRepository;
	
	

	public CBKDetailDao(final CBKCompanyDetailRepository cbkDetailRepository) {
		this.cbkDetailRepository = cbkDetailRepository;
	}
	
	
	public Member findByCompanyId(Long companyId) {
		Member company = cbkDetailRepository.findById(companyId).orElse(null);
		if(company != null) {
			return company;
		}
		return null;
	}
	
	
	// companyMain.jsp 更新公司資料
	public String updateCompanyDetail(Long companyId, Member company) {
		//System.out.println("在這");
		
		Member updatedCompanyDetail = cbkDetailRepository.findById(companyId).orElse(null);
		//System.out.println(updatedCompanyDetail.getPwd());
		if (updatedCompanyDetail != null) {
			updatedCompanyDetail.setMemberMail(company.getMemberMail());
			updatedCompanyDetail.setMemberName(company.getMemberName());
			updatedCompanyDetail.setMemberAddress(company.getMemberAddress());
			updatedCompanyDetail.setMemberPhone(company.getMemberPhone());
			
			
			updatedCompanyDetail.setMember_status(updatedCompanyDetail.getMember_status());
			updatedCompanyDetail.setMemberId(updatedCompanyDetail.getMemberId());
			updatedCompanyDetail.setMemberBirth(updatedCompanyDetail.getMemberBirth());
			updatedCompanyDetail.setMemberGender(updatedCompanyDetail.getMemberGender());
			updatedCompanyDetail.setRegister_date(updatedCompanyDetail.getRegister_date());
			
			cbkDetailRepository.save(updatedCompanyDetail);
			
			return "更新資料成功";
		}
		else {
			return "更新資料失敗";
		}
		
	}		
	
}

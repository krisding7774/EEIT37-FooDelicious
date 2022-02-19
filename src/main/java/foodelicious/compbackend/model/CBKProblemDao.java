package foodelicious.compbackend.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import foodelicious.compbackend.repository.CBKProblemRepository;
import foodelicious.mail.service.MailService;
import foodelicious.member.service.MemberService;

@Repository
@Transactional
public class CBKProblemDao implements CBKProblemDaoInterface {

	@PersistenceContext
	EntityManager em;

	private CBKProblemRepository cbkProblemRepository;
	
	private MailService mailService;
	
	private MemberService memberService;

	public CBKProblemDao(final CBKProblemRepository cbkProblemRepository, MailService mailService, MemberService memberService) {
		this.cbkProblemRepository = cbkProblemRepository;
		this.mailService = mailService;
		this.memberService= memberService;
	}

	public String insertProblem(ProblemsBean problem) {
		if (problem != null) {

			cbkProblemRepository.save(problem);

			return "問題回報成功! 我們將盡快與您聯繫。";
		} else {

			return "問題回報失敗。請重新再試一次。";
		}

	}

	@Override
	public List<ProblemsBean> getAllProblems() {
		List<ProblemsBean> problems = cbkProblemRepository.findAll();
		return problems;
	}

	
	@Override
	public List<ProblemsBean> findAllProblemsByStatus(String status) {
		
		return cbkProblemRepository.findProblemsByStatus(status);
	}

	@Override
	public List<ProblemsBean> findAllProblemsByCategory(Integer catNum) {
		
		return cbkProblemRepository.findAllProblemsByCategory(catNum);
	}

	@Override
	public List<ProblemsBean> findAllProblemsByKeywords(String keywords) {
		
		return cbkProblemRepository.findAllProblemsByKeywords(keywords);
	}

	//更新問題狀態存入資料庫中
	@Override
	public String updateCompanyProblem(Integer problemId, ProblemsBean problem) {
		ProblemsBean updatedProblem = em.find(ProblemsBean.class, problemId);
		if(updatedProblem != null) {
			updatedProblem.setProblemStatus(problem.getProblemStatus());
			cbkProblemRepository.save(updatedProblem);
			return "問題回報狀態更新成功!";
		}
		return "找不到問題，請重新來過。";
	}
	
	//更新問題狀態前先找到更新前的資料
	@Override
	public ProblemsBean findProblemById(Integer problemId) {
		ProblemsBean problem = em.find(ProblemsBean.class, problemId);
		return problem;
	}

	
	//後臺回覆廠商問題
	@Override
	public String updateCompanyResponse(Integer problemId, ProblemsBean problem) {
		ProblemsBean updatedProblemResponse = em.find(ProblemsBean.class, problemId);
		Long companyId;
		if(updatedProblemResponse != null) {
			companyId = updatedProblemResponse.getCompanyId();
			updatedProblemResponse.setProblemResponse(problem.getProblemResponse());
			cbkProblemRepository.save(updatedProblemResponse);
			
			Date date = new Date();

			Timestamp timeStamp = new Timestamp(date.getTime());

			String mail = memberService.findByMemberId(companyId).getMemberMail();
			
			SimpleDateFormat dateFormatAll = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			 mailService.prepareAndSend(mail, "[FooDelicious 好煮意]\t" + dateFormatAll.format(timeStamp) + "\t已回覆您的問題",
						 "\n廠商問題：" + updatedProblemResponse.getProblemContent() + "\n後台回覆："
						+ updatedProblemResponse.getProblemResponse());
			
			return "問題回覆成功";
		}
		return "問題回覆失敗。請重新來過。";
	}


}

package foodelicious.compbackend.model;

import java.util.List;

import foodelicious.backend.productPage.model.BkProduct;

public interface CBKProblemDaoInterface {

	public String insertProblem(ProblemsBean problem);

	public List<ProblemsBean> getAllProblems();


	public List<ProblemsBean> findAllProblemsByStatus(String status);

	public List<ProblemsBean> findAllProblemsByCategory(Integer catNum);

	public List<ProblemsBean> findAllProblemsByKeywords(String keywords);

	public String updateCompanyProblem(Integer problemId, ProblemsBean problem);

	public ProblemsBean findProblemById(Integer problemId);

	public String updateCompanyResponse(Integer problemId, ProblemsBean problem);
}

package foodelicious.article.repository.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import foodelicious.article.container.ArticleRowMapper;
import foodelicious.article.container.ShareAreaRowMapper;
import foodelicious.article.model.ArticleData;
import foodelicious.article.model.ShareArea;
import foodelicious.article.repository.ArticleRepository;
import foodelicious.article.service.MsgService;
import foodelicious.member.model.Member;

@Repository
public class ArticleRepositoryImpl implements ArticleRepository {
	@PersistenceContext
	EntityManager em;

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	MsgService msgService;
	HttpSession session;

	public ArticleRepositoryImpl(NamedParameterJdbcTemplate namedParameterJdbcTemplate, MsgService msgService,
			HttpSession session) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
		this.msgService = msgService;
		this.session = session;
	}

	@Override
	public void pushArticle(Map<String, String> params, Long id) {
		// 用session.get的方法 用id 去找到對應的Account.class 並且將其命名為 account 參數
		// =========引用到舊的Account先註解===========
		Member member = em.find(Member.class, id);

		// ArticleData與 ShareArea的關係是「一對一」ArticleData(外來鍵)與 ShareArea(主鍵)
		ArticleData articleData = new ArticleData();
		articleData.setArticle(params.get("article"));

		ShareArea shareArea = new ShareArea();
		shareArea.setArticle_clallify(params.get("classify"));
		shareArea.setArticle_title(params.get("title"));

		// Member 與 ShareArea 的關係是一對多
		// 在ArticleData與 ShareArea資料傳輸給SQL前 還要設定好一對多的部分

		// =========引用到舊的Account先註解===========
		shareArea.setMember(member);

		// ShareArea 與 Account的關係明確後 最後再與ArticleData的關係做明確的設定
		articleData.setShareArea(shareArea);

		// 儲存
		em.persist(articleData);
		em.close();
	}

	@Override
	public List<ShareArea> findAll() {
		// 這寫法要用傳統SQL寫法
		String hql = "SELECT * FROM share_area  ORDER BY share_id DESC";

		Map<String, Object> AllData = new HashMap<>();

		List<ShareArea> list = namedParameterJdbcTemplate.query(hql, AllData, new ShareAreaRowMapper());

		return list;
	}

	@Override
	public List<ShareArea> useIdFindShareArea(int id) {
		String hql = "SELECT * FROM share_area WHERE share_id = :id";
		Map<String, Object> AllData = new HashMap<>();
		AllData.put("id", id);
		List<ShareArea> list = namedParameterJdbcTemplate.query(hql, AllData, new ShareAreaRowMapper());

		return list;
	}

	@Override
	public List<ArticleData> useIdFindArticleArea(int id) {
		String hql = "SELECT * FROM article_data WHERE fk_share_id = :id";
		Map<String, Object> AllData = new HashMap<>();
		AllData.put("id", id);
		List<ArticleData> list = namedParameterJdbcTemplate.query(hql, AllData, new ArticleRowMapper());

		return list;
	}

	@Override
	public void useArticleIdDelete(int id) {
		String hql;
		Long userID = (Long) session.getAttribute("userID");
		//判斷有沒有喜歡的 有的話先刪除所有有喜歡的
		if (msgService.checkLike(userID, id)) {
			hql = "DELETE FROM LikeOrNot WHERE fk_articleID = :articleID";
			em.createQuery(hql).setParameter("articleID", id).executeUpdate();
		}
		hql = "DELETE FROM MsgArea WHERE fk_article_id = :articleID";
		em.createQuery(hql).setParameter("articleID", id).executeUpdate();
		
		hql = "DELETE FROM ArticleData WHERE fk_share_id = :articleID";
		em.createQuery(hql).setParameter("articleID", id).executeUpdate();
		
		hql = "DELETE FROM ShareArea WHERE share_id = :articleID";
		em.createQuery(hql).setParameter("articleID", id).executeUpdate();
	}

	@Override
	public void UpdateArticle(Map<String, String> params, int id) {
		// 先對應到外來件資料 id的部份有primary限制
		ArticleData updateArticle = em.find(ArticleData.class, id);
		updateArticle.setArticle(params.get("article"));

		em.merge(updateArticle);
	}

	@Override
	public List<ShareArea> findRecipe() {
		String hql = "SELECT * FROM share_area WHERE article_clallify = '食譜分享' ORDER BY share_id DESC";
		Map<String, Object> AllData = new HashMap<>();

		List<ShareArea> list = namedParameterJdbcTemplate.query(hql, AllData, new ShareAreaRowMapper());

		return list;
	}

	@Override
	public List<ShareArea> findKitchenware() {
		String hql = "SELECT * FROM share_area WHERE article_clallify = '廚具開箱' ORDER BY share_id DESC";
		Map<String, Object> AllData = new HashMap<>();

		List<ShareArea> list = namedParameterJdbcTemplate.query(hql, AllData, new ShareAreaRowMapper());

		return list;
	}

	@Override
	public List<ShareArea> articleFuzzySearch(String clasify, String associateString) {
		if (clasify.equals("全部文章")) {
			System.out.println("全部文章導入");
			return OneArticleFuzzySearch(associateString);
		}
		String hql = "SELECT * FROM share_area WHERE article_clallify = :clallify AND article_title LIKE :title";
		Map<String, Object> AllData = new HashMap<>();
		AllData.put("clallify", clasify);
		AllData.put("title", '%' + associateString + '%');
		List<ShareArea> list = namedParameterJdbcTemplate.query(hql, AllData, new ShareAreaRowMapper());
		return list;
	}

	@Override
	public List<ShareArea> OneArticleFuzzySearch(String associateString) {
		String hql = "SELECT * FROM share_area WHERE article_title LIKE :title";
		Map<String, Object> AllData = new HashMap<>();
		AllData.put("title", '%' + associateString + '%');
		List<ShareArea> list = namedParameterJdbcTemplate.query(hql, AllData, new ShareAreaRowMapper());
		System.out.println(list);
		return list;
	}

	@Override
	public void viewNumUpdate(Integer ArticleId) {
		ShareArea shareArea = em.find(ShareArea.class, ArticleId);
		shareArea.setViewNum(shareArea.getViewNum() + 1);
		em.merge(shareArea);
	}

	@Override
	public String articleContent(Integer id) {
		String hql = "SELECT * FROM article_data WHERE fk_share_id = :id";		
		Map<String, Object> AllData = new HashMap<>();
		AllData.put("id", id);
		List<ArticleData> list = namedParameterJdbcTemplate.query(hql, AllData, new ArticleRowMapper());
		list.get(0).getArticle();
		return list.get(0).getArticle();
	}

	@Override
	public List<ShareArea> findVNAll() {
		String hql = "SELECT * FROM share_area  ORDER BY viewNum DESC";
		Map<String, Object> AllData = new HashMap<>();
		List<ShareArea> list = namedParameterJdbcTemplate.query(hql, AllData, new ShareAreaRowMapper());
		return list;
	}

	@Override
	public List<ShareArea> findVNRecipe() {
		String hql = "SELECT * FROM share_area WHERE article_clallify = '食譜分享' ORDER BY viewNum DESC";
		Map<String, Object> AllData = new HashMap<>();
		List<ShareArea> list = namedParameterJdbcTemplate.query(hql, AllData, new ShareAreaRowMapper());

		return list;
	}

	@Override
	public List<ShareArea> findVNKitchenware() {
		String hql = "SELECT * FROM share_area WHERE article_clallify = '廚具開箱' ORDER BY viewNum DESC";
		Map<String, Object> AllData = new HashMap<>();
		List<ShareArea> list = namedParameterJdbcTemplate.query(hql, AllData, new ShareAreaRowMapper());
		return list;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<ShareArea> focuseData(Long userID) {
		String hql = " SELECT sare.share_id, sare.article_clallify, sare.article_title "
				+ " FROM LikeOrNot JOIN ShareArea sare ON fk_articleID = share_id "
				+ " WHERE fk_memberID = :userID"
				+ " ORDER BY share_id DESC";
		
		Query query = em.createQuery(hql);
		query.setParameter("userID", userID);
		List<Object[]> shareAres = query.getResultList();
		List<ShareArea> list= new ArrayList<ShareArea>();
		
		Iterator it = shareAres.iterator();
		while(it.hasNext()) {
			Object[] line = (Object[]) it.next();
			ShareArea share = new ShareArea();
//			System.out.println(line[0]);
//			System.out.println(line[1]);
//			System.out.println(line[2]);
			share.setShare_id((int) line[0]);
			share.setArticle_clallify((String)line[1]);
			share.setArticle_title((String)line[2]);
			list.add(share);
		}
		
		return list;
	}

}
